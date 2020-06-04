<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>로그인</title>
    <link rel="stylesheet" href="../css/common.css" type="text/css">
    <style media="screen" type="text/css">
    ul{list-style-type: none;}
    a{text-decoration:none;}
      .l-wrap{width:489px; margin:0 auto; padding-top:200px;}
      .l-wrap .l-header{width:229px; height:79px; margin:0 auto; margin-bottom:50px; background:url('../img/common_lgo.png') no-repeat; background-position:-203px -27px;}
      .l-login-con>input{width:423px; margin-top:14px; padding:25px 23px; border:1px solid #dedede; font-size:16px; color:#3e3e3e;}
      .l-login-con>input::-webkit-input-placeholder{color:#d5d5d5;}

      .l-suumit-con{margin-top:30px;}
      .l-suumit-con .l-submit{width:100%; border:0; padding:20px; font-size:20px; background-color:#f76060; text-align: center; color:#fff; font-size:23px; font-weight:bold;}
      .l-nave{margin-top:19px;}
      .l-nave #naver-logo{width:185px; height:40px; background:url('../img/common_lgo.png') no-repeat; background-position:-13px -435px; display:block;}
      .l-nave .sns-login{float:left;}
      .l-nave .sub-add{float:right;}

      .sub-add>ul li{float:left; font-size:12px;}
      .sub-add>ul li a{color:#535353;}
      
      .login-menu{overflow:hidden; text-align:center; font-weight:bold; }
      .login-menu>span{width: 50%; float: left; border-top: 1px solid; padding: 25px 0;cursor:pointer; }
      .login-menu>span:nth-child(1){border-color:#f76060; background: #f8f8f8; }
      .login-menu>span:nth-child(2){border-color:#b4b8c0; background: #f3f3f3;}
      .fom-wrap{background:#f8f8f8; padding:19px 9px 8px 9px;}
      .log2{display:none;}
      .logM1,.logM2{font-weight:bold;}
    </style>
  </head>
  <body>
<c:choose>
	<c:when test="${EM_id==null}">
		<div class="l-wrap">
		  <div class="l-header">
		    <a href="../index.ops" style="width:100%; height:100%;overflow:hidden; display:block;"></a>
		  </div>
		  <div class="login-menu" ondragstart='return false' onselectstart='return false'>
		  	<span class="logM1" onclick="logCk(1)" style="<c:choose><c:when test="${logCk.equals('0')||logCk=='0'}">${loginCk3}</c:when><c:otherwise>${loginCk1}</c:otherwise></c:choose>">일반 로그인</span>
		  	<span class="logM2" onclick="logCk(2)" style="<c:choose><c:when test="${logCk.equals('1')||logCk=='1'}">${loginCk2}</c:when><c:otherwise>${loginCk1}</c:otherwise></c:choose>">기업 로그인</span>  	
		  </div>
		  <form action="login_Pro.jsp?URL=${URL}&&kind=user" name="log1" method="post" class="log1" style="<c:choose><c:when test="${logCk.equals('0')||logCk=='0'}">display:block;</c:when><c:otherwise>display:none;</c:otherwise></c:choose>">  																						
			  <div class="fom-wrap">
				  <div class="l-login-con">
				    <input type="text" name="id" value="admin" placeholder="아이디">
				    <input type="password" name="pw" value="admin" placeholder="비밀번호">
				  </div>
				  <div class="l-suumit-con">
				    <input class="l-submit" type="submit"value="로그인">
				  </div>
			  </div>
		  </form>
		  <form action="loginPro.ops?URL=${URL}&&kind=corp" name="log2" method="post" class="log2" style="<c:choose><c:when test="${logCk.equals('1')||logCk=='1'}">display:block;</c:when><c:otherwise>display:none;</c:otherwise></c:choose>">																			
			  <div class="fom-wrap">
				  <div class="l-login-con">
				    <input type="text" name="id" value="" placeholder="아이디">
				    <input type="password" name="pw" value="" placeholder="비밀번호">
				  </div>
				  <div class="l-suumit-con">
				    <input class="l-submit" type="submit"value="기업 로그인" style="background:rgb(96, 129, 247)">
				  </div>
			  </div>
		  </form>
		  <div class="l-nave">
		    <div class="sns-login">
		      <a href="#" id="naver-logo"></a>
		    </div>
		    <div class="sub-add">
		      <ul>
		        <li><a href="../join/v1join.jsp">회원가입</a></li>
		        <li>｜</li>
		        <li><a href="userFind.ops?loginCk=0">아이디 찾기</a></li>
		        <li>｜</li>
		        <li><a href="userFind.ops?loginCk=1">비밀번호 찾기</a></li>
		      </ul>
		    </div>
		  </div>
		</div>
</c:when>
<c:when test="${EM_id!=null}">
<div class="l-wrap">
		  <div class="l-header">
		    <a href="https://m.ppo.or.kr/index.jsp"></a>
		  </div>
		  <div class="login-menu">
		  	<span class="logM1" onclick="logCk(1)">일반 로그인</span>
		  	<span class="logM2" onclick="logCk(2)">기업 로그인</span>
		  </div>
			  <div class="fom-wrap">
				  <div class="l-login-con">
				    <h3 style=" text-align: center; padding: 50px 0; ">${EM_id} 님</h3>
				  </div>
				  <div class="l-suumit-con">
				    <a href="../logout/logout.jsp?url=${URL}" class="l-submit" type="submit" style="width:auto; display:block; ">로그아웃</a>
				  </div>
			  </div>
		</div>
</c:when>
</c:choose>
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script>
   		a=${logCk};
    	function logCk(a){
    		if(a==1){
    			$('.logM1').css("border-color","#f76060").css("background","#f8f8f8");
    			$('.logM2').css("border-color","#b4b8c0").css("background","#f3f3f3");
    			$('.log1').css("display","block");
    			$('.log2').css("display","none");
    		}else{
    			$('.logM1').css("border-color","#b4b8c0").css("background","#f3f3f3");
    			$('.logM2').css("border-color","rgb(96, 129, 247)").css("background","#f8f8f8");
    			$('.log1').css("display","none");
    			$('.log2').css("display","block");
    		}
    	}
    </script>
  </body>
</html>
