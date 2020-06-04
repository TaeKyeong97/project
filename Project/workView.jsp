<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="header">
	<div class="btn" onclick="UPMCkNot(1,3)">취소</div>
	<div class="title">업무 알림 열람</div>
</div>
<div class="body" style="height:100%;">
	<div class="not-content-title">${work.wo_title}</div>
	<div class="not-content-gnb">
		<div>작성자 : ${work.ws_receive}</div>
		<div>공개범위</div>
		<div>${work.wo_StratDate} ~ ${work.wo_EndDate}</div>
	</div>
	<div class="not-content-con" style="width:792px; overflow:hidden;">
		${work.wo_content}
	</div>
</div>
