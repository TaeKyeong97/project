<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="robots" content="noindex">
    <!-- <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"> -->
    <title>프로젝트 생성 페이지</title>
    <link rel="stylesheet" type="text/css" href="../css/user-p-main.css">
    <link rel="stylesheet" href="../css/admin-p-main2.css">
    <link rel="stylesheet" href="../css/create.css">
    <!--드래그하기전 사용 했던것 <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>-->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <style>
      .x-xcreate-wrap{top:35%; left:50% ;background-color:rgb(81, 86, 105); border:1px solid rgba(45, 66, 105, 0.14); box-shadow:0px 0px 5px 5px #515669; position: absolute; transform: translate(-50%, -50%); z-index: 50;}
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
    <!-- head gnb -->
	<script type="text/javascript" src="js/head.js" charset="UTF-8"></script>
    <!-- 프로젝트 생성 js -->
    <script type="text/javascript" src="js/pjCreate.js" charset="UTF-8"></script>
    <!--그룹추가-->
    <script type="text/javascript">
    b=0;
      function gck(a){
        b++;
        $('.group-con').append("<span id='GID"+b+"' style='position:relative; display:block;'><input type='text' name='g_title' placeholder='그룹명을 입력하세요'><span style='position: absolute; top: 19px; right: 88px; display: block;' onclick='gckClose("+b+"); price(\"UNgroup\") '>닫기</span></span>");
      }
      function gckClose(c){
        $('#GID'+c).remove();
      }
    </script>
  </head>
  <body>
    <!--skip-->
    <div class="skip">
      <a href="#content">본문 바로가기</a>
    </div>
    <script type="text/javascript">
      $('.skip a').on('focus',function(){
        $(this).stop().animate({"margin-top":0,"opacity":1});
      });
      $('.skip a').on('click', function(){
        $(this).stop().animate({"margin-top":0, "opacity":0});
    });
    $('.skip a').on('focusout', function(){
        $(this).stop().animate({"margin-top":"-32px", "opacity":0});
    });
    </script>
    <!--//skip-->
    <!--<jsp:include page="../OneFolderHead.ops"  flush="false" ></jsp:include>-->
    <%@include file="../OneFolderHead.jsp" %>
    <%@include file="../OneFolderNav.jsp" %>
    <main id="content">
      <form name="PJ" action="projectPro.ops" method="post">
          <div class="x-pwrap">
            <!--생성-->
            <div class="x-xcreate-wrap">
              <div class="x-xhead">
                <span class="x-xtitle">프로젝트 총괄 시스템 생성</span>
                <span class="x-xside">
                  <span></span>
                  <span></span>
                  <span></span>
                </span>
              </div>
              <!--1-->
              <div class="x-xbody con1">
                <div class="x-xcon">
                  <input type="text" class="title" name="title" placeholder="프로젝트 이름">
                  <input type="text" name="subTitle" placeholder="부가 설명">
                </div>
                <input type="button" value="다음" onclick="ck(2)">
              </div>
              <!--2-->
              <div class="x-xbody con2">
                <div class="x-xcon">
                  <div class="x-xpeo">프로젝트 참가인원 <span id="sortIdx">0</span>명</div>
                  <span id="sortIdx2"></span>
                  <div class="x-xpeo-xwrap">
                    <ul id="sortable2" class="x-xpeople-con connectedSortable"></ul>
                    <ul id="sortable1" class="x-xupeople-con connectedSortable">
                    <c:forEach var="mba" items="${mba}" varStatus="status">
                      <li id="${mba.EM_id}" class="x-xuser-con">
                          <span id="u-${mba.EM_id}" class="use">${mba.EM_name}</span><span title="닫기"></span>
                      </li>
                    </c:forEach>
                    </ul>
                  </div>
                </div>
                <div class="x-next">
                  <input type="button" value="이전" onclick="ck(1)"><input type="button" value="다음" onclick="ck(3)">
                </div>
              </div>
              <!--3-->
              <div class="x-xbody con3">
                <div class="x-xcon group-con">
                  <input type="text" name="g_title" placeholder="그룹명을 입력하세요">
                </div>
                <input type="button" value="+ 그룹추가" style="position:relative; margin-bottom:105px;" onclick="gck(1);price('group')">
                <div class="x-next" style="position:absolute; bottom:3px; left:50%; transform:translate(-50%,0);">
                  <input type="button" value="이전" onclick="ck(2)"><input type="button" value="다음" onclick="ck(4)">
                </div>
              </div>
              <!--4-->
              <div class="x-xbody con4">
              	<div class="x-xcon">
                  <input type="text" class="serviceDate" name="serviceDate" placeholder="사용종료일 입력 (2019-05-25)">
                  <select class="storage" name="pjSpace" selected style="width:81%; margin:25px auto; padding:22px; background:rgb(89, 94, 115); color:#fff; border:0; border-radius:8px; display:block;" onclick="price('storage')">
                  	<option value="1">사용 용량 (30GB)</option>
                  	<option value="2">사용 용량 (50GB)</option>
                  	<option value="3">사용 용량 (100GB)</option>
                  </select>
                </div>
                <div class="x-next">
                  <input type="button" value="이전" onclick="ck(3)"><input type="button" value="다음" onclick="ck(5);price('date')">
                </div>
              </div>


				
              <!--5-->
              <div class="x-xbody con5">
                <div class="x-xcon">
                  <div class="x-xpeo">결제</div>
                  <div class="x-xka-pay">
                    <div class="ka-logo"></div>
                    <span class="kakaoPay"style="line-height:100px; color:#222; font-size:25px;">카드결제</span>
                    <input class="buy_price" type="hidden" name="buy_price">
                  </div>
                </div>
                <div class="x-next" style="margin-top:67px;">
                  <input type="button" value="이전" onclick="ck(4)"><input type="button" value="프로젝트 생성" onclick="ck(6)">
                </div>
              </div>
            </div>
          </div>
      </form>
    </main>
    <script>
    	function check(name){
    		//카카오 결제후 넘겨서 처리
    		if(name!=7){
    			return false;
    		}else{
               	document.PJ.submit();
    		}
    	}
    </script>
<!--생성 알림 시작-->
<div class="gnb_notiec notiec-main">
  <div class="gnb_notiec_list">
    정상적으로 생성 되었습니다.
    <div class="lis-info">
    알림생성
    </div>
    <div style="width:23px; position:absolute; top:23px; right:20px;">
      <svg version="1.1" x="0px" y="0px" viewBox="0 0 100 100" style="enable-background:new 0 0 100 100;" xml:space="preserve"> <g> <line style="fill:none;stroke:#FFFFFF;stroke-width:3;stroke-linecap:round;stroke-miterlimit:10;" x1="3.5" y1="96" x2="97" y2="2.5"></line> </g> <g> <line style="fill:none;stroke:#FFFFFF;stroke-width:3;stroke-linecap:round;stroke-miterlimit:10;" x1="3.5" y1="2.5" x2="97" y2="96"></line> </g> </svg>
    </div>
  </div>
  <div class="gnb_notiec_list" style="background:#ad7474;">
    생성에 실패 하였습니다.
    <div class="lis-info">
    알림생성 Error::
    </div>
    <div style="width:23px; position:absolute; top:23px; right:20px;">
      <svg version="1.1" x="0px" y="0px" viewBox="0 0 100 100" style="enable-background:new 0 0 100 100;" xml:space="preserve"> <g> <line style="fill:none;stroke:#FFFFFF;stroke-width:3;stroke-linecap:round;stroke-miterlimit:10;" x1="3.5" y1="96" x2="97" y2="2.5"></line> </g> <g> <line style="fill:none;stroke:#FFFFFF;stroke-width:3;stroke-linecap:round;stroke-miterlimit:10;" x1="3.5" y1="2.5" x2="97" y2="96"></line> </g> </svg>
    </div>
  </div>
</div>
<!--생성 알림 종료-->
    <aside class="chat-wrap">
      <ul>
        <li>
          <div class="chat-p"></div>
          <div class="chat-n">김태경</div>
        </li>
      </ul>
    </aside>
    <script>
      function userInfoChage(infoCk){
        if(infoCk=='email'){
          var userInfoChage0 = document.getElementsByClassName("userInfo-con")[1];
          userInfoChage0.style.display="none";
          var userInfoChage = document.getElementsByClassName("userInfo-con")[2];

          userInfoChage.style.display="block";

        }else if(infoCk=='pw'){
          var userInfoChage0 = document.getElementsByClassName("userInfo-con")[2];
          userInfoChage0.style.display="none";
          var userInfoChage = document.getElementsByClassName("userInfo-con")[1];
          userInfoChage.style.display="block";
        }

      }
    </script>
    
    <!-- 가격 측정 -->
    <script>
		// 날짜 비교
		   function dateDiff(_date1, _date2) {
		       var diffDate_1 = _date1 instanceof Date ? _date1 : new Date(_date1);
		       var diffDate_2 = _date2 instanceof Date ? _date2 : new Date(_date2);
		    
		       diffDate_1 = new Date(diffDate_1.getFullYear(), diffDate_1.getMonth()+1, diffDate_1.getDate());
		       diffDate_2 = new Date(diffDate_2.getFullYear(), diffDate_2.getMonth()+1, diffDate_2.getDate());
		    
		       var diff = Math.abs(diffDate_2.getTime() - diffDate_1.getTime());
		       diff = Math.ceil(diff / (1000 * 3600 * 24));
		    
		       return diff;
		   }
		   dateDiff(a, new Date());
		   
		var group=100;
		var storN=900;
		var pricN=100;
		function price(gubun){
			if(gubun=='group'){
				group+=100;
			}else if(gubun=='storage'){
				var storage=$('.storage').val();
				if(storage=="1"){
					storN=900;
				}else if(storage=="2"){
					storN=1500;
				}if(storage=="3"){
					storN=3000;
				}
			}else if(gubun=='UNgroup'){
				group-=100;
			}
			
			if(gubun=='date'){
				var a=$(".serviceDate").val();
				var pri=dateDiff(a, new Date());
				priNum=parseInt(pri/3)
				
				switch(priNum){
			    	case 0:pricN=100;
			        break;
			    	case 1:pricN=200;
			        break;
			    	case 2:pricN=300;
			        break;
			    	case 3:pricN=400;
			        break;
			    	case 4:pricN=500;
			        break;
			    	case 5:pricN=600;
			        break;
			    	case 6:pricN=700;
			        break;
			    	case 7:pricN=800;
			        break;
			    	case 8:pricN=900;
			        break;
			    	case 9:pricN=1000;
			        break;
			    	case 10:pricN=1090;
			        break;
			    	case 11:pricN=1190;
			        break;
			    	case 12:pricN=1250;
			        break;
				}
				$(".kakaoPay").text(""+(parseInt(group)+parseInt(storN)+parseInt(pricN)));
				$(".buy_price").val(""+(parseInt(group)+parseInt(storN)+parseInt(pricN)));
			}			
		}
    </script>
  </body>
</html>
