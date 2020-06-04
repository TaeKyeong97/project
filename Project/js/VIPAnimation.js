var canvas, stage, exportRoot, anim_container, dom_overlay_container, fnStartAnimation;
    function init() {
    	canvas = document.getElementById("canvas");
    	anim_container = document.getElementById("animation_container");
    	dom_overlay_container = document.getElementById("dom_overlay_container");
    	var comp=AdobeAn.getComposition("2F178E3B458CA146BCA020AB48F47589");
    	var lib=comp.getLibrary();
    	var loader = new createjs.LoadQueue(false);
    	loader.addEventListener("fileload", function(evt){handleFileLoad(evt,comp)});
    	loader.addEventListener("complete", function(evt){handleComplete(evt,comp)});
    	var lib=comp.getLibrary();
    	loader.loadManifest(lib.properties.manifest);
    }
    function handleFileLoad(evt, comp) {
    	var images=comp.getImages();
    	if (evt && (evt.item.type == "image")) { images[evt.item.id] = evt.result; }
    }
    function handleComplete(evt,comp) {
    	//This function is always called, irrespective of the content. You can use the variable "stage" after it is created in token create_stage.
    	var lib=comp.getLibrary();
    	var ss=comp.getSpriteSheet();
    	var queue = evt.target;
    	var ssMetadata = lib.ssMetadata;
    	for(i=0; i<ssMetadata.length; i++) {
    		ss[ssMetadata[i].name] = new createjs.SpriteSheet( {"images": [queue.getResult(ssMetadata[i].name)], "frames": ssMetadata[i].frames} )
    	}
    	exportRoot = new lib.VIP애니메이션2_HTML5Canvas();
    	stage = new lib.Stage(canvas);
    	//Registers the "tick" event listener.
    	fnStartAnimation = function() {
    		stage.addChild(exportRoot);
    		createjs.Ticker.setFPS(lib.properties.fps);
    		createjs.Ticker.addEventListener("tick", stage)
    		stage.addEventListener("tick", handleTick)
    		function getProjectionMatrix(container, totalDepth) {
    			var focalLength = 528.25;
    			var projectionCenter = { x : lib.properties.width/2, y : lib.properties.height/2 };
    			var scale = (totalDepth + focalLength)/focalLength;
    			var scaleMat = new createjs.Matrix2D;
    			scaleMat.a = 1/scale;
    			scaleMat.d = 1/scale;
    			var projMat = new createjs.Matrix2D;
    			projMat.tx = -projectionCenter.x;
    			projMat.ty = -projectionCenter.y;
    			projMat = projMat.prependMatrix(scaleMat);
    			projMat.tx += projectionCenter.x;
    			projMat.ty += projectionCenter.y;
    			return projMat;
    		}
    		function handleTick(event) {
    			var cameraInstance = exportRoot.___camera___instance;
    			if(cameraInstance !== undefined && cameraInstance.pinToObject !== undefined)
    			{
    				cameraInstance.x = cameraInstance.pinToObject.x + cameraInstance.pinToObject.pinOffsetX;
    				cameraInstance.y = cameraInstance.pinToObject.y + cameraInstance.pinToObject.pinOffsetY;
    				if(cameraInstance.pinToObject.parent !== undefined && cameraInstance.pinToObject.parent.depth !== undefined)
    				cameraInstance.depth = cameraInstance.pinToObject.parent.depth + cameraInstance.pinToObject.pinOffsetZ;
    			}
    			applyLayerZDepth(exportRoot);
    		}
    		function applyLayerZDepth(parent)
    		{
    			var cameraInstance = parent.___camera___instance;
    			var focalLength = 528.25;
    			var projectionCenter = { 'x' : 0, 'y' : 0};
    			if(parent === exportRoot)
    			{
    				var stageCenter = { 'x' : lib.properties.width/2, 'y' : lib.properties.height/2 };
    				projectionCenter.x = stageCenter.x;
    				projectionCenter.y = stageCenter.y;
    			}
    			for(child in parent.children)
    			{
    				var layerObj = parent.children[child];
    				if(layerObj == cameraInstance)
    					continue;
    				applyLayerZDepth(layerObj, cameraInstance);
    				if(layerObj.layerDepth === undefined)
    					continue;
    				if(layerObj.currentFrame != layerObj.parent.currentFrame)
    				{
    					layerObj.gotoAndPlay(layerObj.parent.currentFrame);
    				}
    				var matToApply = new createjs.Matrix2D;
    				var cameraMat = new createjs.Matrix2D;
    				var totalDepth = layerObj.layerDepth ? layerObj.layerDepth : 0;
    				var cameraDepth = 0;
    				if(cameraInstance && !layerObj.isAttachedToCamera)
    				{
    					var mat = cameraInstance.getMatrix();
    					mat.tx -= projectionCenter.x;
    					mat.ty -= projectionCenter.y;
    					cameraMat = mat.invert();
    					cameraMat.prependTransform(projectionCenter.x, projectionCenter.y, 1, 1, 0, 0, 0, 0, 0);
    					cameraMat.appendTransform(-projectionCenter.x, -projectionCenter.y, 1, 1, 0, 0, 0, 0, 0);
    					if(cameraInstance.depth)
    						cameraDepth = cameraInstance.depth;
    				}
    				if(layerObj.depth)
    				{
    					totalDepth = layerObj.depth;
    				}
    				//Offset by camera depth
    				totalDepth -= cameraDepth;
    				if(totalDepth < -focalLength)
    				{
    					matToApply.a = 0;
    					matToApply.d = 0;
    				}
    				else
    				{
    					if(layerObj.layerDepth)
    					{
    						var sizeLockedMat = getProjectionMatrix(parent, layerObj.layerDepth);
    						if(sizeLockedMat)
    						{
    							sizeLockedMat.invert();
    							matToApply.prependMatrix(sizeLockedMat);
    						}
    					}
    					matToApply.prependMatrix(cameraMat);
    					var projMat = getProjectionMatrix(parent, totalDepth);
    					if(projMat)
    					{
    						matToApply.prependMatrix(projMat);
    					}
    				}
    				layerObj.transformMatrix = matToApply;
    			}
    		}
    	}
    	//Code to support hidpi screens and responsive scaling.
    	function makeResponsive(isResp, respDim, isScale, scaleType) {
    		var lastW, lastH, lastS=1;
    		window.addEventListener('resize', resizeCanvas);
    		resizeCanvas();
    		function resizeCanvas() {
    			var w = lib.properties.width, h = lib.properties.height;
    			var iw = window.innerWidth, ih=window.innerHeight;
    			var pRatio = window.devicePixelRatio || 1, xRatio=iw/w, yRatio=ih/h, sRatio=1;
    			if(isResp) {
    				if((respDim=='width'&&lastW==iw) || (respDim=='height'&&lastH==ih)) {
    					sRatio = lastS;
    				}
    				else if(!isScale) {
    					if(iw<w || ih<h)
    						sRatio = Math.min(xRatio, yRatio);
    				}
    				else if(scaleType==1) {
    					sRatio = Math.min(xRatio, yRatio);
    				}
    				else if(scaleType==2) {
    					sRatio = Math.max(xRatio, yRatio);
    				}
    			}
    			canvas.width = w*pRatio*sRatio;
    			canvas.height = h*pRatio*sRatio;
    			//canvas.style.width = dom_overlay_container.style.width = anim_container.style.width =  w*sRatio+'px';
    			//canvas.style.height = anim_container.style.height = dom_overlay_container.style.height = h*sRatio+'px';
    			stage.scaleX = pRatio*sRatio;
    			stage.scaleY = pRatio*sRatio;
    			lastW = iw; lastH = ih; lastS = sRatio;
    			stage.tickOnUpdate = false;
    			stage.update();
    			stage.tickOnUpdate = true;
    		}
    	}
    	makeResponsive(false,'both',false,1);
    	AdobeAn.compositionLoaded(lib.properties.id);
    	fnStartAnimation();
    }


(function (cjs, an) {

var p; // shortcut to reference prototypes
var lib={};var ss={};var img={};
lib.ssMetadata = [
		{name:"VIP 애니메이션2_HTML5 Canvas_atlas_", frames: [[662,536,660,534],[1324,536,660,534],[662,0,660,534],[0,0,660,534],[0,1072,660,534],[1324,0,660,534],[0,536,660,534],[1324,1072,660,534],[662,1072,660,534]]},
		{name:"VIP 애니메이션2_HTML5 Canvas_atlas_2", frames: [[662,536,660,534],[1324,0,660,534],[0,536,660,534],[662,0,660,534],[0,0,660,534]]}
];


// symbols:



(lib._00 = function() {
	this.initialize(ss["VIP 애니메이션2_HTML5 Canvas_atlas_"]);
	this.gotoAndStop(0);
}).prototype = p = new cjs.Sprite();



(lib._01png복사본2 = function() {
	this.initialize(ss["VIP 애니메이션2_HTML5 Canvas_atlas_"]);
	this.gotoAndStop(1);
}).prototype = p = new cjs.Sprite();



(lib._02png복사본 = function() {
	this.initialize(ss["VIP 애니메이션2_HTML5 Canvas_atlas_"]);
	this.gotoAndStop(2);
}).prototype = p = new cjs.Sprite();



(lib._03png복사본 = function() {
	this.initialize(ss["VIP 애니메이션2_HTML5 Canvas_atlas_"]);
	this.gotoAndStop(3);
}).prototype = p = new cjs.Sprite();



(lib._04png복사본 = function() {
	this.initialize(ss["VIP 애니메이션2_HTML5 Canvas_atlas_"]);
	this.gotoAndStop(4);
}).prototype = p = new cjs.Sprite();



(lib._05png복사본 = function() {
	this.initialize(ss["VIP 애니메이션2_HTML5 Canvas_atlas_"]);
	this.gotoAndStop(5);
}).prototype = p = new cjs.Sprite();



(lib._06png복사본2 = function() {
	this.initialize(ss["VIP 애니메이션2_HTML5 Canvas_atlas_"]);
	this.gotoAndStop(6);
}).prototype = p = new cjs.Sprite();



(lib._07png복사본2 = function() {
	this.initialize(ss["VIP 애니메이션2_HTML5 Canvas_atlas_"]);
	this.gotoAndStop(7);
}).prototype = p = new cjs.Sprite();



(lib._08 = function() {
	this.initialize(ss["VIP 애니메이션2_HTML5 Canvas_atlas_"]);
	this.gotoAndStop(8);
}).prototype = p = new cjs.Sprite();



(lib._09png복사본2 = function() {
	this.initialize(ss["VIP 애니메이션2_HTML5 Canvas_atlas_2"]);
	this.gotoAndStop(0);
}).prototype = p = new cjs.Sprite();



(lib._12 = function() {
	this.initialize(ss["VIP 애니메이션2_HTML5 Canvas_atlas_2"]);
	this.gotoAndStop(1);
}).prototype = p = new cjs.Sprite();



(lib._13 = function() {
	this.initialize(ss["VIP 애니메이션2_HTML5 Canvas_atlas_2"]);
	this.gotoAndStop(2);
}).prototype = p = new cjs.Sprite();



(lib._14 = function() {
	this.initialize(ss["VIP 애니메이션2_HTML5 Canvas_atlas_2"]);
	this.gotoAndStop(3);
}).prototype = p = new cjs.Sprite();



(lib._15 = function() {
	this.initialize(ss["VIP 애니메이션2_HTML5 Canvas_atlas_2"]);
	this.gotoAndStop(4);
}).prototype = p = new cjs.Sprite();



(lib.트윈31 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// 레이어_1
	this.instance = new lib._14();
	this.instance.parent = this;
	this.instance.setTransform(-330,-267);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-330,-267,660,534);


(lib.트윈30 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// 레이어_1
	this.instance = new lib._14();
	this.instance.parent = this;
	this.instance.setTransform(-330,-267);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-330,-267,660,534);


(lib.트윈29 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// 레이어_1
	this.instance = new lib._13();
	this.instance.parent = this;
	this.instance.setTransform(-330,-267);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-330,-267,660,534);


(lib.트윈28 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// 레이어_1
	this.instance = new lib._13();
	this.instance.parent = this;
	this.instance.setTransform(-330,-267);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-330,-267,660,534);


(lib.트윈27 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// 레이어_1
	this.instance = new lib._12();
	this.instance.parent = this;
	this.instance.setTransform(-330,-267);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-330,-267,660,534);


(lib.트윈26 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// 레이어_1
	this.instance = new lib._12();
	this.instance.parent = this;
	this.instance.setTransform(-330,-267);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-330,-267,660,534);


(lib.트윈25 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// 레이어_1
	this.instance = new lib._08();
	this.instance.parent = this;
	this.instance.setTransform(-330,-267);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-330,-267,660,534);


(lib.트윈24 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// 레이어_1
	this.instance = new lib._08();
	this.instance.parent = this;
	this.instance.setTransform(-330,-267);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-330,-267,660,534);


(lib.트윈23 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// 레이어_1
	this.instance = new lib._05png복사본();
	this.instance.parent = this;
	this.instance.setTransform(-330,-267);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-330,-267,660,534);


(lib.트윈22 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// 레이어_1
	this.instance = new lib._06png복사본2();
	this.instance.parent = this;
	this.instance.setTransform(-330,-267);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-330,-267,660,534);


(lib.트윈21 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// 레이어_1
	this.instance = new lib._06png복사본2();
	this.instance.parent = this;
	this.instance.setTransform(-330,-267);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-330,-267,660,534);


(lib.트윈20 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// 레이어_1
	this.instance = new lib._06png복사본2();
	this.instance.parent = this;
	this.instance.setTransform(-330,-267);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-330,-267,660,534);


(lib.트윈19 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// 레이어_1
	this.instance = new lib._05png복사본();
	this.instance.parent = this;
	this.instance.setTransform(-330,-267);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-330,-267,660,534);


(lib.트윈18 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// 레이어_1
	this.instance = new lib._05png복사본();
	this.instance.parent = this;
	this.instance.setTransform(-330,-267);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-330,-267,660,534);


(lib.트윈17 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// 레이어_1
	this.instance = new lib._04png복사본();
	this.instance.parent = this;
	this.instance.setTransform(-330,-267);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-330,-267,660,534);


(lib.트윈16 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// 레이어_1
	this.instance = new lib._04png복사본();
	this.instance.parent = this;
	this.instance.setTransform(-330,-267);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-330,-267,660,534);


(lib.트윈15 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// 레이어_1
	this.instance = new lib._04png복사본();
	this.instance.parent = this;
	this.instance.setTransform(-330,-267);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-330,-267,660,534);


(lib.트윈14 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// 레이어_1
	this.instance = new lib._03png복사본();
	this.instance.parent = this;
	this.instance.setTransform(-330,-267);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-330,-267,660,534);


(lib.트윈13 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// 레이어_1
	this.instance = new lib._03png복사본();
	this.instance.parent = this;
	this.instance.setTransform(-330,-267);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-330,-267,660,534);


(lib.트윈12 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// 레이어_1
	this.instance = new lib._03png복사본();
	this.instance.parent = this;
	this.instance.setTransform(-330,-267);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-330,-267,660,534);


(lib.트윈11 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// 레이어_1
	this.instance = new lib._02png복사본();
	this.instance.parent = this;
	this.instance.setTransform(-330,-267);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-330,-267,660,534);


(lib.트윈10 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// 레이어_1
	this.instance = new lib._02png복사본();
	this.instance.parent = this;
	this.instance.setTransform(-330,-267);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-330,-267,660,534);


(lib.트윈9 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// 레이어_1
	this.instance = new lib._02png복사본();
	this.instance.parent = this;
	this.instance.setTransform(-330,-267);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-330,-267,660,534);


(lib.트윈8 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// 레이어_1
	this.instance = new lib._01png복사본2();
	this.instance.parent = this;
	this.instance.setTransform(-330,-267);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-330,-267,660,534);


(lib.트윈7 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// 레이어_1
	this.instance = new lib._01png복사본2();
	this.instance.parent = this;
	this.instance.setTransform(-330,-267);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-330,-267,660,534);


(lib.트윈6 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// 레이어_1
	this.instance = new lib._01png복사본2();
	this.instance.parent = this;
	this.instance.setTransform(-330,-267);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-330,-267,660,534);


(lib.트윈5 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// 레이어_1
	this.instance = new lib._00();
	this.instance.parent = this;
	this.instance.setTransform(-330,-267);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-330,-267,660,534);


(lib.트윈4 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// 레이어_1
	this.instance = new lib._00();
	this.instance.parent = this;
	this.instance.setTransform(-330,-267);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-330,-267,660,534);


(lib.트윈3 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// 레이어_1
	this.instance = new lib._00();
	this.instance.parent = this;
	this.instance.setTransform(-330,-267);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(1));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(-330,-267,660,534);


(lib.장면_1__15 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// _15
	this.instance = new lib._15();
	this.instance.parent = this;
	this.instance.setTransform(326,73);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(77));

}).prototype = p = new cjs.MovieClip();


(lib.장면_1__9 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// _9
	this.instance = new lib._09png복사본2();
	this.instance.parent = this;
	this.instance.setTransform(333,72);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(77));

}).prototype = p = new cjs.MovieClip();


(lib.장면_1__7 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// _7
	this.instance = new lib._07png복사본2();
	this.instance.parent = this;
	this.instance.setTransform(325,48);

	this.timeline.addTween(cjs.Tween.get(this.instance).wait(77));

}).prototype = p = new cjs.MovieClip();


(lib.장면_1__14 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// _14
	this.instance = new lib._14();
	this.instance.parent = this;
	this.instance.setTransform(330,72);

	this.instance_1 = new lib.트윈30("synched",0);
	this.instance_1.parent = this;
	this.instance_1.setTransform(660,339);
	this.instance_1._off = true;

	this.instance_2 = new lib.트윈31("synched",0);
	this.instance_2.parent = this;
	this.instance_2.setTransform(660,339);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[{t:this.instance}]}).to({state:[{t:this.instance_1}]},46).to({state:[{t:this.instance_2}]},11).to({state:[{t:this.instance}]},19).wait(1));
	this.timeline.addTween(cjs.Tween.get(this.instance_1).wait(46).to({_off:false},0).to({_off:true},11).wait(20));

}).prototype = p = new cjs.MovieClip();


(lib.장면_1__13 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// _13
	this.instance = new lib._13();
	this.instance.parent = this;
	this.instance.setTransform(334,74);

	this.instance_1 = new lib.트윈28("synched",0);
	this.instance_1.parent = this;
	this.instance_1.setTransform(664,341);
	this.instance_1._off = true;

	this.instance_2 = new lib.트윈29("synched",0);
	this.instance_2.parent = this;
	this.instance_2.setTransform(664,341);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[{t:this.instance}]}).to({state:[{t:this.instance_1}]},31).to({state:[{t:this.instance_2}]},8).to({state:[{t:this.instance}]},37).wait(1));
	this.timeline.addTween(cjs.Tween.get(this.instance_1).wait(31).to({_off:false},0).to({_off:true},8).wait(38));

}).prototype = p = new cjs.MovieClip();


(lib.장면_1__12 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// _12
	this.instance = new lib._12();
	this.instance.parent = this;
	this.instance.setTransform(336,74);

	this.instance_1 = new lib.트윈26("synched",0);
	this.instance_1.parent = this;
	this.instance_1.setTransform(666,341);
	this.instance_1._off = true;

	this.instance_2 = new lib.트윈27("synched",0);
	this.instance_2.parent = this;
	this.instance_2.setTransform(666,341);
	this.instance_2._off = true;

	this.timeline.addTween(cjs.Tween.get({}).to({state:[{t:this.instance}]}).to({state:[{t:this.instance_1}]},22).to({state:[{t:this.instance_2}]},5).to({state:[{t:this.instance_2}]},9).to({state:[{t:this.instance}]},40).wait(1));
	this.timeline.addTween(cjs.Tween.get(this.instance_1).wait(22).to({_off:false},0).to({_off:true},5).wait(50));
	this.timeline.addTween(cjs.Tween.get(this.instance_2).wait(22).to({_off:false},5).to({startPosition:0},9).to({_off:true},40).wait(1));

}).prototype = p = new cjs.MovieClip();


(lib.장면_1__11 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// _11
	this.instance = new lib._08();
	this.instance.parent = this;
	this.instance.setTransform(333,72);

	this.instance_1 = new lib.트윈24("synched",0);
	this.instance_1.parent = this;
	this.instance_1.setTransform(663,339);
	this.instance_1._off = true;

	this.instance_2 = new lib.트윈25("synched",0);
	this.instance_2.parent = this;
	this.instance_2.setTransform(663,339);
	this.instance_2._off = true;

	this.timeline.addTween(cjs.Tween.get({}).to({state:[{t:this.instance}]}).to({state:[{t:this.instance_1}]},15).to({state:[{t:this.instance_1}]},1).to({state:[{t:this.instance_1}]},1).to({state:[{t:this.instance_1}]},1).to({state:[{t:this.instance_2}]},1).to({state:[{t:this.instance_2}]},7).to({state:[{t:this.instance}]},50).wait(1));
	this.timeline.addTween(cjs.Tween.get(this.instance_1).wait(15).to({_off:false},0).wait(1).to({startPosition:0},0).wait(1).to({startPosition:0},0).wait(1).to({startPosition:0},0).to({_off:true},1).wait(58));
	this.timeline.addTween(cjs.Tween.get(this.instance_2).wait(19).to({_off:false},0).to({startPosition:0},7).to({_off:true},50).wait(1));

}).prototype = p = new cjs.MovieClip();


(lib.장면_1__6 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// _6
	this.instance = new lib.트윈20("synched",0);
	this.instance.parent = this;
	this.instance.setTransform(652,334);

	this.instance_1 = new lib.트윈21("synched",0);
	this.instance_1.parent = this;
	this.instance_1.setTransform(652,363);
	this.instance_1._off = true;

	this.instance_2 = new lib.트윈22("synched",0);
	this.instance_2.parent = this;
	this.instance_2.setTransform(652,334);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[{t:this.instance}]}).to({state:[{t:this.instance}]},1).to({state:[{t:this.instance_1}]},23).to({state:[{t:this.instance_1}]},26).to({state:[{t:this.instance_2}]},26).wait(1));
	this.timeline.addTween(cjs.Tween.get(this.instance).to({y:336.05},1).to({_off:true,y:363},23).wait(53));
	this.timeline.addTween(cjs.Tween.get(this.instance_1).wait(1).to({_off:false},23).to({x:640,y:325},26).to({_off:true,x:652,y:334},26).wait(1));

}).prototype = p = new cjs.MovieClip();


(lib.장면_1__5 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// _5
	this.instance = new lib.트윈18("synched",0);
	this.instance.parent = this;
	this.instance.setTransform(652,334);

	this.instance_1 = new lib.트윈19("synched",0);
	this.instance_1.parent = this;
	this.instance_1.setTransform(661,359);
	this.instance_1._off = true;

	this.instance_2 = new lib.트윈23("synched",0);
	this.instance_2.parent = this;
	this.instance_2.setTransform(652,334);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[{t:this.instance}]}).to({state:[{t:this.instance}]},1).to({state:[{t:this.instance_1}]},31).to({state:[{t:this.instance_1}]},21).to({state:[{t:this.instance_2}]},23).wait(1));
	this.timeline.addTween(cjs.Tween.get(this.instance).to({x:652.45,y:335.3},1).to({_off:true,x:661,y:359},31).wait(45));
	this.timeline.addTween(cjs.Tween.get(this.instance_1).wait(1).to({_off:false},31).to({y:346},21).to({_off:true,x:652,y:334},23).wait(1));

}).prototype = p = new cjs.MovieClip();


(lib.장면_1__4 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// _4
	this.instance = new lib.트윈15("synched",0);
	this.instance.parent = this;
	this.instance.setTransform(690,232);

	this.instance_1 = new lib.트윈16("synched",0);
	this.instance_1.parent = this;
	this.instance_1.setTransform(725,229);
	this.instance_1._off = true;

	this.instance_2 = new lib.트윈17("synched",0);
	this.instance_2.parent = this;
	this.instance_2.setTransform(690,232);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[{t:this.instance}]}).to({state:[{t:this.instance}]},1).to({state:[{t:this.instance_1}]},40).to({state:[{t:this.instance_2}]},35).wait(1));
	this.timeline.addTween(cjs.Tween.get(this.instance).to({x:691.45,y:231.9},1).to({_off:true,x:725,y:229},40).wait(36));
	this.timeline.addTween(cjs.Tween.get(this.instance_1).wait(1).to({_off:false},40).to({_off:true,x:690,y:232},35).wait(1));

}).prototype = p = new cjs.MovieClip();


(lib.장면_1__3 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// _3
	this.instance = new lib.트윈12("synched",0);
	this.instance.parent = this;
	this.instance.setTransform(374,334);

	this.instance_1 = new lib.트윈13("synched",0);
	this.instance_1.parent = this;
	this.instance_1.setTransform(398,334);
	this.instance_1._off = true;

	this.instance_2 = new lib.트윈14("synched",0);
	this.instance_2.parent = this;
	this.instance_2.setTransform(374,334);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[{t:this.instance}]}).to({state:[{t:this.instance}]},1).to({state:[{t:this.instance_1}]},37).to({state:[{t:this.instance_2}]},38).wait(1));
	this.timeline.addTween(cjs.Tween.get(this.instance).to({x:375.1},1).to({_off:true,x:398},37).wait(39));
	this.timeline.addTween(cjs.Tween.get(this.instance_1).wait(1).to({_off:false},37).to({_off:true,x:374},38).wait(1));

}).prototype = p = new cjs.MovieClip();


(lib.장면_1__2 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// _2
	this.instance = new lib.트윈9("synched",0);
	this.instance.parent = this;
	this.instance.setTransform(893,438);

	this.instance_1 = new lib.트윈10("synched",0);
	this.instance_1.parent = this;
	this.instance_1.setTransform(913,456);
	this.instance_1._off = true;

	this.instance_2 = new lib.트윈11("synched",0);
	this.instance_2.parent = this;
	this.instance_2.setTransform(893,438);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[{t:this.instance}]}).to({state:[{t:this.instance}]},1).to({state:[{t:this.instance_1}]},31).to({state:[{t:this.instance_1}]},25).to({state:[{t:this.instance_2}]},19).wait(1));
	this.timeline.addTween(cjs.Tween.get(this.instance).to({x:894.05,y:438.95},1).to({_off:true,x:913,y:456},31).wait(45));
	this.timeline.addTween(cjs.Tween.get(this.instance_1).wait(1).to({_off:false},31).to({x:893,y:448},25).to({_off:true,y:438},19).wait(1));

}).prototype = p = new cjs.MovieClip();


(lib.장면_1__1 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// _1
	this.instance = new lib.트윈6("synched",0);
	this.instance.parent = this;
	this.instance.setTransform(652,334);

	this.instance_1 = new lib.트윈7("synched",0);
	this.instance_1.parent = this;
	this.instance_1.setTransform(670,358);
	this.instance_1._off = true;

	this.instance_2 = new lib.트윈8("synched",0);
	this.instance_2.parent = this;
	this.instance_2.setTransform(652,334);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[{t:this.instance}]}).to({state:[{t:this.instance}]},1).to({state:[{t:this.instance_1}]},38).to({state:[{t:this.instance_2}]},37).wait(1));
	this.timeline.addTween(cjs.Tween.get(this.instance).to({x:652.8,y:335.05},1).to({_off:true,x:670,y:358},38).wait(38));
	this.timeline.addTween(cjs.Tween.get(this.instance_1).wait(1).to({_off:false},38).to({_off:true,x:652,y:334},37).wait(1));

}).prototype = p = new cjs.MovieClip();


(lib.장면_1__0 = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	// _0
	this.instance = new lib.트윈3("synched",0);
	this.instance.parent = this;
	this.instance.setTransform(652,334);

	this.instance_1 = new lib.트윈4("synched",0);
	this.instance_1.parent = this;
	this.instance_1.setTransform(700,334);
	this.instance_1._off = true;

	this.instance_2 = new lib.트윈5("synched",0);
	this.instance_2.parent = this;
	this.instance_2.setTransform(652,334);

	this.timeline.addTween(cjs.Tween.get({}).to({state:[{t:this.instance}]}).to({state:[{t:this.instance}]},1).to({state:[{t:this.instance_1}]},38).to({state:[{t:this.instance_2}]},37).wait(1));
	this.timeline.addTween(cjs.Tween.get(this.instance).to({x:654.1},1).to({_off:true,x:700},38).wait(38));
	this.timeline.addTween(cjs.Tween.get(this.instance_1).wait(1).to({_off:false},38).to({_off:true,x:652},37).wait(1));

}).prototype = p = new cjs.MovieClip();


// stage content:
(lib.VIP애니메이션2_HTML5Canvas = function(mode,startPosition,loop) {
	this.initialize(mode,startPosition,loop,{});

	this.___GetDepth___ = function(obj) {
		var depth = obj.depth;
		var cameraObj = this.___camera___instance;
		if(cameraObj && cameraObj.depth && obj.isAttachedToCamera)
		{
			depth += depth + cameraObj.depth;
		}
		return depth;
		}
	this.___needSorting___ = function() {
		for (var i = 0; i < this.getNumChildren() - 1; i++)
		{
			var prevDepth = this.___GetDepth___(this.getChildAt(i));
			var nextDepth = this.___GetDepth___(this.getChildAt(i + 1));
			if (prevDepth < nextDepth)
				return true;
		}
		return false;
	}
	this.___sortFunction___ = function(obj1, obj2) {
		return (this.exportRoot.___GetDepth___(obj2) - this.exportRoot.___GetDepth___(obj1));
	}
	this.on('tick', function (event){
		var curTimeline = event.currentTarget;
		if (curTimeline.___needSorting___()){
			this.sortChildren(curTimeline.___sortFunction___);
		}
	});

	// timeline functions:
	this.frame_76 = function() {
		this.___loopingOver___ = true;
	}

	// actions tween:
	this.timeline.addTween(cjs.Tween.get(this).wait(76).call(this.frame_76).wait(1));

	// _15_obj_
	this._15 = new lib.장면_1__15();
	this._15.name = "_15";
	this._15.parent = this;
	this._15.setTransform(656,340,1,1,0,0,0,656,340);
	this._15.depth = 0;
	this._15.isAttachedToCamera = 0
	this._15.isAttachedToMask = 0
	this._15.layerDepth = 0
	this._15.layerIndex = 0
	this._15.maskLayerName = 0

	this.timeline.addTween(cjs.Tween.get(this._15).wait(77));

	// _14_obj_
	this._14 = new lib.장면_1__14();
	this._14.name = "_14";
	this._14.parent = this;
	this._14.setTransform(660,339,1,1,0,0,0,660,339);
	this._14.depth = 0;
	this._14.isAttachedToCamera = 0
	this._14.isAttachedToMask = 0
	this._14.layerDepth = 0
	this._14.layerIndex = 1
	this._14.maskLayerName = 0

	this.timeline.addTween(cjs.Tween.get(this._14).wait(77));

	// _13_obj_
	this._13 = new lib.장면_1__13();
	this._13.name = "_13";
	this._13.parent = this;
	this._13.setTransform(664,341,1,1,0,0,0,664,341);
	this._13.depth = 0;
	this._13.isAttachedToCamera = 0
	this._13.isAttachedToMask = 0
	this._13.layerDepth = 0
	this._13.layerIndex = 2
	this._13.maskLayerName = 0

	this.timeline.addTween(cjs.Tween.get(this._13).wait(77));

	// _12_obj_
	this._12 = new lib.장면_1__12();
	this._12.name = "_12";
	this._12.parent = this;
	this._12.setTransform(666,341,1,1,0,0,0,666,341);
	this._12.depth = 0;
	this._12.isAttachedToCamera = 0
	this._12.isAttachedToMask = 0
	this._12.layerDepth = 0
	this._12.layerIndex = 3
	this._12.maskLayerName = 0

	this.timeline.addTween(cjs.Tween.get(this._12).wait(77));

	// _11_obj_
	this._11 = new lib.장면_1__11();
	this._11.name = "_11";
	this._11.parent = this;
	this._11.setTransform(663,339,1,1,0,0,0,663,339);
	this._11.depth = 0;
	this._11.isAttachedToCamera = 0
	this._11.isAttachedToMask = 0
	this._11.layerDepth = 0
	this._11.layerIndex = 4
	this._11.maskLayerName = 0

	this.timeline.addTween(cjs.Tween.get(this._11).wait(77));

	// _6_obj_
	this._6 = new lib.장면_1__6();
	this._6.name = "_6";
	this._6.parent = this;
	this._6.setTransform(652,334,1,1,0,0,0,652,334);
	this._6.depth = 0;
	this._6.isAttachedToCamera = 0
	this._6.isAttachedToMask = 0
	this._6.layerDepth = 0
	this._6.layerIndex = 5
	this._6.maskLayerName = 0

	this.timeline.addTween(cjs.Tween.get(this._6).wait(77));

	// _5_obj_
	this._5 = new lib.장면_1__5();
	this._5.name = "_5";
	this._5.parent = this;
	this._5.setTransform(652,334,1,1,0,0,0,652,334);
	this._5.depth = 0;
	this._5.isAttachedToCamera = 0
	this._5.isAttachedToMask = 0
	this._5.layerDepth = 0
	this._5.layerIndex = 6
	this._5.maskLayerName = 0

	this.timeline.addTween(cjs.Tween.get(this._5).wait(77));

	// _9_obj_
	this._9 = new lib.장면_1__9();
	this._9.name = "_9";
	this._9.parent = this;
	this._9.setTransform(663,339,1,1,0,0,0,663,339);
	this._9.depth = 0;
	this._9.isAttachedToCamera = 0
	this._9.isAttachedToMask = 0
	this._9.layerDepth = 0
	this._9.layerIndex = 7
	this._9.maskLayerName = 0

	this.timeline.addTween(cjs.Tween.get(this._9).wait(77));

	// _4_obj_
	this._4 = new lib.장면_1__4();
	this._4.name = "_4";
	this._4.parent = this;
	this._4.setTransform(690,232,1,1,0,0,0,690,232);
	this._4.depth = 0;
	this._4.isAttachedToCamera = 0
	this._4.isAttachedToMask = 0
	this._4.layerDepth = 0
	this._4.layerIndex = 8
	this._4.maskLayerName = 0

	this.timeline.addTween(cjs.Tween.get(this._4).wait(77));

	// _3_obj_
	this._3 = new lib.장면_1__3();
	this._3.name = "_3";
	this._3.parent = this;
	this._3.setTransform(374,334,1,1,0,0,0,374,334);
	this._3.depth = 0;
	this._3.isAttachedToCamera = 0
	this._3.isAttachedToMask = 0
	this._3.layerDepth = 0
	this._3.layerIndex = 9
	this._3.maskLayerName = 0

	this.timeline.addTween(cjs.Tween.get(this._3).wait(77));

	// _2_obj_
	this._2 = new lib.장면_1__2();
	this._2.name = "_2";
	this._2.parent = this;
	this._2.setTransform(893,438,1,1,0,0,0,893,438);
	this._2.depth = 0;
	this._2.isAttachedToCamera = 0
	this._2.isAttachedToMask = 0
	this._2.layerDepth = 0
	this._2.layerIndex = 10
	this._2.maskLayerName = 0

	this.timeline.addTween(cjs.Tween.get(this._2).wait(77));

	// _1_obj_
	this._1 = new lib.장면_1__1();
	this._1.name = "_1";
	this._1.parent = this;
	this._1.setTransform(652,334,1,1,0,0,0,652,334);
	this._1.depth = 0;
	this._1.isAttachedToCamera = 0
	this._1.isAttachedToMask = 0
	this._1.layerDepth = 0
	this._1.layerIndex = 11
	this._1.maskLayerName = 0

	this.timeline.addTween(cjs.Tween.get(this._1).wait(77));

	// _0_obj_
	this._0 = new lib.장면_1__0();
	this._0.name = "_0";
	this._0.parent = this;
	this._0.setTransform(652,334,1,1,0,0,0,652,334);
	this._0.depth = 0;
	this._0.isAttachedToCamera = 0
	this._0.isAttachedToMask = 0
	this._0.layerDepth = 0
	this._0.layerIndex = 12
	this._0.maskLayerName = 0

	this.timeline.addTween(cjs.Tween.get(this._0).wait(77));

	// _7_obj_
	this._7 = new lib.장면_1__7();
	this._7.name = "_7";
	this._7.parent = this;
	this._7.setTransform(655,315,1,1,0,0,0,655,315);
	this._7.depth = 0;
	this._7.isAttachedToCamera = 0
	this._7.isAttachedToMask = 0
	this._7.layerDepth = 0
	this._7.layerIndex = 13
	this._7.maskLayerName = 0

	this.timeline.addTween(cjs.Tween.get(this._7).wait(77));

}).prototype = p = new cjs.MovieClip();
p.nominalBounds = new cjs.Rectangle(684,322,559,401);
// library properties:
lib.properties = {
	id: '2F178E3B458CA146BCA020AB48F47589',
	width: 1280,
	height: 720,
	fps: 24,
	color: "#2B324A",
	opacity: 1.00,
	manifest: [
		{src:"images/VIP 애니메이션2_HTML5 Canvas_atlas_.png", id:"VIP 애니메이션2_HTML5 Canvas_atlas_"},
		{src:"images/VIP 애니메이션2_HTML5 Canvas_atlas_2.png", id:"VIP 애니메이션2_HTML5 Canvas_atlas_2"}
	],
	preloads: []
};



// bootstrap callback support:

(lib.Stage = function(canvas) {
	createjs.Stage.call(this, canvas);
}).prototype = p = new createjs.Stage();

p.setAutoPlay = function(autoPlay) {
	this.tickEnabled = autoPlay;
}
p.play = function() { this.tickEnabled = true; this.getChildAt(0).gotoAndPlay(this.getTimelinePosition()) }
p.stop = function(ms) { if(ms) this.seek(ms); this.tickEnabled = false; }
p.seek = function(ms) { this.tickEnabled = true; this.getChildAt(0).gotoAndStop(lib.properties.fps * ms / 1000); }
p.getDuration = function() { return this.getChildAt(0).totalFrames / lib.properties.fps * 1000; }

p.getTimelinePosition = function() { return this.getChildAt(0).currentFrame / lib.properties.fps * 1000; }

an.bootcompsLoaded = an.bootcompsLoaded || [];
if(!an.bootstrapListeners) {
	an.bootstrapListeners=[];
}

an.bootstrapCallback=function(fnCallback) {
	an.bootstrapListeners.push(fnCallback);
	if(an.bootcompsLoaded.length > 0) {
		for(var i=0; i<an.bootcompsLoaded.length; ++i) {
			fnCallback(an.bootcompsLoaded[i]);
		}
	}
};

an.compositions = an.compositions || {};
an.compositions['2F178E3B458CA146BCA020AB48F47589'] = {
	getStage: function() { return exportRoot.getStage(); },
	getLibrary: function() { return lib; },
	getSpriteSheet: function() { return ss; },
	getImages: function() { return img; }
};

an.compositionLoaded = function(id) {
	an.bootcompsLoaded.push(id);
	for(var j=0; j<an.bootstrapListeners.length; j++) {
		an.bootstrapListeners[j](id);
	}
}

an.getComposition = function(id) {
	return an.compositions[id];
}


// Layer depth API : 

AdobeAn.Layer = new function() {
	this.getLayerZDepth = function(timeline, layerName)
	{
		if(layerName === "Camera")
		layerName = "___camera___instance";
		var script = "if(timeline." + layerName + ") timeline." + layerName + ".depth; else 0;";
		return eval(script);
	}
	this.setLayerZDepth = function(timeline, layerName, zDepth)
	{
		const MAX_zDepth = 10000;
		const MIN_zDepth = -5000;
		if(zDepth > MAX_zDepth)
			zDepth = MAX_zDepth;
		else if(zDepth < MIN_zDepth)
			zDepth = MIN_zDepth;
		if(layerName === "Camera")
		layerName = "___camera___instance";
		var script = "if(timeline." + layerName + ") timeline." + layerName + ".depth = " + zDepth + ";";
		eval(script);
	}
	this.removeLayer = function(timeline, layerName)
	{
		if(layerName === "Camera")
		layerName = "___camera___instance";
		var script = "if(timeline." + layerName + ") timeline.removeChild(timeline." + layerName + ");";
		eval(script);
	}
	this.addNewLayer = function(timeline, layerName, zDepth)
	{
		if(layerName === "Camera")
		layerName = "___camera___instance";
		zDepth = typeof zDepth !== 'undefined' ? zDepth : 0;
		var layer = new createjs.MovieClip();
		layer.name = layerName;
		layer.depth = zDepth;
		layer.layerIndex = 0;
		timeline.addChild(layer);
	}
}


})(createjs = createjs||{}, AdobeAn = AdobeAn||{});
var createjs, AdobeAn;