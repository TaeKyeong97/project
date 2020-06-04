<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav>
	<div class="admin_PageGo">
		<a href="create/pjCreate.ops" class="adm_Pcon"><div>프로젝트 생성 바로가기</div>
			<span style="width:25px; display:block;"><svg version="1.1" x="0px" y="0px" viewBox="0 0 31 31" style="enable-background:new 0 0 31 31;" xml:space="preserve"> <path style="fill:#FFFFFF;" d="M30,20.6c0.1-0.1,0.1-0.3,0-0.4c0-0.1-0.1-0.1-0.1-0.2L22,12.2c-0.2-0.2-0.6-0.2-0.8,0 c-0.2,0.2-0.2,0.6,0,0.8l6.8,6.8H1.6c-0.3,0-0.6,0.3-0.6,0.6C1,20.7,1.3,21,1.6,21h27.9c0.1,0,0.2,0,0.2,0 C29.8,20.9,29.9,20.8,30,20.6z"/> </svg></span>
		</a>
	</div> 
	
	<ul class="nav-con">
		<li><a href="index.ops?menu=mypage" <c:if test="${param.menu=='mypage'||param.menu==''}">class="nav-ck"</c:if>> MY 페이지</a></li>
		<li><a href="pjCurrent.ops?menu=parti" <c:if test="${param.menu=='parti'}">class="nav-ck"</c:if>>참여 프로젝트</a></li>
		<li><a href="pjCreateList.ops?menu=createList" <c:if test="${param.menu=='createList'}">class="nav-ck"</c:if>>생성한 프로젝트</a></li>
	</ul>
</nav>