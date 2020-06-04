<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="robots" content="noindex">
    <!-- <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"> -->
    <title>프로젝트 관리자 페이지</title>
    <link rel="stylesheet" type="text/css" href="css/user-p-main.css">
    <link rel="stylesheet" href="css/admin-p-main2.css">
    <!--드래그하기전 사용 했던것 <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>-->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


    <script>
      //해드 사용자 gnb
      userA=1;
      function gnb_userInfo(){
        if(userA==1){
          $('.gnb_userInfo').css('display','block');
          userA++;
        }else{
          $('.gnb_userInfo').css('display','none');
          userA--;
        }
      }

      a=0;
      function gnb_lstOn(a){
        if(a==1){
          $('.gnb_lst>li>.gnb_notiec').css('display','block');
          a++;
          $('.gnb_lst>li:nth-child(1)>a').attr('onclick','gnb_lstOn('+a+')');
        }else if(a==2){
          $('.gnb_lst>li>.gnb_notiec').css('display','none');
          a--;
          $('.gnb_lst>li:nth-child(1)>a').attr('onclick','gnb_lstOn('+a+')');
        }
      }

      function UPMCkNot(a,b){
        if(a==1){
          //$('.not-popup').css('display','block');
          $('.not-popup-BG').css('display','block');
          $('.popup'+b+'.not-popup-animaE').removeClass('not-popup-animaNone');
          $('.popup'+b+'.not-popup-animaE').addClass('not-popup');

          $('.popup'+b+'.not-popup').removeClass('not-popup-animaE');

          $('.popup'+b+'.not-popup').addClass('not-popup-animaS');
          a++;
          //$('.subMenu>li:nth-child(1)>a').attr('onclick','UPMCkNot('+a+','+b+')');
          $('a[onclick="UPMCkNot('+a+','+b+')"]').attr('onclick','UPMCkNot('+a+','+b+')');
          $('.popup'+b+'.not-popup>.header>div:nth-child(1)').attr('onclick','UPMCkNot('+a+','+b+')');

        }else if(a==2){
          $('.not-popup-BG').css('display','none');
          $('.not-popup-animaS').addClass('not-popup-animaE');
          setTimeout(function() {
            $('.not-popup-animaE').addClass('not-popup-animaNone');
          }, 350);
          //$('.popup'+b+'.not-popup').removeClass('not-popup');

          $('.not-popup-animaE').removeClass('not-popup-animaS');
          a--;
          //$('a[onclick="UPMCkNot('+a+','+b+')"]').attr('onclick','UPMCkNot('+a+','+b+')');
          //$('.popup'+b+'.not-popup>.header>div:nth-child(1)').attr('onclick','UPMCkNot('+a+','+b+')');
        }
      }

      $(document).keyup(function(e) {
        if (e.keyCode == 27) {
          $('.not-popup-BG').css('display','none');
          $('.not-popup-animaS').addClass('not-popup-animaE');
          setTimeout(function() {
            $('.not-popup-animaE').addClass('not-popup-animaNone');
          }, 350);
          $('.not-popup-animaE').removeClass('not-popup-animaS');


        }
      });
    </script>
  </head>
  <body>
    <!--skip-->
    <div class="skip">
      <a href="#content">본문 바로가기</a>
    </div>
    <script>
      $('.skip a').on('focus',function(){
        $(this).stop().animate({"margin-top":0,"opacity":1});
      });
      $('.skip a').on('click', function(){
        $(this).stop().animate({"margin-top":0, "opacity":0});
    });
    $('.skip a').on('focusout', function(){
        $(this).stop().animate({"margin-top":"-32px", "opacity":0});
    });
    </script>
    <!--//skip-->
    <%@include file="head.jsp" %>
    <%@include file="nav.jsp" %>
    <main id="content">
      <section class="userInfo-con">
        <h1>회원정보 수정</h1>
        <article class="userInfo">
          <h2>정보</h2>
          <a href="#" class="userProfile-con">
          	<c:if test="${mbimg.EMImg_folder!=null}">
          		<img src="upload/${mbimg.EMImg_folder}/${mbimg.EMImg_name}"/>
          	</c:if>
          	<c:if test="${mbimg.EMImg_folder==null}">
          		<img src="img/camera.png" style=" width:fit-content; height:fit-content; ">
          	</c:if>
          </a>
          <ul class="userCont">
            <li><a href="#">${member.EM_name}</a><a href="#" class="crystal-btn">수정</a></li>
            <li><a href="#">${member.EM_email}</a><a href="#" class="crystal-btn" onclick="userInfoChage('email')">수정</a></li>
            <li><a href="#" onclick="userInfoChage('pw')">비밀번호 변경</a></li>
          </ul>
          <ul class="userCont" style="margin-left:50px;">
          	<li><a href="rating.ops">회원등급</a></li>
          	<li><a href="buy.ops">구매내역</a></li>
          	<li><a href="#p" onclick="userInfoChage('Withdrawal')">회원 탈퇴</a></li>
          </ul>
        </article>
      </section>
      <section class="userInfo-con">
        <h1>비밀번호 변경</h1>
        <article class="userInfo">
          <h2>정보</h2>
          <form class="" action="passwordChange.ops" method="post" id="userInfoChage">
            <ul class="userCont" style="width:207px">
              <li><input type="password" placeholder="현재 비밀번호" name="password"/></li>
              <li><input type="password" placeholder="변경할 비밀번호" name="pwChange"/></li>
              <li><input type="password" placeholder="비밀번호 확인"/></li>
            </ul>
            <input type="submit" name="" value="변경하기">
          </form>
        </article>
      </section>
      <section class="userInfo-con">
        <h1>이메일 변경</h1>
        <article class="userInfo">
          <h2>정보</h2>
          <form class="" action="userEmailChange.ops" method="post" id="userInfoChage">
            <ul class="userCont" style="width:207px">
              <li><input type="text" placeholder="현재 이메일" name="email"/></li>
              <li><input type="text" placeholder="변경할 이메일" name="emailChange"/></li>
              <li><input type="password" placeholder="비밀번호 확인" name="password"/></li>
            </ul>
            <input type="submit" name="" value="변경하기">
          </form>
        </article>
      </section>
      <section class="userInfo-con">
        <h1>회원 탈퇴 변경</h1>
        <article class="userInfo">
          <h2>정보</h2>
          <form class="" action="Withdrawal.ops" method="post" id="userInfoChage">
            <ul class="userCont" style="width:207px">
              <li><input type="text" placeholder="비밀번호" name="pw"/></li>
            </ul>
            <input type="submit" name="" value="탈퇴하기">
          </form>
        </article>
      </section>
    </main>
<!--생성 알림 시작-->
<div class="gnb_notiec notiec-main">
  <div class="gnb_notiec_list">
    정상적으로 생성 되었습니다.
    <div class="lis-info">
    알림생성
    </div>
    <div style="width:23px; position:absolute; top:23px; right:20px;">
      <svg version="1.1" x="0px" y="0px" viewBox="0 0 100 100" style="enable-background:new 0 0 100 100;" xml:space="preserve"> <g> <line style="fill:none;stroke:#FFFFFF;stroke-width:3;stroke-linecap:round;stroke-miterlimit:10;" x1="3.5" y1="96" x2="97" y2="2.5"></line> </g> <g> <line style="fill:none;stroke:#FFFFFF;stroke-width:3;stroke-linecap:round;stroke-miterlimit:10;" x1="3.5" y1="2.5" x2="97" y2="96"></line> </g> </svg>
    </div>
  </div>
  <div class="gnb_notiec_list" style="background:#ad7474;">
    생성에 실패 하였습니다.
    <div class="lis-info">
    알림생성 Error::
    </div>
    <div style="width:23px; position:absolute; top:23px; right:20px;">
      <svg version="1.1" x="0px" y="0px" viewBox="0 0 100 100" style="enable-background:new 0 0 100 100;" xml:space="preserve"> <g> <line style="fill:none;stroke:#FFFFFF;stroke-width:3;stroke-linecap:round;stroke-miterlimit:10;" x1="3.5" y1="96" x2="97" y2="2.5"></line> </g> <g> <line style="fill:none;stroke:#FFFFFF;stroke-width:3;stroke-linecap:round;stroke-miterlimit:10;" x1="3.5" y1="2.5" x2="97" y2="96"></line> </g> </svg>
    </div>
  </div>
</div>
<!--생성 알림 종료-->
    <aside class="chat-wrap">
      <ul>
        <li>
          <div class="chat-p"></div>
          <div class="chat-n">김태경</div>
        </li>
      </ul>
    </aside>
    <script>
      function userInfoChage(infoCk){
        if(infoCk=='email'){
          var userInfoChage0 = document.getElementsByClassName("userInfo-con")[1];
          var userInfoChage3 = document.getElementsByClassName("userInfo-con")[3];
          userInfoChage0.style.display="none";
          userInfoChage3.style.display="none";
          var userInfoChage = document.getElementsByClassName("userInfo-con")[2];

          userInfoChage.style.display="block";

        }else if(infoCk=='pw'){
          var userInfoChage0 = document.getElementsByClassName("userInfo-con")[2];
          var userInfoChage3 = document.getElementsByClassName("userInfo-con")[3];
          userInfoChage0.style.display="none";
          userInfoChage3.style.display="none";
          var userInfoChage = document.getElementsByClassName("userInfo-con")[1];
          userInfoChage.style.display="block";
        }else if(infoCk=='Withdrawal'){
        	var userInfoChage0 = document.getElementsByClassName("userInfo-con")[2];
            var userInfoChage3 = document.getElementsByClassName("userInfo-con")[3];
            userInfoChage0.style.display="none";
            userInfoChage3.style.display="block";
            var userInfoChage = document.getElementsByClassName("userInfo-con")[1];
            userInfoChage.style.display="none";
        }

      }
    </script>
  </body>
</html>
    