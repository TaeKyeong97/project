<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="pgplist" items="${pgplist}" varStatus="status">
		<div class="x-g-pcon">
            <div class="x-g-pcon-t">
              <span><a href="projectView.op?pj_no=${param.pj_no}&&pjg_no=${param.gp_no}&&pjgp_no=${pgplist.pjgp_no}">${pgplist.pjgp_title}</a></span>
              <span>${pgplist.startDate } ~ ${pgplist.endDate }</span>
            </div>
            <div class="x-g-pcon-st">
              <span class="x-g-st">${pgplist.pjgp_content }</span>
              <span class="x-g_p_info"><span class="xicon-x"></span><span>진행중</span></span>
            </div>
            <div class="x-g_pp">
              <div class="x-g_pp-h">구성원</div>
              <div class="x-g_pp-b">
                <span><img src="" alt=""></span>
                <span><img src="" alt=""></span>
                <span><img src="" alt=""></span>
                <span><img src="" alt=""></span>
                <a href="#">더보기</a>
              </div>
              <div class="x-percent">
                <span style="width:90%; background:#6081f7;">90%</span>
              </div>
            </div>
          </div>
 </c:forEach>  
<div class="x-g-pcon" style="border-color:#60657d;">
	<a href="#" style="line-height:190px; text-align:center; display:block;" onclick="gpProjectCreate('${param.gp_no}','${param.pj_no}')">+ 프로젝트 생성</a>
</div>
		<div class="x-xcreate-wrap groupwrap">
	        <div class="x-xhead">
	          <span class="x-xtitle">그룹 프로젝트 생성</span>
	          <span class="x-xside">
	            <span></span>
	            <span></span>
	            <span></span>
	          </span>
	        </div>
	        <div class="x-xbody" style="display: block;">
	         <!--1-->
	         <form id="pjgpj" name="pjgpj" action="groupPro.op" method="post">
	         	<input type="hidden" name="pjg_no" value="${param.gp_no}">
	         	<input type="hidden" name="pj_no" value="${param.pj_no}">
				<div class="x-xcon pgcon1">
                  <input type="text" name="title" placeholder="그룹 프로젝트 이름">
                  <input type="text" name="subTitle" placeholder="부가 설명">
                  <div class="x-next" style="margin-top:67px;">
	                <input type="button" value="취소" onclick="GPPreProjectCk(0)"><input type="button" value="다음" onclick="GPPreProjectCk(2)">
	              </div>
                </div>
                <!--2-->
                <div class="x-xcon pgcon2" style="display: none;">
                  <input type="text" name="startDate" placeholder="시작일 (2019-06-04)">
                  <input type="text" name="endDate" placeholder="종료일 (2019-06-20)">
                  <select name="division" style="width:81%; margin:25px auto; padding:22px; background:rgb(89, 94, 115); color:#fff; border:0; border-radius:8px; display:block;">
                  	<option value="1">개인별</option>
                  	<option value="2">요일별</option>
                  </select>
                  <div class="x-next" style="margin-top:67px;">
	                <input type="button" value="이전" onclick="GPPreProjectCk(1)"><input type="button" value="다음" onclick="GPPreProjectCk(3)">
	              </div>
                </div>
                <!--3-->
                <div class="x-xbody pgcon3" style="display: none;">
				  <div class="x-xcon">
				    <div class="x-xpeo">프로젝트 참가인원 <span id="sortIdx0">0</span>명</div>
				    <span id="sortIdx3"></span>
				    <div class="x-xpeo-xwrap">
				      <ul id="sortable4" class="x-xpeople-con connectedSortable ui-sortable"></ul>
				      <ul id="sortable3" class="x-xupeople-con connectedSortable ui-sortable"></ul>
				    </div>
				  </div>
				  <div class="x-next">
	                <input type="button" value="이전" onclick="GPPreProjectCk(2)"><input type="button" value="다음" onclick="GPPreProjectCk(4)">
	              </div>
				</div>
			
	            <!--4-->
	            <div class="x-xbody pgcon4" style="display: none;">
	              <div class="x-xcon">
	                <br><br>
	                <div class="x-xka-pay" style="background:#595e73;">
	                  <div style="height:35px;"></div>
	                  <span style="line-height:100px; color:#fff;">그룹 프로젝트를 생성 하시 겠습니까?</span>
	                </div>
	              </div>
	              <div class="x-next" style="margin-top:67px;">
	                <input type="button" value="이전" onclick="GPPreProjectCk(3)"><input type="button" value="변경 완료" onclick="GPPreProjectCk(5)">
	              </div>
	            </div>
           	</form>
           	</div>
            <script>
            	//그룹별 인원추가
	            function gpProjectCreate(id,no,number){
	            	//보여주기
	            	$(".groupwrap").attr("style","display:block");
	            	
	            	//현재 그룹에 참여중인 인원
	        		$.ajax({
	        			url:"projectGroupPreInfo.op?pj_no="+no+"&&pjg_no="+id,
	        			method:'post',
	        			dataType:'html',
	        			data:{pj_no:no,pjg_no:id},
	        			success:function(response){
	        				$("#sortable3").html(response);
	        			},
	        			error:function(response){
	        				$("#sortable3").html(response);
	        			}
	        		});
	        	}
            
            	//그룹참가인원 다음버튼
            	function GPPreProjectCk(a){
            		if(a==0){
            			$(".groupwrap").attr("style","display:none");
            		}
            		if(a==1){
            			$('.pgcon1').css('display','block');
            			$('.pgcon2').css('display','none');
            			$('.pgcon3').css('display','none');
            			$('.pgcon4').css('display','none');
            		}else if(a==2){
            			$('.pgcon1').css('display','none');
            			$('.pgcon2').css('display','block');
            			$('.pgcon3').css('display','none');
            			$('.pgcon4').css('display','none');
            		}else if(a==3){
            			$('.pgcon1').css('display','none');
            			$('.pgcon2').css('display','none');
            			$('.pgcon3').css('display','block');
            			$('.pgcon4').css('display','none');
            		}else if(a==4){
            			$('.pgcon1').css('display','none');
            			$('.pgcon2').css('display','none');
            			$('.pgcon3').css('display','none');
            			$('.pgcon4').css('display','block');
            		}else if(a==5){
            			document.pjgpj.submit();
            		}
            	}

            </script>
            <script>
            $(function() {
            	$( "#sortable3, #sortable4" ).sortable({
                    connectWith: ".connectedSortable",
                    update: function(event, ui) {
                        var productOrder2 = $('#sortable4').sortable('toArray').toString();
                        var obj = document.querySelectorAll(".use");
                        var arr = [];
                        var k;
                        for (k = 0; k < obj.length; k++) {
                            arr[k] = obj[k].innerText;
                        }


                        var productOrder = $("#sortable4>li").length;
                        $("#sortIdx0").text (productOrder);

                        var cc = $('#sortable4').sortable('toArray').toString();
                        $("#sortIdx3").html("<input type='hidden' name='c_userID' value='"+cc+"'>");
                        
                    }
                }).disableSelection();
            	
            });
            </script>
         </div>