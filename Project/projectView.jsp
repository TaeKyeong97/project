<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>제목</title>
    <link rel="stylesheet" type="text/css" href="css/user-p-main.css">
    <link rel="stylesheet" type="text/css" href="css/create.css">
    <link rel="stylesheet" type="text/css" href="css/p-main.css">
    <link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png">
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
    <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
    <!-- 프로젝트 생성 js -->
    <script type="text/javascript" src="create/js/pjCreate.js" charset="UTF-8"></script>
    <script type="text/javascript">
      b=0;
      function ck(a,b){
        if(b%=2){
          b++;
          $('.g'+a+'>.x-xgroup-h a').attr('title','홍보팀그룹 닫기');
          $('.g'+a+'>.x-xgroup-h').attr('onclick','ck('+a+','+b+')');
          $('.g'+a+'>.x-xgroup-h a').text('▲');
          $('.g'+a+'>.x-xgroup-b').css('display','block');
        }else{
          b++;
          $('.g'+a+'>.x-xgroup-h a').attr('title','홍보팀그룹 열기');
          $('.g'+a+'>.x-xgroup-h a').text('▼');
          $('.g'+a+'>.x-xgroup-h').attr('onclick','ck('+a+','+b+')');
          $('.g'+a+'>.x-xgroup-b').css('display','none');
        }
      }
      c=0;
      function ons(c){
        if(c%=2){
          c++
          $('.x-xc-h').attr('onclick','ons('+c+')');
          $('.x-xchaeTing-wrap').addClass("chOns");
          $('.x-xchaeTing-wrap').removeClass("chOns2");
          $('article').css('max-width','822px');
          $.ajax({
  			url:'chatList.op',
  			method:'post',
  			dataType:'html',
  			success: function(response){
  				$(".x-xc-b").html(response);
  			}
  		
  		});
        }else{
          c++
          $('.x-xc-h').attr('onclick','ons('+c+')');
          $('.x-xchaeTing-wrap').addClass("chOns2");
          $('.x-xchaeTing-wrap').removeClass("chOns");
          $('article').css('max-width','');
        }
      }
    </script>
    <script>
    var co;
      function ckk(c,d,e){
        co=$("#"+c).prop("checked");
          if(co==true){
            $("#"+d).addClass("tckON");
            $("#"+e).removeClass("tckON");
          }else{
            $("#"+d).removeClass("tckON");
            $("#"+e).addClass("tckON");
          }
      }
    </script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script>
        function ck2(a){
          if(a==1){
            $(".con1").css("display","block");
            $(".con2").css("display","none");
          }else if(a==2){
            $(".con1").css("display","none");
            $(".con2").css("display","block");
          }else if(a==3){
          document.PJ.submit();
        }
      }
      function ckClose(){
        $(".x-xg-p-wrap").css("display","none");
      }
    </script>
    <style>
      .check-wrap{position:relative;}
      .checkboxa{opacity: 0.1; width: 100%; height: 27px; display:block; position:absolute;}
    </style>
  </head>
  <body>
  <!--로딩이미지-->
    <div id="loading" style="position: absolute;transform: translate(-50%, -50%);top: 50%;left: 50%;background: rgb(96, 129, 247);display: block;width: 500px;text-align: center;padding: 35px 0px;z-index: 500;">
      <svg version="1.1" x="0px" y="0px" viewBox="0 0 900 150" style="enable-background:new 0 0 900 150;width: 250px;display: block;margin: 0 auto;fill: #fff;" xml:space="preserve">
      <style type="text/css"> .st0{fill:#1E1E1E;} .st1{font-family:'NanumGothicBold'; font-weight:bold;} .st2{font-size:72px;} </style> <g> <path class="st0" d="M105.3,66.5h-7.7c-0.9-3.7-2.4-7.1-4.3-10.2l5.4-5.4c1.9-1.9,1.9-5.1,0-7l-5.4-5.4c-1.9-1.9-5.1-1.9-7,0 l-5.5,5.5c-3.1-1.9-6.5-3.3-10.2-4.2v-7.8c0-2.7-2.2-4.9-4.9-4.9h-7.6c-2.7,0-4.9,2.2-4.9,4.9v7.8c-3.6,0.9-7.1,2.3-10.2,4.2 l-5.5-5.5c-1.9-1.9-5.1-1.9-7,0l-5.4,5.4c-1.9,1.9-1.9,5.1,0,7l5.4,5.4c-1.9,3.1-3.4,6.6-4.3,10.2h-7.7c-2.7,0-4.9,2.2-4.9,4.9V79 c0,2.7,2.2,4.9,4.9,4.9h7.6c0.9,3.7,2.3,7.1,4.2,10.3l-5.4,5.4c-1.9,1.9-1.9,5.1,0,7l5.4,5.4c1.9,1.9,5.1,1.9,7,0l5.3-5.3 c3.2,1.9,6.6,3.4,10.3,4.3v7.5c0,2.7,2.2,4.9,4.9,4.9h7.6c2.7,0,4.9-2.2,4.9-4.9v-7.5c3.7-0.9,7.2-2.4,10.3-4.3l5.3,5.3 c1.9,1.9,5.1,1.9,7,0l5.4-5.4c1.9-1.9,1.9-5.1,0-7l-5.4-5.4c1.9-3.2,3.3-6.6,4.2-10.3h7.6c2.7,0,4.9-2.2,4.9-4.9v-7.6 C110.2,68.7,108,66.5,105.3,66.5z M62,90c-8.2,0-14.8-6.6-14.8-14.8S53.8,60.4,62,60.4c8.2,0,14.8,6.6,14.8,14.8S70.2,90,62,90z"style="fill: #fff; ">
      </path> </g>
      <text transform="matrix(1 0 0 1 128 101.549)" class="st1 st2">프로젝트 관리자 페이지</text>
    </svg>
    <img src="img/loding.gif">
    <div style=" font-size: 17px; color: #fff; padding: 21px 0 0 0; ">LODING...</div>
  </div>
    <div class="x-pwrap">
      <%@ include file="head.jsp" %>
      <section class="x-body">
        <h1>프로젝트 메뉴</h1>
        <!-- nav -->
        <nav>
          <header style="min-width:288px">
            <div class="h-info">
              <h2 class="x-xtitle"><c:forEach var="oppm" items="${oppm}" varStatus="status">${oppm.pj_title}</c:forEach></h2>
              <div class="x-xsub-title">
                <span class="x-gro-inf">그룹수 : ${peoLenGroup}개</span>
                <span class="x-num-inf">총 인원 : ${peoLen}명</span>
              </div>
            </div>
            <a href="#" class="x-xpluse" title="관리자 인원추가">
              <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 150 150" style="enable-background:new 0 0 150 150;" xml:space="preserve">
                <path d="M141.8,82.5H7.2c-3.9,0-7.2-3.2-7.2-7.2v-0.7c0-3.9,3.2-7.2,7.2-7.2h134.7c3.9,0,7.2,3.2,7.2,7.2v0.7
                	C149,79.3,145.8,82.5,141.8,82.5z" style="fill:#fff"/>
                <path d="M67,142.3V7.7c0-3.9,3.2-7.2,7.2-7.2h0.7c3.9,0,7.2,3.2,7.2,7.2v134.7c0,3.9-3.2,7.2-7.2,7.2h-0.7
              	C70.2,149.5,67,146.3,67,142.3z" style="fill:#fff"/>
              	
              </svg>
            </a>
          </header>
          <div class="x-xnbody">
            <!--그룹-->
            <c:forEach var="opgp" items="${opgp}" varStatus="status">
            <div class="x-xgroup g${opgp.pjG_no}">
              <div class="x-xgroup-h" onclick="ck('${opgp.pjG_no}','0')">
                <span>${opgp.pjG_title} ${opgp.pjG_no}</span><a href="#" title="홍보팀그룹 닫기">▲</a>
              </div>
              <div class="x-xgroup-b">
                <div class="x-xg-info">
                  <span>참여 팀원: <a href="#" title="팀원 12명"></a>${pjgno2[status.index].peSize} 명</span>
                  <span>
                    <a href="#" onclick="projectPeckIn('${opgp.pjG_no}','<c:out value="${param.pj_no }"></c:out>','${pjgno2[status.index].peSize}')">설정</a>
                    <a href="#">정보</a>
                  </span>
                </div>
                <div class="x-xnotice">
                  <span>공지사항</span>
                  <span><a href="#">공지 내용입니다.</a></span>
                </div>
                <div class="x-xFileM">
                  <span>파일 관리자</span>
                  <ul>
                    <li>
                      <span></span>
                      <a href="#" onclick="GroupProjectOpenS('GongYu','${param.pj_no}','${opgp.pjG_no}')">공유페이지</a>
                      <span class="check-wrap" onselectstart="return false" onclick="ckk('checkbox','ckA1${opgp.pjG_no}','ckA2${opgp.pjG_no}')">
                        <input id="checkbox" class="checkbox" type="checkbox" checked>
                        <label id="ckA1${opgp.pjG_no}" for="checkbox" class="tckON">사용</label>
                        <label id="ckA2${opgp.pjG_no}"class="unck" for="checkbox">미사용</label>
                      </span>
                    </li>
                    <li>
                      <span></span>
                      <a href="#">다운로드용 페이지</a>
                      <span class="check-wrap" onselectstart="return false" onclick="ckk('checkbox1','ckB1${opgp.pjG_no}','ckB2${opgp.pjG_no}')">
                        <input id="checkbox1" class="checkbox" type="checkbox" checked>
                        <label id="ckB1${opgp.pjG_no}" for="checkbox1" class="tckON">사용</label>
                        <label id="ckB2${opgp.pjG_no}"class="unck" for="checkbox1">미사용</label>
                      </span>
                    </li>
                    <li>
                      <span></span>
                      <a href="#">업로드용 페이지</a>
                      <span class="check-wrap" onselectstart="return false" onclick="ckk('checkbox2','ckC1${opgp.pjG_no}','ckC2${opgp.pjG_no}')">
                        <input id="checkbox2" class="checkbox" type="checkbox" checked>
                        <label id="ckC1${opgp.pjG_no}" for="checkbox2" class="tckON">사용</label>
                        <label id="ckC2${opgp.pjG_no}"class="unck" for="checkbox2">미사용</label>
                      </span>
                    </li>
                  </ul>
                </div>
                <div class="x-xFileM">
                  <span><a href="#a" onclick="GroupProjectOpen('${opgp.pjG_no}','${param.pj_no}')">프로젝트 관리자</a></span>
                  <ul>
                    <li><a href="#">┗디자인 기획안</a></li>
                    <li><a href="#">┗1디자인 팀</a></li>
                  </ul>
                </div>
              </div>
            </div>
            </c:forEach>
            <!--//그룹-->
          </div>
        </nav>
        <h1>구분</h1>
        <article id="GpContent" style="width:100%;">
          <h2>내용</h2>
          <!--그룹별 프로젝트 내용-->
          <div class="x-g-pcon" style="width:100%; height:86px;">
            <div class="x-g-pcon-t">
              <span>${pvs.pjgp_title}</span>
              <span>${pvs.startDate} ~ ${pvs.endDate}</span>
            </div>
            <div class="x-g-pcon-st">
              <span class="x-g-st">${pvs.pjgp_content}</span>
              <span class="x-g_p_info"><span class="xicon-x"></span><span>진행중</span></span>
            </div>
          </div>
          
          <!--//그룹별 프로젝트 내용-->
          <div class="x-g-pcon">
            <div class="x-g-pcon-t" style="padding:10px 0 8px 0; text-align:center; border-bottom:1px solid #60657d">
              <span>디자인팀</span>
            </div>
            <div class="x-g-pcon-st">
              <span class="x-g-st"></span>
              <span class="x-g_p_info"><span class="xicon-x"></span><span>진행중</span></span>
            </div>
            <div class="x-g_pp" style="padding:0;">
            <p style="margin-bottom:32px;"></p>
            
              <div class="pgp_wrap">
              	<div class="pgp_title">디자인 수정본</div>
              	<div class="pgp_con">
              		작성자 : test
              	</div>
              </div>
            </div>
          </div>
          <div class="x-g-pcon">
            <div class="x-g-pcon-t" style="padding:10px 0 8px 0; text-align:center; border-bottom:1px solid #60657d">
              <span>개발팀</span>
            </div>
            <div class="x-g-pcon-st">
              <span class="x-g-st"></span>
              <span class="x-g_p_info"><span class="xicon-x"></span><span>진행중</span></span>
            </div>
            <div class="x-g_pp">
              <div>
              	<div class="pgp_title">디자인 수정본</div>
              	<div class="pgp_con"></div>
              </div>
            </div>
          </div>
          <!--//그룹별 프로젝트 내용-->
          <div class="x-g-pcon">
            <div class="x-g-pcon-t" style="padding:10px 0 8px 0; text-align:center; border-bottom:1px solid #60657d">
              <span>완료</span>
            </div>
            <div class="x-g-pcon-st">
              <span class="x-g-st"></span>
              <span class="x-g_p_info"><span class="xicon-x"></span><span>진행중</span></span>
            </div>
            <div class="x-g_pp">
              
            </div>
          </div>
          
          
        </article>
      </section>
      <aside id="x-xchaeTing-wrap" class="x-xchaeTing-wrap chOns2" oncontextmenu="return false">
        <div class="x-xc-h" onclick="ons(1)">
          <span>친구목록</span>
          <a href="#" class="search-fri" onclick="ons(2);friendx()">찾기</a>
          <script>
          	function friendx(){
          		$('.xsearch-friendx-con').css('display','block');
          		$('.x-xc-b').css('display','none');
          		$('.search-fri').removeAttr("onclick");
          		$('.search-fri').attr('onclick','ons(2);friendx2()');
          		$('.search-fri').text('취소');
          	}
          	function friendx2(){
          		$('.xsearch-friendx-con').css('display','none');
          		$('.x-xc-b').css('display','block');
          		$('.search-fri').removeAttr("onclick");
          		$('.search-fri').attr('onclick','ons(2);friendx()');
          		$('.search-fri').text('찾기');
          	}
          </script>
        </div>
        <div class="x-xc-b" style="display: block;">
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
          	<div class="x-divbg" id="${chattList.cha_code}" x-dataid="${chattList.cha_me}"></div>
            <div class="x-user-info">
              <img src="" alt="">
              <span class="xicon-x"></span>
            </div>
            <div class="x-user-name">${chattList.cha_me}</div>
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
		
        </div>
        <!-- 친구 찾기 -->
        <div class="xsearch-friendx-con" style="display: none;">
       		<div class="xsearch-con">
       			<input type="search" name="search" class="searchFriend" placeholder="ID검색" onkeyup="searchFriend('test')" autocomplete="off">
       			<button onclick="searchFriend('test')" class="searchFButton">
					<svg version="1.1" id="searchFriend" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 45 45" style="enable-background:new 0 0 45 45;" xml:space="preserve">
					<g>
						<circle style="fill:none;stroke:#000000;stroke-miterlimit:10;" cx="21.3" cy="15.3" r="14.3"></circle>
						<line style="fill:none;stroke:#000000;stroke-linecap:round;stroke-miterlimit:10;" x1="28.5" y1="27.5" x2="39.5" y2="43.5"></line>
					</g>
					</svg>
				</button>
				<input type="hidden" value="test" class="searchFriendMe">
       		</div>
       		<div class="x-xsearch-content">
       			<div style=" text-align: center; margin-top: 50px; color: #fff; border: 1px solid #454a5d; width:60%; margin:50px auto; padding:11px 10px; background:#454a5d; border-radius: 5px;">ID를 입력해주세요.</div>
       		</div>
        </div>
        <div class="x-Messagex-con" style="width:150px; height:250px;">

		</div>
  </aside>
  <div class="mousck" oncontextmenu="return false">
    <ul>
      <li>
        <a href="#" class="mousckid xuserFriendOpen" onclick="xuserFriendOpens()" id="null">
          <span style="width:14px; margin:3px 11px 0 10px;">
            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 500 500" style="enable-background:new 0 0 500 500;" xml:space="preserve">
            <path d="M487.8,194.8c0.1-0.9,0.1-1.7,0-2.6l-1.4-33.6l0-1.3l0,0l-1.7-40.9c-0.6-13-12.2-23.5-26-23.5H345.7
              c-17.7,0-32.9,9.9-38.8,25.2l-3.9,10.2h-68.7l-13-40.7c-7.1-22.1-25.5-37-45.8-37H40.4C24.7,50.5,12,65,12,82.8v96.3v24.8v245.5
              h20.3H457h11.2c7.7,0,14.3-4.4,17.6-10.8c1.4-2.2,2.2-4.7,2.2-7.4v-234C488,196.4,487.9,195.6,487.8,194.8z M32,82.8
              c0-6.5,3.9-12.3,8.4-12.3h135.2c11.6,0,22.3,9.3,26.7,23.1l17.4,54.6h75.6l-11.8,30.9H32V82.8z M32.4,429.5V207.7l-0.2-0.9
              c-0.2-1-0.3-2-0.3-2.9v-4.8h266.4l1.9-7.6c0-0.1,0.1-0.3,0.1-0.3l25.2-65.9c2.8-7.4,10.9-12.4,20.1-12.4h112.9c3.4,0,5.9,2.3,6,4.4
              l1.8,41.8l1.6,268.8c-2.1,0.8-5.9,1.6-11,1.6H32.4z" style="fill:#fff;"></path>
            </svg>
          </span>
          <span class="open" id="null">열기</span>
        </a>
      </li>
      <li>
        <a href="#">
          <span style="width:14px; margin:3px 11px 0 10px;">
            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 500 500" style="enable-background:new 0 0 500 500;" xml:space="preserve">
            <g>
              <path d="M250.5,7L250.5,7C116.8,7,7.5,116.3,7.5,250v0c0,133.6,109.3,243,243,243h0c133.6,0,243-109.4,243-243v0
                C493.5,116.3,384.2,7,250.5,7z M469.6,250c0,120.5-98.6,219.1-219.1,219.1h0C130,469.1,31.4,370.5,31.4,250v0
                c0-120.5,98.6-219.1,219.1-219.1h0C371,30.9,469.6,129.5,469.6,250L469.6,250z"  style="fill:#fff;"></path>
              <path d="M251.2,402.4h-1.5c-6,0-10.9-4.9-10.9-10.9V210.3c0-6,4.9-10.9,10.9-10.9h1.5c6,0,10.9,4.9,10.9,10.9v181.3
                C262.1,397.5,257.2,402.4,251.2,402.4z"  style="fill:#fff;"></path>
              <circle cx="250.5" cy="153.3" r="22.2"  style="fill:#fff;"></circle>
            </g>
            </svg>
          </span>
          <span>상세정보</span>
        </a>
      </li>
      <li>
        <a href="#">
          <span style="width:14px; margin:3px 11px 0 10px;">
            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 500 500" style="enable-background:new 0 0 500 500;" xml:space="preserve">
            <g>
              <path d="M358.3,487.9h-95.1c-13.9,0-25.3-11.3-25.3-25.3v-57.4l-107-24.1c-16.7-3.8-27.9-15.1-27.9-28.2v-81.5H25.3
                C13,271.5,3,261.5,3,249.2c0-12.3,10-22.3,22.3-22.3h77.6v-81.6c0-13,11.2-24.3,27.8-28.1l107.2-24.5V35.8
                c0-13.9,11.3-25.3,25.3-25.3h95.1c13.9,0,25.3,11.3,25.3,25.3v78.9h90.2c12.3,0,22.3,10,22.3,22.3v11.5c0,12.3-10,22.3-22.3,22.3
                h-90.2v156.8h90.2c12.3,0,22.3,10,22.3,22.3v11.5c0,12.3-10,22.3-22.3,22.3h-90.2v78.9C383.6,476.5,372.2,487.9,358.3,487.9z
                 M25.3,246.4c-1.5,0-2.8,1.3-2.8,2.8s1.3,2.8,2.8,2.8h97.1v101c0,3.1,4.8,7.4,12.7,9.2l122.2,27.5v73c0,3.2,2.7,5.8,5.8,5.8h95.1
                c3.2,0,5.8-2.7,5.8-5.8v-98.4h109.6c1.5,0,2.8-1.3,2.8-2.8v-11.5c0-1.5-1.3-2.8-2.8-2.8H364.1V151.3h109.6c1.5,0,2.8-1.3,2.8-2.8
                V137c0-1.5-1.3-2.8-2.8-2.8H364.1V35.8c0-3.2-2.7-5.8-5.8-5.8h-95.1c-3.2,0-5.8,2.7-5.8,5.8v72.4L135,136.1
                c-7.9,1.8-12.6,6.1-12.6,9.2v101.1H25.3z" style="fill:#fff;"></path>
            </g>
            </svg>
          </span>
          <span>차단</span>
        </a>
      </li>
    </ul>
  </div>
    </div>
    <!--그룹별 프로젝트 생성-->
    <!-- 참여인원 추가 -->
		<div class="x-xcreate-wrap">
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
				      <ul id="sortable2" class="x-xpeople-con connectedSortable ui-sortable"></ul>
				      <ul id="sortable1" class="x-xupeople-con connectedSortable ui-sortable"></ul>
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
            	function GroupProjectOpenS(typeA,pj_no,pjgp_no){
            		$.ajax({
	        			url:"SharingList.op",
	        			method:'post',
	        			dataType:'html',
	        			data:{typeA: typeA,pj_no:pj_no,pjgp_no:pjgp_no},
	        			success:function(response){
	        				$("#GpContent").html(response);
	        			},
	        			error:function(response){
	        				$("#GpContent").html(response);
	        			}
	        		});
            	}
            </script>
         </div>
	<!-- //참여인원추가 --> 
    
    <!--채팅 마우스 우클릭-->
    <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script src="js/friend-ck-info.js"></script>
    <script src="js/search-friend.js"></script>
    
    <script>
    	//친구 추가 승인 거절
    	function ackno(userId,friendVar,comp){
    		$.ajax({
    			url:'friendAcknoAdd.op',
    			method:'post',
    			dataType:'html',
    			data:{state:friendVar,userId:userId,comp:comp},
    			success: function(response){
    				$(".message").html(response);
    			}
    		});
    		$.ajax({
    			url:'chatList.op',
    			method:'post',
    			dataType:'html',
    			success: function(response){
    				$(".x-xc-b").html(response);
    			}
    		
    		});
    	}
    
    </script>
  </body>
</html>
