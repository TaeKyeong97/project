<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/user-p-main.css">
<link rel="stylesheet" type="text/css" href="css/create.css">
<link rel="stylesheet" type="text/css" href="css/p-main.css">
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>

<title>Insert title here</title>
<style>
  header{background-color:rgba(89, 94, 115, 0); box-shadow:none;}
  .x-xcreate-wrap{top:35%; left:50% ;background-color:rgb(81, 86, 105); border:1px solid rgba(45, 66, 105, 0.14); box-shadow:0px 0px 5px 5px #515669; position: absolute; transform: translate(-50%, -50%); z-index: 50; display:none;}
  .x-xcreate-wrap .x-xhead{background-color:rgb(89, 94, 115);}
  .x-xcreate-wrap .x-xbody input[type="text"]{background:rgb(89, 94, 115); color:#fff;}
  .x-xcreate-wrap .x-xbody input[type="text"]:focus{background:rgb(74, 78, 97);}
  .x-xcreate-wrap .x-xbody input[type="button"]{background:rgb(89, 94, 115); color:#fff;}
  .x-xcreate-wrap .x-xbody input[type="button"]:hover{background:rgb(71, 75, 93); color:#fff;}
  .x-xcreate-wrap .x-xbody input::-webkit-input-placeholder{color:#fff}
  .x-xcreate-wrap .x-xbody .x-xcon .x-xpeo-xwrap .x-xpeople-con{background:#595e73;}
  .x-xcreate-wrap .x-xbody .x-xcon .x-xpeo-xwrap .x-xupeople-con{background:#595e73;}
  .x-xuser-con{background:#70768c;}
</style>
</head>
<body>
	<c:forEach var="pjgpi" items="${pjgpi}" varStatus="status">
		${pjgpi.pjg_userId}
	</c:forEach>
	
	
	<div class="x-xcreate-wrap" style="display:block;">
	        <div class="x-xhead">
	          <span class="x-xtitle">그룹 참가인원</span>
	          <span class="x-xside">
	            <span></span>
	            <span></span>
	            <span></span>
	          </span>
	        </div>
	         <!--1-->
	         <form id="pjgPe"name="pjgPe" action="projectGroupAddPro.op?pj_no=<c:out value="${param.pj_no }"></c:out>" method="post">
				<div class="x-xbody pcon1" style="display: block;">
				  <div class="x-xcon">
				    <div class="x-xpeo">프로젝트 참가인원 <span id="sortIdx">0</span>명</div>
				    <span id="sortIdx2"></span>
				    <div class="x-xpeo-xwrap">
				      <ul id="sortable2" class="x-xpeople-con connectedSortable ui-sortable">
				      
				      </ul>
				      <ul id="sortable1" class="x-xupeople-con connectedSortable ui-sortable">
				      	<li id="test" class="x-xuser-con ui-sortable-handle">
							<span id="u-test" class="use">test</span><span title="닫기"></span>
						</li>
				      </ul>
				    </div>
				    
				  </div>
				  <div class="x-next">
	                <input type="button" value="닫기" onclick="PreProjectCk(0)"><input type="button" value="다음" onclick="PreProjectCk(2)">
	              </div>
				  
				</div>
			</form>
            <!--3-->
            <div class="x-xbody pcon2" style="display: none;">
              <div class="x-xcon">
                <br><br>
                <div class="x-xka-pay" style="background:#595e73;">
                  <div style="height:35px;"></div>
                  <span style="line-height:100px; color:#fff;">설정사항을 저장 하시 겠습니까?</span>
                </div>
              </div>
              <div class="x-next" style="margin-top:67px;">
                <input type="button" value="이전" onclick="PreProjectCk(1)"><input type="button" value="변경 완료" onclick="PreProjectCk(3)">
              </div>
            </div>
            <script>
            	//그룹별 인원추가
	            function projectPeckIn(id,no,number){
	            	//보여주기
	            	$(".x-xcreate-wrap").attr("style","display:block");
	            	//참가인원 주기
	            	$("#sortIdx").text(number);
	            	   	
	            	//해당그룹에 인원 추가하기위해 만듬
	        		urlA="projectGroupAddPro.op?pj_no="+no+"&&pjg_no="+id;
	        		$('#pjgPe').attr("action",urlA);
	        		
	        		//현재 그룹에 참여중인 인원
	        		$.ajax({
	        			url:"projectGroupPreInfo.op?pj_no="+no+"&&pjg_no="+id,
	        			method:'post',
	        			dataType:'html',
	        			data:{pj_no:no,pjg_no:id},
	        			success:function(response){
	        				$("#sortable2").html(response);
	        			},
	        			error:function(response){
	        				$("#sortable2").html(response);
	        			}
	        		});
	        		
	        		//현재 그룹에 참여하고 있지 않은 인원
	        		$.ajax({
	        			url:"projectGroupPreExcInfo.op?pj_no="+no+"&&pjg_no="+id,
	        			method:'post',
	        			dataType:'html',
	        			data:{pj_no:no,pjg_no:id},
	        			success:function(response){
	        				$("#sortable1").html(response);
	        			},
	        			error:function(response){
	        				$("#sortable1").html(response);
	        			}
	        		});
	        		
	        	}
            
            	//그룹참가인원 다음버튼
            	function PreProjectCk(a){
            		if(a==0){
            			$(".x-xcreate-wrap").attr("style","display:none");
            		}
            		if(a==1){
            			$('.pcon1').css('display','block');
            			$('.pcon2').css('display','none');
            			$('.pcon3').css('display','none');
            		}else if(a==2){
            			$('.pcon1').css('display','none');
            			$('.pcon2').css('display','block');
            			$('.pcon3').css('display','none');
            		}else if(a==3){
            			document.pjgPe.submit();
            		}
            	}
            	//그룹 프로젝트 내용 불러오기
            	function GroupProjectOpen(gp_no,pj_no){
            		$.ajax({
	        			url:"group.op",
	        			method:'post',
	        			dataType:'html',
	        			data:{gp_no: gp_no,pj_no:pj_no},
	        			success:function(response){
	        				$("#GpContent").html(response);
	        			},
	        			error:function(response){
	        				$("#GpContent").html(response);
	        			}
	        		});
            		
            	
            	}
            	
            	//공유 페이지 불러오기
            	function GroupProjectOpenS(typeA,pj_no,pjgp_no,page){
            		$.ajax({
	        			url:"SharingList.op",
	        			method:'post',
	        			dataType:'html',
	        			data:{typeA:typeA,pj_no:pj_no,pjgp_no:pjgp_no,page:page},
	        			success:function(response){
	        				$("#GpContent").html(response);
	        			},
	        			error:function(response){
	        				$("#GpContent").html(response);
	        			}
	        		});
            		
            	
            	}
            </script>
            <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
    		<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
         </div>
</body>
</html>