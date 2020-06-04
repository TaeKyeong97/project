<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/join.css" type="text/css">
</head>
<body style="background:#fff;">
	<div class="lj-title-con" style="border-radius:0;">
		<h2 class="lj-title" style="margin-top:0; padding:12px 0; font-size:15px;">회원가입</h2>
	</div>
	<c:choose>
		<c:when test="${idOver>'0'}">
			<h5 style="margin:15px 0 10px 0; text-align:center; color:red;">사용중인 아이디 입니다.</h5>
			<div class="join-inp-con">
				<input type="text" value="${param.EM_id}" class="ok j-inp-sty" style="width:83%;">
				<input type="button" value="중복확인" value="0" onclick="reCk();" class="j-inp-btn">
			</div>
		</c:when>
		<c:otherwise>
			<h5 style="margin:15px 0 10px 0; text-align:center; color:blue;">사용가능한 아이디 입니다.</h5>
			<div class="join-inp-con">
				<input type="text" value="${param.EM_id}" class="ok j-inp-sty" style="width:83%;" readonly>
				<input type="button" value="사용하기" value="1" onclick="ok()" class="j-inp-btn" style="background:rgb(95, 121, 255);">
			</div>
		</c:otherwise>
	</c:choose>
	
<script>
	function ok(){
		var ok = document.getElementsByClassName("ok")[0];
		window.opener.okes(ok.value);
		window.close();
	}
	function reCk(){
		var ok=document.getElementsByClassName("ok")[0];
		location.href="overCK.ops?EM_id="+ok.value;
	}
</script>
</body>
</html>