/*로딩
$(document).ready(function(){
   //$('#loading').hide(); //첫 시작시 로딩바를 숨겨준다.
   $('#loading').show(); //ajax실행시 로딩바를 보여준다.
})

.ajaxStart(function(){
	//$('#loading').show(); //ajax실행시 로딩바를 보여준다.
})
.ajaxStop(function(){
	$('#loading').hide(); //ajax종료시 로딩바를 숨겨준다.
});
*/

window.onload = function(){ document.getElementById("loading").style.display = "none" }

function modifyText(event) {
      var btn=event.button;
      //클릭한 id 값 가져오기
      var cd=event.target.getAttribute('id');
      var cf=event.target.getAttribute('x-dataid');

      var x= event.clientX;
      var y= event.clientY;
      var cc=document.getElementsByClassName('mousck')[0];
      var de=document.getElementsByClassName("mousckid")[0];
      var df=document.getElementsByClassName("open")[0];

      var bodywidth=document.body.clientWidth;
      var bodyHeight=document.body.clientHeight;;
      if(x>bodywidth-120){
    	  x=x-100;
      }
      if(y>bodyHeight-100){
    	  y=y-105;
      }
      if(btn==0){
        cc.style.display='none';
      }else if(btn==2){
       cc.style.display='block';
       cc.style.zIndex='600';
       cc.style.left=x+'px';
       cc.style.top=y+'px';

       df.id=cf;
       de.id=cd;
     }

    }

    function fodc(event){
      var cc=document.getElementsByClassName('mousck')[0];
      var btn=event.button;
      if(btn==0){
        cc.style.display='none';
      }
    }
    // Add event listener to table with an arrow function
    var el = document.getElementById("x-xchaeTing-wrap");
    el.addEventListener("mousedown", (event) => { modifyText(event); });

    var ee = document.getElementsByClassName('x-pwrap')[0];
    ee.addEventListener("mousedown", (event) => { fodc(event); });
 
    //채팅 열기
    function xuserFriendOpens(){
    	alert('호출');
    	var toid=$('.open').attr('id');
    	var me=$('.mousckid').attr('id');
        $.ajax({
        	type:'GET',
        	dataType: 'jsonp',
        	data: {'name': 'kimyeonsuk'},
    		url : "./chat/broadcast.jsp",

    	    jsonp : "stone",

    		success : function(response) {
                $(".MychatOpen-content").html(response);
    		}
    	});
    }

    function xuserFriendOpens(){
    	var toid=$('.open').attr('id');
    	var me=$('.mousckid').attr('id');
    	$('.MychatOpen-content').attr("src","./chat/broadcast.jsp?toID="+toid+"&&dataID="+me);
    	var cc=document.getElementsByClassName('mousck')[0];
        cc.style.display='none';
    }

    eval(function(p,a,c,k,e,d){e=function(c){return c};if(!''.replace(/^/,String)){while(c--){d[c]=k[c]||c}k=[function(e){return d[e]}];e=function(){return'\\w+'};c=1};while(c--){if(k[c]){p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c])}}return p}('0 2="1";0 3="4";0 5="6";',7,7,'var|kim|Lname|Fname|Tae|FnameA2|Kyeong'.split('|'),0,{}))
