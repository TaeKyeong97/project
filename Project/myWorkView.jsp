<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 내업무 상세 보기 -->
<div class="header">
	<div class="btn" onclick="UPMCkNot(2,3)">취소</div>
	<div class="title">업무 알림 열람</div>
</div>
<div class="body" style="height:100%;">
	<div class="not-content-title">${myworkview.wo_title}</div>
	<div class="not-content-gnb">
		<div>작성자 : ${myworkview.ws_receive }</div>
		<div>공개범위</div>
		<div>${myworkview.wo_StratDate} ~ ${myworkview.wo_EndDate}</div>
		<a href="#p" onclick="UPMCkNot(2,3);UPMCkNot(1,1); notPopupChangeView(${myworkview.wo_no})">수정</a>
		<a href="#p" onclick="notPopupDelete(${myworkview.wo_no})">삭제</a>
	</div>
	<div class="not-content-con" style="width:792px; overflow:hidden;">
		${myworkview.wo_content}
	</div>
	<script>
	function notPopupChangeView(woNo){
		$.ajax({
			url:'MyworkViewChange.ops',
			method:'post',
			dataType:'html',
			data:{wo_no:woNo},
			success:function(response){
				$(".popup1").html(response);
			}
		});
	}
	function notPopupDelete(woNo){
		$.ajax({
			url:'MyworkDelete.ops',
			method:'post',
			dataType:'html',
			data:{wo_no:woNo},
			success:function(response){
				location.reload();
			}
		});
	}
	</script>
</div>
