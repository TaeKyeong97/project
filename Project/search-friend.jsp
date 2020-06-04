<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
	<c:when test="${message!=null}">
		<div style="width:67%; margin-top:50px; margin:50px auto; padding:11px 10px;  text-align: center; color:#fff; border:1px solid #454a5d; background:#454a5d; border-radius: 5px;">${message}</div>
	</c:when>
	<c:when test="${userId.EM_id!=null}">
	<br>
		<div class="x-xuser-con1">
			<div class="x-user-info">
				<img src="" alt="">
				<span class="xicon-x"></span>
			</div>
			<div class="x-user-name">${userId.EM_name}(${userId.EM_id})</div>
			<div class="x-user-inf">
				<a href="#a" onclick="friendAdd('${userId.EM_id}')">친구추가</a>
			</div>
			<div class="x-divbg"></div>
		</div>
		<script>
			function friendAdd(userId){
				$.ajax({
					url:'search-friendAdd.op',
					method:'post',
					dataType:'html',
					data:{userId:userId},
					success: function(response){
						$(".friend-state").html(response);
					}
				});
				
			}
		</script>
	</c:when>
	<c:otherwise>
		<div style="width:60%; margin-top:50px; margin:50px auto; padding:11px 10px;  text-align: center; color:#fff; border:1px solid #454a5d; background:#454a5d; border-radius: 5px;">존재 하지 않는 ID 입니다.</div>
	</c:otherwise>
</c:choose>
	<div class="friend-state">
	
	</div>
