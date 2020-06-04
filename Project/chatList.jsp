<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 승인 대기 중인 친구목록 -->
		<c:forEach var="chatAck" items="${chatAck}" varStatus="status">		
          <div class="x-xuser-con1">
          	<div class="x-divbg" id="${chatAck.cha_code}" x-dataid="${chatAck.cha_me}"></div>
            <div class="x-user-info">
              <img src="" alt="">
              <span class="xicon-x"></span>
            </div>
            <div class="x-user-name">${chatAck.cha_me}</div>
            <div class="x-user-inf">
              	상태:--
            </div>
            <div style=" top:17px; right:20px;position:absolute;">
            	<a href="#p" style="margin:0 3px; padding:7px 10px; font-size:13px; background:#6081f7; display:block; float:left;" onclick="ackno('${chatAck.cha_me}','1','0');">승인하기</a>
            	<a href="#p" style="margin:0 3px; padding:7px 10px; font-size:13px; background:#53586c; display:block; float:left;" onclick="ackno('${chatAck.cha_me}','-1','0');">거절하기</a>
            </div>
            
          </div>
		</c:forEach>
		<!-- 승인한 친구 목록 -->
		<c:forEach var="chattList" items="${chattList}" varStatus="status">
			<div class="x-xuser-con1">
          	<div class="x-divbg" id="${chattList.cha_code}" x-dataid="<c:choose> <c:when test="${chattList.cha_me==myid}"> ${chattList.cha_opp} </c:when> <c:when test="${chattList.cha_me!=myid}"> ${chattList.cha_me} </c:when> </c:choose>"></div>
            <div class="x-user-info">
              <img src="" alt="">
              <span class="xicon-x"></span>
            </div>
            <div class="x-user-name">
            	<c:choose>
            		<c:when test="${chattList.cha_me==myid}">
            			${chattList.cha_opp}
            		</c:when>
            		<c:when test="${chattList.cha_me!=myid}">
            			${chattList.cha_me}
            		</c:when>
            	</c:choose>
            </div>
            <div class="x-user-inf">
              	상태:--
            </div>
            <div style=" top:17px; right:20px;position:absolute;">
            	<c:if test="${chattList.cha_appr==0}">
            		<a href="#p" style="margin:0 3px; padding:7px 10px; font-size:13px; background:#53586c; display:block; float:left;">승인대기중</a>
            	</c:if>
            	<c:if test="${chattList.cha_appr.equals('-1')}">
            		<a href="#p" style="margin:0 3px; padding:7px 10px; font-size:13px; background:#53586c; display:block; float:left;" onclick="ackno('${chattList.cha_opp}','0','1');">재요청</a>
            	</c:if>
            </div>
            
          </div>
		</c:forEach>
		<script>
			$(".x-divbg").dblclick(function(){
				var oppId=$(event.target).attr("x-dataid");
				console.log(oppId);
				$.ajax({
		        	type:'GET',
		        	dataType: 'html',
		        	data: {'opp': oppId},
		    		url : "chat.op",
		    		success : function(response) {
		                $(".x-cht-con").html(response);
		    		}
		    	});
			});
		</script>