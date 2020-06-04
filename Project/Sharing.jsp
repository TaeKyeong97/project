<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%> 
<!-- 업로드 및 다운로드가 편리합니다. -->
<link rel="stylesheet" href="css/admin-p-main2.css">
<script>
//닫기
function closes(className){
	$(className).hide();
}
</script>
<main style="width:100%;">
	<a href="fileUpload.op?pj_no=${param.pj_no}&&pjgp_no=${param.pjgp_no}&&page=${param.page}" style="margin:9px 5px; padding:8px 15px; float:right; background:#6081f7;">파일 업로드</a>
	<table class="x-x-PJList" style="width:100%; margin-top:20px">
		<tr class="head">
			<th>프로젝트 해드</th>
			<td>번호</td>
			<td>파일명</td>
			<td>업로드일</td>
			<td>다운로드</td>
			<td>확장자</td>
			<td>작성자</td>
		</tr>
		<c:forEach var="upfileList" items="${upfileList}" varStatus="status" begin="${startPage}" end="${endPage}">
			<tr class="infocks25">
				<th>프로젝트 리스트</th>
				<td>${upfileList.file_no}</td>
				<td>${upfileList.file_fileName}</td>
				<td>${upfileList.file_date.substring(0, 16)}</td>
				<td><a href="download.op?fileName=${upfileList.file_fileName}&&downName=${upfileList.file_fileName}&&pj_no=${param.pj_no}" style="padding:5px 10px; border:1px solid #6c7186ad;">다운로드</a></td>
				<td>. ${upfileList.file_exten}</td>
				<td>${upfileList.file_admin} 
					<c:if test="${upfileList.file_admin==EM_id}">
						<a href="#" style="padding:0px 7px 3px; border:1px solid #878da7;" onclick="FileOpenDelete('${upfileList.file_no}')">x</a>
					</c:if>
				</td>
			</tr>        
		</c:forEach>
	</table>
	<div style="text-align:center; margin-top:25px; ">
		<c:forEach var="maxGrouPage" varStatus="status" begin="1" end="${maxGrouPage}">
			<c:if test="${param.page==status.index}">
				<a href="#" onclick="GroupProjectOpenS('GongYu','${param.pj_no}','${param.pjgp_no}','${status.index}')" style="padding:5px 10px; border:1px solid #4e5366; background:rgb(96, 129, 247);">${status.index}</a>
			</c:if>
			<c:if test="${param.page!=status.index}">
				<a href="#" onclick="GroupProjectOpenS('GongYu','${param.pj_no}','${param.pjgp_no}','${status.index}')" style="padding:5px 10px; border:1px solid #4e5366; background:#595e73;">${status.index}</a>
			</c:if>
		</c:forEach>
	</div>
	<div class="waringCon" style="top:40%; display:none; left:50%; background:rgb(77, 82, 100); position:absolute; transform:translate(-50%, -50%); text-align:center; box-shadow:0px 0px 9px 3px #454a5a">
		<div style="padding:5px 0; background:rgb(89, 94, 115);">경고 문</div>
		<div style="padding:20px 32px;">정말로 삭제 하시겠습니까?</div>
		<div>
			<a href="#" style="width:48%; padding:3% 1%; display:block; text-align:center; float:left;" onclick="closes('.waringCon')">취소</a>
			<a id="FileDelete" href="#" style="width:48%; padding:3% 1%; display:block; text-align:center; float:left;" onclick="FileDelete()">확인</a>
		</div>
	</div>
	<script>
		function FileOpenDelete(file_no){
			$("#FileDelete").removeAttr("onclick");
			$("#FileDelete").attr("onclick","FileDelete('"+file_no+"')");
			$(".waringCon").show();
		}
		function FileDelete(file_no){
			$.ajax({
				url:'deleteFile.op',
				type:'post',
				dataType:'html',
				data:{file_no:file_no},
				success:function(response){
					location.href="project.op?pj_no=${param.pj_no}&&gpContent=GongYu&&pjgp_no=${param.pjgp_no}&&page=${param.page-nextPage}";
				}
			});
		}
	</script>
</main>