<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>회원등급</title>
    <link rel="stylesheet" type="text/css" href="css/user-p-main.css">
    <link rel="stylesheet" href="css/admin-p-main2.css">
    <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
    
    <script src="https://code.createjs.com/createjs-2015.11.26.min.js"></script>
	<script src="js/VIPAnimation.js"></script>
	
  </head>
  <body onload="init();">
    <%@include file="head.jsp" %>
    <%@include file="nav.jsp" %>
    <main>
      <!--알림 시작-->
      <section>
        <article class="admin_info_con">
          <div class="content">
            My페이지 프로젝트를 여러개 연람하기 위해서는 <span style="color:#ffde29;"><b>프리미엄</b></span> 계정으로 업그레이드가 필요합니다.<br>
            카드 등록하고 정기 결제시 첫 결제 3개월 100원
            &nbsp;&nbsp;<a href="#">자시히보기▶</a>
          </div>
          <div class="close">
            close
          </div>
          <span class="bg"></span>
        </article>
      </section>
      <!--알림 끝-->

      <section>
	<c:choose>
		<c:when test="${rating.equals('VIP')}">
      
        <article class="admin_pjckList-con ratingVip">
          <div class="rating-con">
            회원 등급
            <span>VIP</span>
          </div>
          <div class="rating-wrap">
            <div class="rating-content">
              <div id="animation_container" style="background-color:rgba(43, 50, 74, 1.00);width:785px;height: 433px;overflow:hidden;margin: 0 auto;display: inline;position: absolute;transform: translate(-50%,-50%);left: 50%;top: 50%;">
							<canvas id="canvas" width="1280" height="720" style="position: absolute;display: block;background-color:rgb(77, 83, 102);margin-left:-274px;margin-top: -132px;"></canvas>
            	</div>
            </div>
            <div class="rating-info">
              <h3 style="font-size:13px;">등급 종류</h3>
              <ul>
                <li><span></span><div>일반</div></li>
                <li><span></span><div>프리미엄</div></li>
                <li><span></span><div>VIP</div></li>
              </ul>
            </div>
            <div class="info">
              현재 <span style="color:#ffe762;">${EM_name}</span> 고객님은 정기 결재 서비스를 이용하고 계십니다.
            </div>
          </div>
        </article>
		</c:when>
		<c:when test="${rating.equals('프리미엄') }">
		<article class="admin_pjckList-con ratingPremium">
          <div class="rating-con">
            회원 등급
            <span>프리미엄</span>
          </div>
          <div class="rating-wrap">
            <div class="rating-content">
              <div id="animation_container" style="background-color:rgb(31, 33, 51); position:relative; z-index:1;width:785px;height: 433px;overflow:hidden;margin: 0 auto;display: inline;position: absolute;transform: translate(-50%,-50%);left: 50%;top: 50%;">
					<img src="img/premium.png" style="width:187px; height:187px; margin:89px auto; display:block;">
            	</div>
            </div>
            <div class="rating-info">
              <h3 style="font-size:13px;">등급 종류</h3>
              <ul>
                <li><span></span><div>일반</div></li>
                <li><span></span><div>프리미엄</div></li>
                <li><span></span><div>VIP</div></li>
              </ul>
            </div>
            <div class="info" style="z-index: 5; position: relative;">
              현재 <span style="color:#ffe762;">${EM_name}</span> 고객님은 결재 서비스를 이용하고 계십니다.
            </div>
          </div>
        </article>
			
		</c:when>
		<c:when test="${rating.equals('일반')}">
		<article class="admin_pjckList-con ratingGeneral">
          <div class="rating-con">
            회원 등급
            <span>일반</span>
          </div>
          <div class="rating-wrap">
            <div class="rating-content">
              <div id="animation_container" style="background-color:rgb(77, 83, 102); position:relative; z-index:1; width:785px;height: 433px;overflow:hidden;margin: 0 auto;display: inline;position: absolute;transform: translate(-50%,-50%);left: 50%;top: 50%;">
				<img src="img/General.png" style="width:187px; height:187px; margin:89px auto; display:block;">
            </div>
            </div>
            <div class="rating-info">
              <h3 style="font-size:13px;">등급 종류</h3>
              <ul>
                <li><span></span><div>일반</div></li>
                <li><span></span><div>프리미엄</div></li>
                <li><span></span><div>VIP</div></li>
              </ul>
            </div>
            <div class="info" style="z-index: 5; position: relative;">
              현재 <span style="color:#ffe762;">${EM_name}</span> 고객님은 일반 고객입니다.
            </div>
          </div>
        </article>
		</c:when>
	</c:choose>
        
        		
        
        <article class="admin_pjckList-con">
          <div class="rating-con">
            등급별 혜택
          </div>
          <div class="rating-wrap">
            <p><br></p>
            <div class="rating-font">
              <h3>일반</h3>
              <div class="content">
                <div>프로젝트 생성시 기본 할인적용</div>
                <div>+</div>
                <div>프로젝트 My페이지 노출 1개</div>
              </div>
            </div>
            <div class="rating-font">
              <h3>프리미엄</h3>
              <div class="content">
                <div>프로젝트 생성시 기본 할인적용</div>
                <div>+</div>
                <div>프로젝트 생성 5% 추가 할인</div>
                <div>+</div>
                <div>프로젝트 My페이지 노출 제한 없음</div>
              </div>
            </div>
            <div class="rating-font">
              <h3>VIP</h3>
              <div class="content">
                <div>프로젝트 생성시 기본 할인적용</div>
                <div>+</div>
                <div>프로젝트 생성 15% 추가 할인</div>
                <div>+</div>
                <div>정기 결제 20% 할인</div>
                <div>+</div>
                <div>VIP 스킨 제공</div>
              </div>
            </div>
          </div>
        </article>
      </section>
    </main>
    <aside class="chat-wrap">
      <ul>
        <li>
          <div class="chat-p"></div>
          <div class="chat-n">김태경</div>
        </li>
      </ul>
    </aside>
  </body>
</html>
