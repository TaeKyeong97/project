<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:choose>
		<c:when test="${pjgpesList!=null}">
			<c:forEach var="pjgpesList" items="${pjgpesList}" varStatus="status">
				<li id="${pjgpesList.pjP_userId }" class="x-xuser-con ui-sortable-handle">
					<span id="u-${pjgpesList.pjP_userId }" class="use">${pjgpesList.pjP_userId }</span><span title="닫기"></span>
				</li>
				
			</c:forEach>
		</c:when>
		<c:otherwise>

		</c:otherwise>
	</c:choose>
