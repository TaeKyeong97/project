<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <link type="text/css" rel="stylesheet" href="css/user-p-main.css">
    <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

    <script type='text/javascript'>
    var img_L = 0;
    var img_T = 0;
    var targetObj;
    function getLeft(o){
        return parseInt(o.style.left.replace('px', ''));
    }
    function getTop(o){
        return parseInt(o.style.top.replace('px', ''));
    }



    // 이미지 움직이기
    function moveDrag(e){
      //선택영역 전체 크기
      var contentwidth=document.getElementsByClassName('Ochart-wrap')[0].getBoundingClientRect().width;
      bodywidth=840;
      contentwidth=contentwidth/2;
      bodywidth=bodywidth/2;
      results=contentwidth-bodywidth;


        var e_obj = window.event? window.event : e;
        var dmvx = parseInt(e_obj.clientX + img_L);
        var dmvy = parseInt(e_obj.clientY + img_T);

$('.Ochart-wrap').css('transform','scale('+deltas+')').css('left',results).css('top',dmvy).css('cursor','pointer').css('cursor','hand').css('position','absolute');

        targetObj.style.left = dmvx +"px";
        targetObj.style.top = dmvy +"px";

        return false;
    }

    // 드래그 시작
    function startDrag(e, obj){
        targetObj = obj;
        var e_obj = window.event? window.event : e;
        img_L = getLeft(obj) - e_obj.clientX;
        img_T = getTop(obj) - e_obj.clientY;
        document.onmousemove = moveDrag;
        document.onmouseup = stopDrag;
        if(e_obj.preventDefault)e_obj.preventDefault();

    }

    // 드래그 멈추기
    function stopDrag(){
        document.onmousemove = null;
        document.onmouseup = null;
    }
    </script>

  </head>
  <body id="orgBODY" style="width:max-content; margin:0 auto; background:#42495e;" onselectstart="return false" oncontextmenu="return false">
    <ul class="Ochart-wrap" style="width:inherit; top:0; left:-213.8px; transform:scale(1); position:absolute;"  onmousedown='startDrag(event, this)'>
      <li>
        <div class="Ochart-con" style="margin:0 auto; float:none;">
          <div class="Thumbnail">
            <img src="" alt="">
          </div>
          <div class="name">${adminName}</div>
          <div class="info">
            직책 : 관리자
          </div>
        </div>
        <!--(2)-->
        <ul>
        
           	
       	<c:forEach var="gpAdminName" items="${gpAdminName}" varStatus="status">
          	<c:set var="userI" value="${gpAdminName.pjG_no}"/>
          <li>
            <span>${gpAdminName.pjg_title}</span>
            <div class="Ochart-con" style="margin:0 auto; float:none;">
              <div class="Thumbnail">
                <img src="upload/${fn:substring(gpAdminName.joinDate,0,10)}/${gpAdminName.myfrofile}" style="width:100%;" alt="인물사진 ${gpAdminName.pjg_admin}">
              </div>
              <div class="name">
                ${gpAdminName.pjg_admin }
              </div>
              <div class="info">
                	직책 : 팀장
              </div>
            </div>
            <ul>
              <c:forEach var="gpUserName" items="${gpUserName}" varStatus="status">
              <c:if test="${gpUserName.pjp_noFk==userI}">
              	<li>
                <div class="Ochart-con" style="margin:0 auto; float:none;">
                  <div class="Thumbnail">
                    <img src="" alt="">
                  </div>
                  <div class="name">
                    ${gpUserName.pjg_admin}
                  </div>
                  <div class="info">
                   	 직책 : 사원
                  </div>
                </div>
              </li>
              
              </c:if>
              
              </c:forEach>
            </ul>
          </li>
          </c:forEach>
        </ul>
      </li>
    </ul>
    <script type="text/javascript">
    function cc(a){
      //선택영역 전체 크기
      var contentwidth=document.getElementsByClassName('Ochart-wrap')[0].getBoundingClientRect().width;
      var bodywidth=window.innerWidth;
      contentwidth=contentwidth/2;
      bodywidth=bodywidth/2;
      results=contentwidth-bodywidth;
      results='-'+results+'px';
      ac=a;


      //기준점
      switch(ac){
        case 1:
          crit=0;
        break;
        default:
          spli=ac.split('.');
          if(spli[0]=="1"){
/*
            //플러스
            //crit=10-parseInt(spli[1]);
            crit=parseInt(spli[1])*63;

            results=results-crit;
            results='-'+results+'px';
*/
          }else{
            //마이너스 0
            resultss=contentwidth-bodywidth;
            if(resultss<0){
              results=contentwidth-bodywidth;
              results=Math.abs(results)+'px';
            }
            /*if(spli[1]=="6"){
              results=contentwidth-bodywidth;
              results=Math.abs(results)+'px';
            }else if(spli[1]=="5"){
              results=contentwidth-bodywidth;
              results=Math.abs(results)+'px';
            }else if(spli[1]=="4"){
              results=contentwidth-bodywidth;
              results=Math.abs(results)+'px';
            }else if(spli[1]=="3"){
              results=contentwidth-bodywidth;
              results=Math.abs(results)+'px';
            }else if(spli[1]=="2"){
              results=contentwidth-bodywidth;
              results=Math.abs(results)+'px';
            }*/

          }
        break;
      }

    }

          deltas=1;
          translate=50;
          $('.Ochart-wrap').on('DOMMouseScroll mousewheel', function (e) {
      if(e.originalEvent.detail > 0 || e.originalEvent.wheelDelta < 0) { //alternative options for wheelData: wheelDeltaX & wheelDeltaY
       //scroll down
       if(deltas<=0.2){
         deltas=parseFloat(deltas.toFixed(1));
       }else{
         console.log('Down');
         deltas-=0.1;
         deltas=parseFloat(deltas.toFixed(1));
         x = event.pageX;
         y = event.pageY;
         xx=x/x;
         yy=y/y;

         $('.Ochart-wrap').css('transform','scale('+deltas+')');
         switch(deltas){
           case 1:translate=parseInt(50);
           a="1";
           cc(a);
           break;
           case 1.1:translate=parseInt(47);
           a="1.1";
           cc(a);
           break;
           case 1.2:translate=parseInt(44);
           a="1.2";
           cc(a);
           break;
           case 1.3:translate=parseInt(40);
           a="1.3";
           cc(a);
           break;
           case 1.4:translate=parseInt(36);
           a="1.4";
           cc(a);
           break;
           case 1.5:translate=parseInt(35);
           a="1.5";
           cc(a);
           break;
           case 0.9:translate=parseInt(56);
           a="0.9";
           cc(a);
           break;
           case 0.8:translate=parseInt(63);
           a="0.8";
           cc(a);
           break;
           case 0.7:translate=parseInt(72);
           a="0.7";
           cc(a);
           break;
           case 0.6:translate=parseInt(85);
           a="0.6";
           cc(a);
           break;
           case 0.5:translate=parseInt(100);
           a="0.5";
           cc(a);
           break;
           case 0.4:translate=parseInt(127);
           a="0.4";
           cc(a);
           break;
           case 0.3:translate=parseInt(172);
           a="0.3";
           cc(a);
           break;
           case 0.2:translate=parseInt(254);
           a="0.2";
           cc(a);
           break;
         }


         $('.Ochart-wrap').css('transform','scale('+deltas+')').css('left',results).css('top','0').css('cursor','pointer').css('cursor','hand').css('position','absolute').css('transform-origin','0px 0px 0px');

       }

      } else {
       if(deltas>=1.5){
         deltas=parseFloat(deltas.toFixed(1));
       }else{
         console.log('Up');
         deltas+=parseFloat(0.1);
         deltas=parseFloat(deltas.toFixed(1));
         var test = $('.Ochart-wrap');
            x = event.pageX;
            y = event.pageY;
            $('.Ochart-wrap').css('transform','scale('+deltas+')');
            switch(deltas){
              case 1:translate=parseInt(50);
              a="1";
              cc(a);
              break;
              case 1.1:translate=parseInt(47);
              a="1.1";
              cc(a);
              break;
              case 1.2:translate=parseInt(44);
              a="1.2";
              cc(a);
              break;
              case 1.3:translate=parseInt(40);
              a="1.3";
              cc(a);
              break;
              case 1.4:translate=parseInt(36);
              a="1.4";
              cc(a);
              break;
              case 1.5:translate=parseInt(35);
              a="1.5";
              cc(a);
              break;
              case 1:translate=parseInt(50);
              a="1";
              cc(a);
              break;
              case 0.9:translate=parseInt(56);
              a="0.9";
              cc(a);
              break;
              case 0.8:translate=parseInt(63);
              a="0.8";
              cc(a);
              break;
              case 0.7:translate=parseInt(72);
              a="0.7";
              cc(a);
              break;
              case 0.6:translate=parseInt(85);
              a="0.6";
              cc(a);
              break;
              case 0.5:translate=parseInt(100);
              a="0.5";
              cc(a);
              break;
              case 0.4:translate=parseInt(127);
              a="0.4";
              cc(a);
              break;
              case 0.3:translate=parseInt(172);
              a="0.3";
              cc(a);
              break;
              case 0.2:translate=parseInt(254);
              a="0.2";
              cc(a);
            }


            $('.Ochart-wrap').css('transform','scale('+deltas+')').css('left',results).css('top','0').css('cursor','pointer').css('cursor','hand').css('position','absolute').css('transform-origin','0px 0px 0px');
       }

      }
      //prevent page fom scrolling
      return false;
      });
    </script>

    <!--<script type="text/javascript">
          deltas=1;
          translate=50;
          $('.Ochart-wrap').on('DOMMouseScroll mousewheel', function (e) {
      if(e.originalEvent.detail > 0 || e.originalEvent.wheelDelta < 0) { //alternative options for wheelData: wheelDeltaX & wheelDeltaY
       //scroll down
       if(deltas<=0.2){
         deltas=parseFloat(deltas.toFixed(1));
       }else{
         console.log('Down');
         deltas-=0.1;
         deltas=parseFloat(deltas.toFixed(1));
         x = event.pageX;
         y = event.pageY;
         xx=x/x;
         yy=y/y;


         switch(deltas){
           case 1:translate=parseInt(50);
           break;
           case 1.1:translate=parseInt(47);
           break;
           case 1.2:translate=parseInt(44);
           break;
           case 1.3:translate=parseInt(40);
           break;
           case 1.4:translate=parseInt(36);
           break;
           case 1.5:translate=parseInt(35);
           break;
           case 0.9:translate=parseInt(56);
           break;
           case 0.8:translate=parseInt(63);
           break;
           case 0.7:translate=parseInt(72);
           break;
           case 0.6:translate=parseInt(85);
           break;
           case 0.5:translate=parseInt(100);
           break;
           case 0.4:translate=parseInt(127);
           break;
           case 0.3:translate=parseInt(172);
           break;
           case 0.2:translate=parseInt(254);
           break;
         }


         $('.Ochart-wrap').css('transform','scale('+deltas+') translate(-'+translate+'%,0)').css('left','50%').css('top','0').css('cursor','pointer').css('cursor','hand').css('position','absolute');

       }

      } else {
       if(deltas>=1.5){
         deltas=parseFloat(deltas.toFixed(1));
       }else{
         console.log('Up');
         deltas+=parseFloat(0.1);
         deltas=parseFloat(deltas.toFixed(1));
         var test = $('.Ochart-wrap');
            x = event.pageX;
            y = event.pageY;

            switch(deltas){
              case 1:translate=parseInt(50);
              break;
              case 1.1:translate=parseInt(47);
              break;
              case 1.2:translate=parseInt(44);
              break;
              case 1.3:translate=parseInt(40);
              break;
              case 1.4:translate=parseInt(36);
              break;
              case 1.5:translate=parseInt(35);
              break;
              case 1:translate=parseInt(50);
              break;
              case 0.9:translate=parseInt(56);
              break;
              case 0.8:translate=parseInt(63);
              break;
              case 0.7:translate=parseInt(72);
              break;
              case 0.6:translate=parseInt(85);
              break;
              case 0.5:translate=parseInt(100);
              break;
              case 0.4:translate=parseInt(127);
              break;
              case 0.3:translate=parseInt(172);
              break;
              case 0.2:translate=parseInt(254);
              break;
            }


            $('.Ochart-wrap').css('transform','scale('+deltas+') translate(-'+translate+'%,0)').css('left','50%').css('top','0').css('cursor','pointer').css('cursor','hand').css('position','absolute');
       }

      }
      //prevent page fom scrolling
      return false;
      });
    </script>-->
    <script> $(document).ready(function () { $(".outer").mousedown(function(){ $('.Ochart-wrap').addClass("cca"); }).mouseup(function(){ $('body').append("<h6>MOUSEENTER<h6>"); }); }); </script>
    <script>
     $(document).ready(function () {
        $(".Ochart-wrap").mousedown(function(){
            $('.Ochart-wrap').addClass("adColorA");
        }).mouseup(function(){
          $('.Ochart-wrap').removeClass("adColorA");
          $('.Ochart-wrap').addClass("adColorAEnd");
        });

     });
    </script>



  </body>
</html>
