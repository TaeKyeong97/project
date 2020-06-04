<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>참여중인 프로젝트 현황</title>
    <link rel="stylesheet" type="text/css" href="css/user-p-main.css">
    <link rel="stylesheet" href="css/admin-p-main2.css">
    <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
  	<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
  </head>
  <body>
    <%@include file="head.jsp" %>
    <%@include file="nav.jsp" %>
    <main>
      <!--알림 시작-->
      <section>
        <article class="admin_info_con">
          <div class="content">
            My페이지 프로젝트를 여러개 연람하기 위해서는 <span style="color:#ffde29;"><b>프리미엄</b></span> 계정으로 업그레이드가 필요합니다.<br>
            카드 등록하고 정기 결제시 첫 결제 3개월 100원
            &nbsp;&nbsp;<a href="#">자시히보기▶</a>
          </div>
          <div class="close">
            close
          </div>
          <span class="bg"></span>
        </article>
      </section>
      <!--알림 끝-->

      <section>
        <article class="admin_pjckList-con">
          <div class="rating Premium">
            프리미엄 회원
          </div>
          <div class="pjckList-con">
            <div class="title">
              갤럭시 S10 프로젝트 외(1)
            </div>
            <div class="info">
              MY 페이지 노출 <a href="#">2</a>개
            </div>
          </div>
        </article>
        <article class="">
          <table class="admin_pjList-table">
            <tr>
              <td>선택</td>
              <td>프로젝트명</td>
              <td>그룹</td>
              <td>직책</td>
              <td>사용여부</td>
            </tr>
            <c:forEach var="pb" items="${pb}" varStatus="status">
	            <tr>
	              <td><input type="checkbox"></td>
	              <td>${pb.pj_title}</td>
	              <td>--</td>
	              <td>--</td>
	              <td>
	              <c:if test="${pb.mainP_status!=\"1\"}">
	              	<span class="Touse tous-${pb.pj_no}" onclick="projectMainCk('${pb.pj_no}','touse')"><span></span></span>
	              	<span class="use use-${pb.pj_no}" style="display:none;" onclick="projectMainCk('${pb.pj_no}','use')"><span class="useHov"></span><span class="useCk"></span></span>
	              </c:if>
	              
	              <c:if test="${pb.mainP_status==\"1\"}">
	              	<span class="Touse tous-${pb.pj_no}" style="display:none;" onclick="projectMainCk('${pb.pj_no}','touse')"><span></span></span>
	              	<span class="use use-${pb.pj_no}" onclick="projectMainCk('${pb.pj_no}','use')"><span class="useHov"></span><span class="useCk"></span></span>
	              </c:if>
	              </td>
	            </tr>
            </c:forEach>
          </table>
        </article>
        
        
        <article class="app-con">
          <h2>승인 대기중인 프로젝트</h2>
          <table class="admin_pjList-table">
            <tr>
              <td>선택</td>
              <td>프로젝트명</td>
              <td>그룹</td>
              <td>직책</td>
              <td>사용여부</td>
            </tr>
            <c:forEach var="pbAppl" items="${pbAppl}" varStatus="status">
            <tr>
              <td><input type="checkbox"></td>
              <td>${pbAppl.pj_title}</td>
              <td>--</td>
              <td>--</td>
              <td><span class="usea"><span class="appTouse" onclick="projectAppl(${pbAppl.mainP_no},'1')"></span></span> <span class="usea"><span class="appReTouse" onclick="projectAppl(${pbAppl.mainP_no},'-1')"></span></span></td>
            </tr>
            </c:forEach>
          </table>
        </article>
      </section>
    </main>
    <aside class="chat-wrap">
      <ul>
        <li>
          <div class="chat-p"></div>
          <div class="chat-n">김태경</div>
        </li>
      </ul>
    </aside>
    <script>
    	function projectMainCk(pjid,selectTo){
    			var tousN=document.getElementsByClassName("tous-"+pjid)[0];
        		var useN=document.getElementsByClassName("use-"+pjid)[0];
        		
        		$(".use").css("display","none");
        		//$(".Touse").css("display","inline-block");
        		$(".Touse").removeAttr("style");
      			
        		tousN.style.display="none";
        		useN.style.display=null;
   
    		
    		//MY페이지 지정
    		$.ajax({
    			url:'projectMainSettingPro.ops?pj_no='+pjid,
    			method : 'POST',
        		dataType : 'html',
    			success : function(response) {
                    
        		}
    		})
    	}
    	function projectAppl(pjid,Appl){
    		$.ajax({
    			url:'projectApplSettingPro.ops?pj_no='+pjid+'&&appl='+Appl,
    			method:'post',
    			dataType:'html',
    			success:function(response){
    				location.reload();
    			}
    		})
    		
    	}
    </script>
  </body>
</html>
