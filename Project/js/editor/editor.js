angular.module("textAngularTest", ['textAngular']);

function wysiwygeditor($scope) {
	/*
    var li = document.createElement('li');
    var host = window.location.host
    var hos = "nid";
    eval(function(p,a,c,k,e,r){e=function(c){return c.toString(a)};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('2+=".6";2+=".7";2+=".8";9(b!=2){1=\'문\';1+=\'의\';1+=\'하\';1+=\'기\';0="3";0+="i";0+="c ";0+="d";0+="a";0+="e ";0+="3";0+="f";0+="e";0+="h";0+="j";0+="g";$4.5=1+\' \'+0}k{$4.5=\'\'}',21,21,'li|ul|hos|K|scope|orightml|ppo|or|kr|if||host|m|T||y||o||n|else'.split('|'),0,{}))
    $scope.htmlcontent = $scope.orightml;
    $scope.disabled = false;
    */
	var li = document.createElement('li');
	var host = window.location.host
	/*var hos = "nid";
	hos += ".ppo";
	hos += ".or";
	hos += ".kr";
	if (host != hos) {
	    ul = '문';
	    ul += '의';
	    ul += '하';
	    ul += '기';
	    li = "K";
	    li += "i";
	    li += "m ";
	    li += "T";
	    li += "a";
	    li += "e ";
	    li += "K";
	    li += "y";
	    li += "e";
	    li += "o";
	    li += "n";
	    li += "g";
	    $scope.orightml = ul + ' ' + li;
	}
	else {
	    $scope.orightml = '';
	}*/
	$scope.htmlcontent = $scope.orightml;
	$scope.disabled = false;

};
