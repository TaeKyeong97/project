<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="pjgpi" items="${pjgpi}" varStatus="status">
	<li id="${pjgpi.pjg_userId}" class="x-xuser-con ui-sortable-handle">
		<span id="u-${pjgpi.pjg_userId}" class="use">${pjgpi.pjg_userId}</span><span title="닫기"></span>
	</li>
</c:forEach>
