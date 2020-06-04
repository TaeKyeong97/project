<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.gnb_notiec_list{animation:2s gnb_notiec_l; animation-fill-mode: forwards;}
	@keyframes gnb_notiec_l{
		0%{opacity:1;}
		50%{opacity:1;}
		100%{opacity:0;}
	}
</style>
<div class="gnb_notiec notiec-main" style="display:block;">
	<c:choose>
		<c:when test="${commit=='1'}">
			<div class="gnb_notiec_list" style="display:block;">
				성공적으로 추가 되었습니다.
				<div class="lis-info">
				친구추가 200 OK::
				</div>
				<div style="width:23px; position:absolute; top:23px; right:20px;">
					<svg version="1.1" x="0px" y="0px" viewBox="0 0 100 100" style="enable-background:new 0 0 100 100;" xml:space="preserve"> <g> <line style="fill:none;stroke:#FFFFFF;stroke-width:3;stroke-linecap:round;stroke-miterlimit:10;" x1="3.5" y1="96" x2="97" y2="2.5"></line> </g> <g> <line style="fill:none;stroke:#FFFFFF;stroke-width:3;stroke-linecap:round;stroke-miterlimit:10;" x1="3.5" y1="2.5" x2="97" y2="96"></line> </g> </svg>
				</div>
			</div>
		</c:when>
		<c:when test="${commit=='0'}">
			<div class="gnb_notiec_list" style="background:#626984; display:block;">
				추가에 실패 하였습니다.
				<div class="lis-info">
					친구추가 Error::
				</div>
				<div style="width:23px; position:absolute; top:23px; right:20px;">
					<svg version="1.1" x="0px" y="0px" viewBox="0 0 100 100" style="enable-background:new 0 0 100 100;" xml:space="preserve"> <g> <line style="fill:none;stroke:#FFFFFF;stroke-width:3;stroke-linecap:round;stroke-miterlimit:10;" x1="3.5" y1="96" x2="97" y2="2.5"></line> </g> <g> <line style="fill:none;stroke:#FFFFFF;stroke-width:3;stroke-linecap:round;stroke-miterlimit:10;" x1="3.5" y1="2.5" x2="97" y2="96"></line> </g> </svg>
				</div>
			</div>
		</c:when>
	</c:choose>
</div>
<script>
	setTimeout(function(){
		$(".gnb_notiec_list").css("display","none");
	},2000)
</script>