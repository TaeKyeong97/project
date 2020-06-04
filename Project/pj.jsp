<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="robots" content="noindex">
    <!-- <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"> -->
    <title>프로젝트 관리자 페이지</title>
    <link rel="stylesheet" type="text/css" href="css/user-p-main.css">
    <!--드래그하기전 사용 했던것 <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>-->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
    <style>
      	
		/*채팅*/
		.x-xchaeTing-wrap{width:360px;bottom: 0;height:50px;border:1px solid rgba(0, 0, 0, 0.0899); background:#595e73; overflow:hidden; border-radius:11px 11px 0 0;display:block;float:left;position: absolute;right: 55px; }
		.x-xchaeTing-wrap .x-xc-h{padding:21px; font-size:13px;}
		.x-xchaeTing-wrap .x-xc-h:hover{background-color:rgba(241, 242, 245, 0.08);}
		.x-xchaeTing-wrap .x-xc-h a{float:right;}
		.x-user-info{width:46px; height:46px; margin-right:15px; margin-left:14px; float:left; border-radius:50%; background:#eff1f2; overflow:hidden;}
		.x-user-info .xicon-x{width:5px; height:5px; margin:-20px 0 0 43px; position:absolute; float:left; background-color:#4fe92b; border-radius:15px; display:block;}
		.x-xuser-con{margin:19px 0; overflow:hidden;}
		.x-xuser-con .x-user-name{font-size:14px; font-weight:bold;}
		.x-xuser-con .x-user-inf{margin-top:9px; font-size:14px;}
		.x-xuser-con1{padding:5px 0 20px 0; position:relative; overflow:hidden;}
		.x-xuser-con1 .x-divbg{width:100%; height:66px; display:block; position:absolute;}
		.x-xuser-con1 .x-user-name{font-size:14px; font-weight:bold;}
		.x-xuser-con1 .x-user-inf{font-size:12px; margin-top:2px;}
		
		.chOns{width:360px; height:91%; border:1px solid rgba(0, 0, 0, 0.0899); background:#595e73; border-radius:11px 11px 0 0; display:block; float:right; transition:height 400ms cubic-bezier(0.4, 0, 0.2, 1); position:absolute; animation-name: example; }
		.chOns2{width:360px; height:50px; border:1px solid rgba(0, 0, 0, 0.0899); background:#595e73; border-radius:11px 11px 0 0; display:block; float:left; position:fixed; transition:height 400ms cubic-bezier(0.4, 0, 0.2, 1); animation-name: example; }
		
		@@keyframes example {
		  0%{height: 50px;}
		  100%{height:91%;}
		}
		@@keyframes example2 {
		  0%{height: 91%;}
		  100%{height:50px;}
		}
		
		/*채팅 검색*/
		.xsearch-friendx-con{display:none;}
		.xsearch-con{position:relative;}
		.searchFriend{width:90%; margin:0 auto; padding:17px 53px 17px 23px; color:#fff; background:#4e5267; border:0; display:block; border-radius:9px;}
		.searchFriend::-webkit-input-placeholder{color:#fff;}
		.searchFButton{width:36px; top:12px; right:37px; background:none; position:absolute; border:0;}
	
		/*채팅 마우스 클릭*/
		.mousck{width:113px; height:108px; top:0; left:0; font-size:14px; display:none; background:#4e5267; border-radius:10px; border:1px solid #4e5267; box-shadow:0 0 15px 9px rgba(6, 6, 10, 0.02); position:absolute;}
		.mousck ul li:nth-child(1) a{margin-top:8px;}
		.mousck ul li a{padding:5px 0; overflow:hidden; display:block;}
		.mousck ul li a:hover{background:#595e73;}
		.mousck ul li a span{float:left;}
		
		@keyframes x-xchat-xpopupCk{
		  0%{opacity:0;}
		  25%{opacity:1;}
		  75%{opacity:1;}
		  100%{opacity:0;}
		}
      </style>
      <!-- 채팅 -->
      <script>
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
      $(document).ready(function(){
          $('#loading-GPS').hide(); //첫 시작시 로딩바를 숨겨준다.
          $('#GPS-ICON').css('display','block');
          $('#loading-GPS').addClass('loading-GPSAni');
      })
      .ajaxStart(function(){
          $('#loading-GPS').show(); //ajax실행시 로딩바를 보여준다.
          $('#GPS-ICON').css('display','none');
          //$('#loading-GPS').css('display','block');

      })
      .ajaxStop(function(){
          $('#loading-GPS').hide(); //ajax종료시 로딩바를 숨겨준다.
          $('#GPS-ICON').css('display','block');
      });


    </script>
    <script>
    /*
      // 나의 위치정보를 출력할 객체 구하기
      var elt = document.getElementById("myLocationInfo");

      // 나의 위치정보 출력하기
      whereami(elt);

        if($('#myLocationInfo').html()!="Geolocation 오류 1: User denied Geolocation"){
          alert('참');
        }
        */
        var cc=null;
        navigator.geolocation.getCurrentPosition(function(pos) {
            var latitude = pos.coords.latitude;
            var longitude = pos.coords.longitude;
            //alert("현재 위치는 : " + latitude + ", "+ longitude);
            cc= latitude+","+longitude;
            fnLatLon2XY(cc);
        });

        function GPSCK(){

	       	if(cc!=null){
	       		$('#loading-GPS').show();
	       		$('#GPS-ICON').css('display','none');

	       		fnLatLon2XY(cc);
	       	}else{
	       		$('#loading-GPS').show();
	       		$('#GPS-ICON').css('display','none');
	          navigator.geolocation.getCurrentPosition(function(pos) {
	              var latitude = pos.coords.latitude;
	              var longitude = pos.coords.longitude;
	              //alert("현재 위치는 : " + latitude + ", "+ longitude);
	              cc= latitude+","+longitude;
	              fnLatLon2XY(cc);
	          });
	       	}
        }


      function fnLatLon2XY(cc) {
   	  $('#loading-GPS').show();
   	$('#GPS-ICON').css('display','none');
        var strLatLon = $.trim(cc);
        if(!strLatLon) { alert("위경도 데이터를 입력하여 주십시오."); return;}
        var lines = strLatLon.split(String.fromCharCode(10)); //줄단위로 분할
        var strXY = "";
        for(var i = 0, len = lines.length; i < len; i++) {
          if(lines[i] == "") continue; //빈줄은 무시하고 통과
          var latlon = lines[i].split(",");
          var lat = latlon[0], lon = latlon[1];
          if(!lat||!lon||isNaN(lat)||isNaN(lon)) {
            alert("숫자 값이 아니거나 데이터 형식이 맞지 않습니다.");
            return;
          }
          var xy = dfs_xy_conv("toXY", lat, lon);
          strXY += xy.x + ", " + xy.y + String.fromCharCode(10);
        }

        $('#taXY').val(strXY);
        //var url="wearther.ops?latitude="+latitude+"&longitude="+longitude;
        //$('.weatherCon').attr("src","wearther.jsp?latitude="+xy.x+"&longitude="+xy.y);


            $.ajax({
        		url : 'wearther.ops',
        		method : 'POST',
        		dataType : 'html',
        		data : {latitude : xy.x, longitude : xy.y},
        		success : function(response) {
                    $(".xwrcon").html(response);
                    $('#loading-GPS').hide();
                    $('#GPS-ICON').css('display','block');
        		}
        	})



      }

      //----------------------------------------------------------
      // 기상청 홈페이지에서 발췌한 변환 함수
      //
      // LCC DFS 좌표변환을 위한 기초 자료
      //
      var RE = 6371.00877; // 지구 반경(km)
      var GRID = 5.0; // 격자 간격(km)
      var SLAT1 = 30.0; // 투영 위도1(degree)
      var SLAT2 = 60.0; // 투영 위도2(degree)
      var OLON = 126.0; // 기준점 경도(degree)
      var OLAT = 38.0; // 기준점 위도(degree)
      var XO = 43; // 기준점 X좌표(GRID)
      var YO = 136; // 기1준점 Y좌표(GRID)
      //
      // LCC DFS 좌표변환 ( code : "toXY"(위경도->좌표, v1:위도, v2:경도), "toLL"(좌표->위경도,v1:x, v2:y) )
      //

      function dfs_xy_conv(code, v1, v2) {
        var DEGRAD = Math.PI / 180.0;
        var RADDEG = 180.0 / Math.PI;

        var re = RE / GRID;
        var slat1 = SLAT1 * DEGRAD;
        var slat2 = SLAT2 * DEGRAD;
        var olon = OLON * DEGRAD;
        var olat = OLAT * DEGRAD;

        var sn = Math.tan(Math.PI * 0.25 + slat2 * 0.5) / Math.tan(Math.PI * 0.25 + slat1 * 0.5);
        sn = Math.log(Math.cos(slat1) / Math.cos(slat2)) / Math.log(sn);
        var sf = Math.tan(Math.PI * 0.25 + slat1 * 0.5);
        sf = Math.pow(sf, sn) * Math.cos(slat1) / sn;
        var ro = Math.tan(Math.PI * 0.25 + olat * 0.5);
        ro = re * sf / Math.pow(ro, sn);
        var rs = {};
        if (code == "toXY") {
          rs['lat'] = v1;
          rs['lng'] = v2;
          var ra = Math.tan(Math.PI * 0.25 + (v1) * DEGRAD * 0.5);
          ra = re * sf / Math.pow(ra, sn);
          var theta = v2 * DEGRAD - olon;
          if (theta > Math.PI) theta -= 2.0 * Math.PI;
          if (theta < -Math.PI) theta += 2.0 * Math.PI;
          theta *= sn;
          rs['x'] = Math.floor(ra * Math.sin(theta) + XO + 0.5);
          rs['y'] = Math.floor(ro - ra * Math.cos(theta) + YO + 0.5);
        }
        else {
          rs['x'] = v1;
          rs['y'] = v2;
          var xn = v1 - XO;
          var yn = ro - v2 + YO;
          ra = Math.sqrt(xn * xn + yn * yn);
          if (sn < 0.0) - ra;
          var alat = Math.pow((re * sf / ra), (1.0 / sn));
          alat = 2.0 * Math.atan(alat) - Math.PI * 0.5;

          if (Math.abs(xn) <= 0.0) {
            theta = 0.0;
          }
          else {
            if (Math.abs(yn) <= 0.0) {
              theta = Math.PI * 0.5;
              if (xn < 0.0) - theta;
            }
            else theta = Math.atan2(xn, yn);
          }
          var alon = theta / sn + olon;
          rs['lat'] = alat * RADDEG;
          rs['lng'] = alon * RADDEG;
        }
        return rs;
      }

    </script>
    
    <link rel="stylesheet" href="css/admin-p-main.css">
  </head>
  <body>
    <!--skip-->
    <div class="skip">
      <a href="#content">본문 바로가기</a>
    </div>
    <script>
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
    <%@include file="head.jsp" %>
    <%@include file="nav.jsp" %>
    
    <c:if test="${EM_id==null}">
    	<div class="project-crea-con">
    		<div>로그인후 이용가능한 서비스입니다.</div>
    		<a href="login/login.ops?loginCk=1">로그인 하기</a>
    	</div>
    </c:if>
    <c:if test="${EM_id!=null}">
	    <c:if test="${pjb==null}">
	    	<div class="project-crea-con">
	    		<div>프로젝트를 지정하여 주세요.</div>
	    		<a href="pjCurrent.ops?menu=parti">프로젝트 지정</a>
	    	</div>
	    </c:if>
    </c:if>
    <c:if test="${pjb!=null}">
    <main id="content">
      <section class="pj-con pj-row1">
        <h1>프로젝트 진행률</h1>
        <article class="ans">
          <h2><a href="#"><c:forEach var="pjb" items="${pjb}" varStatus="status">${pjb.pj_title}</c:forEach></a></h2>
          <div class="PieChart">
            <span><a href="#">총 진행률 80%</a></span>
            <svg class="circle-chart" viewBox="0 0 33.83098862 33.83098862" width="200" height="200">
              <circle class="circle-chart__circle circle-chart__circle--negative" stroke="#50ef8f" stroke-width="2" stroke-dasharray="100,100" stroke-linecap="round" fill="none" cx="16.91549431" cy="16.91549431" r="15.91549431" style=" stroke: #777b90; z-index: 10; position: absolute; "></circle>
              <circle class="circle-chart__circle circle-chart__circle--negative" stroke="#50ef8f" stroke-width="2" stroke-dasharray="80,100" stroke-linecap="round" fill="none" cx="16.91549431" cy="16.91549431" r="15.91549431"></circle>
            </svg>
          </div>
        </article>
        <h1>내업무 영역</h1>
        <article class="MyWork">
          <div class="MyWorkHead">
            <h3><a href="#">내 업무</a></h3> 
            <a href="#" class="setting-icon">
              <em>내업무 설정하기</em>
              <svg version="1.1" x="0px" y="0px" viewBox="0 0 100 100" style="enable-background:new 0 0 100 100;" xml:space="preserve"> <path style="fill:#FFFFFF;" d="M94,41.3h-7.7c-0.9-3.7-2.4-7.1-4.3-10.3l5.5-5.5c1.9-1.9,1.9-5.1,0-7.1L82.1,13 c-1.9-1.9-5.1-1.9-7.1,0l-5.5,5.5c-3.1-1.9-6.6-3.3-10.3-4.2V6.5c0-2.7-2.2-5-5-5h-7.7c-2.7,0-5,2.2-5,5v7.8 c-3.7,0.9-7.1,2.3-10.3,4.2L25.8,13c-1.9-1.9-5.1-1.9-7.1,0l-5.4,5.4c-1.9,1.9-1.9,5.1,0,7.1l5.5,5.5c-1.9,3.2-3.4,6.6-4.3,10.3H6.7 c-2.7,0-5,2.2-5,5V54c0,2.7,2.2,5,5,5h7.7c0.9,3.7,2.3,7.2,4.3,10.4l-5.4,5.4c-1.9,1.9-1.9,5.1,0,7.1l5.4,5.4c1.9,1.9,5.1,1.9,7.1,0 l5.4-5.4c3.2,1.9,6.7,3.4,10.4,4.3v7.6c0,2.7,2.2,5,5,5h7.7c2.7,0,5-2.2,5-5v-7.6c3.7-0.9,7.2-2.4,10.4-4.3l5.4,5.4 c1.9,1.9,5.1,1.9,7.1,0l5.4-5.4c1.9-1.9,1.9-5.1,0-7.1l-5.4-5.4c1.9-3.2,3.4-6.7,4.3-10.4H94c2.7,0,5-2.2,5-5v-7.7 C99,43.6,96.8,41.3,94,41.3z M50.4,65.1c-8.3,0-14.9-6.7-14.9-14.9c0-8.3,6.7-14.9,14.9-14.9c8.3,0,14.9,6.7,14.9,14.9 C65.3,58.4,58.6,65.1,50.4,65.1z"/> </svg>
            </a>
          </div>
          <div id="drag1" class="MyWorkbody connectedSortable">
          <c:forEach var="workMyList" items="${workMyList}" varStatus="status">
	            <a id="${workMyList.ws_no}" href="#" class="Work_row GreenLine" style="padding:10px 13px" ondblclick="UPMCkNot(1,3); notDocumentPopup('${workMyList.ws_no}')">
	              <div class="Bookmark">
	                <svg version="1.1" x="0px" y="0px" viewBox="0 0 100 100" style="enable-background:new 0 0 100 100;" xml:space="preserve"> <g> <path style="fill:#FFFFFF;" d="M76.8583984,96.0566406c-0.9765625,0-1.9580078-0.2353516-2.8652344-0.7109375 L50.4086914,82.9453125c-0.0424805-0.0214844-0.0942383-0.0234375-0.1376953,0.0009766L26.6875,95.3447266 c-2.0859375,1.0966797-4.5668945,0.9169922-6.4731445-0.46875c-1.90625-1.3847656-2.8432617-3.6884766-2.4448242-6.0107422 l4.5039063-26.2617188c0.0083008-0.0478516-0.0073242-0.0957031-0.0415039-0.1289063L3.1513672,43.8754883 c-1.6875-1.6450195-2.2836914-4.059082-1.5551758-6.3007813c0.7280273-2.2412109,2.6293945-3.8442383,4.9614258-4.1831055 l26.3681641-3.831543c0.0478516-0.0068359,0.0893555-0.0371094,0.1108398-0.0805664L44.828125,5.5864258 c1.043457-2.1132813,3.1552734-3.4262695,5.512207-3.4262695s4.4692383,1.3129883,5.512207,3.4257813v0.0004883 l11.7919922,23.8935547c0.0214844,0.043457,0.0625,0.0732422,0.1103516,0.0800781l26.3671875,3.831543 c2.3320313,0.3388672,4.2333984,1.9414063,4.9619141,4.1826172C99.8125,39.815918,99.2158203,42.2299805,97.5283203,43.875 L78.4482422,62.4746094c-0.0341797,0.0332031-0.0498047,0.0820313-0.0419922,0.1289063l4.5048828,26.2617188 c0.3974609,2.3222656-0.5390625,4.6259766-2.4453125,6.0107422C79.3886719,95.6591797,78.1279297,96.0566406,76.8583984,96.0566406 z M50.340332,76.9287109c0.9819336,0,1.9633789,0.2353516,2.8588867,0.7050781l23.5859375,12.4003906 c0.0449219,0.0234375,0.0791016,0.0429688,0.1533203-0.0117188c0.0742188-0.0537109,0.0673828-0.0917969,0.0585938-0.1435547 l-4.5048828-26.2617188c-0.3417969-1.9941406,0.3193359-4.0263672,1.7675781-5.4394531l19.0810547-18.5991211 c0.0371094-0.0366211,0.0644531-0.0634766,0.0371094-0.1499023c-0.0283203-0.0864258-0.0664063-0.0917969-0.1191406-0.0996094 l-26.3671875-3.831543c-2.0029297-0.2910156-3.7333984-1.5478516-4.6279297-3.3632813L50.4716797,8.2416992 c-0.0458984-0.0947266-0.2163086-0.0952148-0.2631836,0.0004883L38.4169922,32.1352539 c-0.8959961,1.8144531-2.6259766,3.0712891-4.628418,3.3623047l-26.3676758,3.831543 c-0.0527344,0.0078125-0.090332,0.0131836-0.1186523,0.0996094c-0.027832,0.0864258-0.0004883,0.1132813,0.0371094,0.1499023 l19.0805664,18.5991211c1.4487305,1.4121094,2.1098633,3.4462891,1.7670898,5.4404297l-4.503418,26.2607422 c-0.0092773,0.0527344-0.015625,0.0898438,0.0581055,0.1435547c0.0732422,0.0527344,0.1069336,0.0361328,0.1542969,0.0117188 l23.5839844-12.3994141C48.3754883,77.1640625,49.3583984,76.9287109,50.340332,76.9287109z"/> </g> </svg>
	              </div>
	              <div class="title" style="width:238px; margin-top:0; font-size:14px;">
	                	${workMyList.wo_title }
	              </div>
	              <div class="Work_state">
	               	 안 읽음
	              </div>
	            </a>
            </c:forEach>
          </div>
        </article>
        <h1>신규업무 영역</h1>
        <article class="MyWork NewWork">
          <span style="height:30px; margin-top:10px; margin-right:2px; float:left;  border-left:1px dashed rgba(255, 255, 255, 0.45); display:block;"></span>
          <div class="MyWorkHead">
            <h3><a href="#">신규 업무</a></h3>
            <a href="#" class="setting-icon">
              <em>신규 업무 설정하기</em>
              <svg version="1.1" x="0px" y="0px" viewBox="0 0 100 100" style="enable-background:new 0 0 100 100;" xml:space="preserve"> <path style="fill:#FFFFFF;" d="M94,41.3h-7.7c-0.9-3.7-2.4-7.1-4.3-10.3l5.5-5.5c1.9-1.9,1.9-5.1,0-7.1L82.1,13 c-1.9-1.9-5.1-1.9-7.1,0l-5.5,5.5c-3.1-1.9-6.6-3.3-10.3-4.2V6.5c0-2.7-2.2-5-5-5h-7.7c-2.7,0-5,2.2-5,5v7.8 c-3.7,0.9-7.1,2.3-10.3,4.2L25.8,13c-1.9-1.9-5.1-1.9-7.1,0l-5.4,5.4c-1.9,1.9-1.9,5.1,0,7.1l5.5,5.5c-1.9,3.2-3.4,6.6-4.3,10.3H6.7 c-2.7,0-5,2.2-5,5V54c0,2.7,2.2,5,5,5h7.7c0.9,3.7,2.3,7.2,4.3,10.4l-5.4,5.4c-1.9,1.9-1.9,5.1,0,7.1l5.4,5.4c1.9,1.9,5.1,1.9,7.1,0 l5.4-5.4c3.2,1.9,6.7,3.4,10.4,4.3v7.6c0,2.7,2.2,5,5,5h7.7c2.7,0,5-2.2,5-5v-7.6c3.7-0.9,7.2-2.4,10.4-4.3l5.4,5.4 c1.9,1.9,5.1,1.9,7.1,0l5.4-5.4c1.9-1.9,1.9-5.1,0-7.1l-5.4-5.4c1.9-3.2,3.4-6.7,4.3-10.4H94c2.7,0,5-2.2,5-5v-7.7 C99,43.6,96.8,41.3,94,41.3z M50.4,65.1c-8.3,0-14.9-6.7-14.9-14.9c0-8.3,6.7-14.9,14.9-14.9c8.3,0,14.9,6.7,14.9,14.9 C65.3,58.4,58.6,65.1,50.4,65.1z"/> </svg>
            </a>
          </div>
          
          <div id="drag2" class="MyWorkbody connectedSortable" style="margin-left:2px;">
            <c:forEach var="workList" items="${workList}" varStatus="status">
	            <a id="${workList.ws_no}" href="#" class="Work_row GreenLine" style="padding:10px 13px"  ondblclick="UPMCkNot(1,3); notDocumentPopup('${workList.ws_no}')">
	              <div class="Bookmark">
	                <svg version="1.1" x="0px" y="0px" viewBox="0 0 100 100" style="enable-background:new 0 0 100 100;" xml:space="preserve"> <g> <path style="fill:#FFFFFF;" d="M76.8583984,96.0566406c-0.9765625,0-1.9580078-0.2353516-2.8652344-0.7109375 L50.4086914,82.9453125c-0.0424805-0.0214844-0.0942383-0.0234375-0.1376953,0.0009766L26.6875,95.3447266 c-2.0859375,1.0966797-4.5668945,0.9169922-6.4731445-0.46875c-1.90625-1.3847656-2.8432617-3.6884766-2.4448242-6.0107422 l4.5039063-26.2617188c0.0083008-0.0478516-0.0073242-0.0957031-0.0415039-0.1289063L3.1513672,43.8754883 c-1.6875-1.6450195-2.2836914-4.059082-1.5551758-6.3007813c0.7280273-2.2412109,2.6293945-3.8442383,4.9614258-4.1831055 l26.3681641-3.831543c0.0478516-0.0068359,0.0893555-0.0371094,0.1108398-0.0805664L44.828125,5.5864258 c1.043457-2.1132813,3.1552734-3.4262695,5.512207-3.4262695s4.4692383,1.3129883,5.512207,3.4257813v0.0004883 l11.7919922,23.8935547c0.0214844,0.043457,0.0625,0.0732422,0.1103516,0.0800781l26.3671875,3.831543 c2.3320313,0.3388672,4.2333984,1.9414063,4.9619141,4.1826172C99.8125,39.815918,99.2158203,42.2299805,97.5283203,43.875 L78.4482422,62.4746094c-0.0341797,0.0332031-0.0498047,0.0820313-0.0419922,0.1289063l4.5048828,26.2617188 c0.3974609,2.3222656-0.5390625,4.6259766-2.4453125,6.0107422C79.3886719,95.6591797,78.1279297,96.0566406,76.8583984,96.0566406 z M50.340332,76.9287109c0.9819336,0,1.9633789,0.2353516,2.8588867,0.7050781l23.5859375,12.4003906 c0.0449219,0.0234375,0.0791016,0.0429688,0.1533203-0.0117188c0.0742188-0.0537109,0.0673828-0.0917969,0.0585938-0.1435547 l-4.5048828-26.2617188c-0.3417969-1.9941406,0.3193359-4.0263672,1.7675781-5.4394531l19.0810547-18.5991211 c0.0371094-0.0366211,0.0644531-0.0634766,0.0371094-0.1499023c-0.0283203-0.0864258-0.0664063-0.0917969-0.1191406-0.0996094 l-26.3671875-3.831543c-2.0029297-0.2910156-3.7333984-1.5478516-4.6279297-3.3632813L50.4716797,8.2416992 c-0.0458984-0.0947266-0.2163086-0.0952148-0.2631836,0.0004883L38.4169922,32.1352539 c-0.8959961,1.8144531-2.6259766,3.0712891-4.628418,3.3623047l-26.3676758,3.831543 c-0.0527344,0.0078125-0.090332,0.0131836-0.1186523,0.0996094c-0.027832,0.0864258-0.0004883,0.1132813,0.0371094,0.1499023 l19.0805664,18.5991211c1.4487305,1.4121094,2.1098633,3.4462891,1.7670898,5.4404297l-4.503418,26.2607422 c-0.0092773,0.0527344-0.015625,0.0898438,0.0581055,0.1435547c0.0732422,0.0527344,0.1069336,0.0361328,0.1542969,0.0117188 l23.5839844-12.3994141C48.3754883,77.1640625,49.3583984,76.9287109,50.340332,76.9287109z"/> </g> </svg>
	              </div>
	              <div class="title" style="width:238px; margin-top:0; font-size:14px;">
	                	${workList.wo_title }
	              </div>
	              <div class="Work_state">
	               	 안 읽음
	              </div>
	            </a>
            </c:forEach>
            <!-- 
            <a id="d4" href="#" class="Work_row ck" style="padding:10px 13px">
              <div class="Bookmark">
                <svg version="1.1" x="0px" y="0px" viewBox="0 0 100 100" style="enable-background:new 0 0 100 100;" xml:space="preserve"> <g> <path style="fill:#FFFFFF;" d="M76.8583984,96.0566406c-0.9765625,0-1.9580078-0.2353516-2.8652344-0.7109375 L50.4086914,82.9453125c-0.0424805-0.0214844-0.0942383-0.0234375-0.1376953,0.0009766L26.6875,95.3447266 c-2.0859375,1.0966797-4.5668945,0.9169922-6.4731445-0.46875c-1.90625-1.3847656-2.8432617-3.6884766-2.4448242-6.0107422 l4.5039063-26.2617188c0.0083008-0.0478516-0.0073242-0.0957031-0.0415039-0.1289063L3.1513672,43.8754883 c-1.6875-1.6450195-2.2836914-4.059082-1.5551758-6.3007813c0.7280273-2.2412109,2.6293945-3.8442383,4.9614258-4.1831055 l26.3681641-3.831543c0.0478516-0.0068359,0.0893555-0.0371094,0.1108398-0.0805664L44.828125,5.5864258 c1.043457-2.1132813,3.1552734-3.4262695,5.512207-3.4262695s4.4692383,1.3129883,5.512207,3.4257813v0.0004883 l11.7919922,23.8935547c0.0214844,0.043457,0.0625,0.0732422,0.1103516,0.0800781l26.3671875,3.831543 c2.3320313,0.3388672,4.2333984,1.9414063,4.9619141,4.1826172C99.8125,39.815918,99.2158203,42.2299805,97.5283203,43.875 L78.4482422,62.4746094c-0.0341797,0.0332031-0.0498047,0.0820313-0.0419922,0.1289063l4.5048828,26.2617188 c0.3974609,2.3222656-0.5390625,4.6259766-2.4453125,6.0107422C79.3886719,95.6591797,78.1279297,96.0566406,76.8583984,96.0566406 z M50.340332,76.9287109c0.9819336,0,1.9633789,0.2353516,2.8588867,0.7050781l23.5859375,12.4003906 c0.0449219,0.0234375,0.0791016,0.0429688,0.1533203-0.0117188c0.0742188-0.0537109,0.0673828-0.0917969,0.0585938-0.1435547 l-4.5048828-26.2617188c-0.3417969-1.9941406,0.3193359-4.0263672,1.7675781-5.4394531l19.0810547-18.5991211 c0.0371094-0.0366211,0.0644531-0.0634766,0.0371094-0.1499023c-0.0283203-0.0864258-0.0664063-0.0917969-0.1191406-0.0996094 l-26.3671875-3.831543c-2.0029297-0.2910156-3.7333984-1.5478516-4.6279297-3.3632813L50.4716797,8.2416992 c-0.0458984-0.0947266-0.2163086-0.0952148-0.2631836,0.0004883L38.4169922,32.1352539 c-0.8959961,1.8144531-2.6259766,3.0712891-4.628418,3.3623047l-26.3676758,3.831543 c-0.0527344,0.0078125-0.090332,0.0131836-0.1186523,0.0996094c-0.027832,0.0864258-0.0004883,0.1132813,0.0371094,0.1499023 l19.0805664,18.5991211c1.4487305,1.4121094,2.1098633,3.4462891,1.7670898,5.4404297l-4.503418,26.2607422 c-0.0092773,0.0527344-0.015625,0.0898438,0.0581055,0.1435547c0.0732422,0.0527344,0.1069336,0.0361328,0.1542969,0.0117188 l23.5839844-12.3994141C48.3754883,77.1640625,49.3583984,76.9287109,50.340332,76.9287109z"/> </g> </svg>
              </div>
              <div class="title" style="margin-top:0; font-size:14px;">
                디자인 최종본 마감일 연장 안내
              </div>
              <div class="Work_state">
                읽음
              </div>
            </a>-->
          </div>
        </article>
      </section>
      <!--알림 파업 시작-->
      <div class="not-popup popup1">
        <div class="header">
          <div class="btn" onclick="UPMCkNot(1,1)">취소</div>
          <div class="title">알림생성</div>
          <div class="btn" onclick="not()">보내기</div>
        </div>
        <div class="body NotBody" style="height:100%;">
          <!-- 게시글 시작 -->
          <style>
          	li{list-style:none;}
  a{color:#fff; text-decoration:none;}
  input{outline-style:none; color:#fff;}
  input::-webkit-search-decoration,
  input::-webkit-search-cancel-button,
  input::-webkit-search-results-button,
  input::-webkit-search-results-decoration {display:none; }
  input::-webkit-input-placeholder{color:rgba(255, 255, 255, 0.69);}
  .ta-toolbar{margin:16px 0;}
  .ta-editor {
  min-height: 300px;
  height: auto;
  overflow: auto;
  font-family: inherit;
  font-size: 100%;
}
/*body{background:#42495e; color:#fff;}*/
.btn-group:nth-child(1){display:none;}
.btn-group:nth-child(2){display:none;}
.btn-group button{width:47px; height:44px; background:#515973; border:0; border-left:1px solid #4a516a;border-top:1px solid #4a516a; border-bottom:1px solid #4a516a;}
.btn-group button:last-child{border-right:1px solid #4a516a;}
.container{padding-top:25px;}
.container .btn-group button svg{width:18px;}
.container .active{background:#606b90 !important;}
.container .title{width:90%; margin:0 auto; padding:15px 25px; background:#42495e; font-size:25px; border:0; display:block; border-bottom:1px solid rgba(255, 255, 255, 0.12);}
.container .ng-isolate-scope{width:90%; margin:0 auto;}
.container a{color:#ffacaf; text-decoration:underline;}
.ng-scope.ng-isolate-scope.ng-valid.ta-text.ta-editor.form-control.ng-dirty{width:100%;}
.ng-scope.ng-isolate-scope.ng-pristine.ng-valid.ta-text.ta-editor.form-control{width:100%; border:1px solid #7882fffa;}
.P-editor-sub{display:none;}
.ta-html{width:100% !important; background:#2b2f3e; color:#fff; border:1px solid #2b2f3e;}
textarea:focus { outline: none; }
.ta-text{width:100%; color:#fff;}

.not-content-title{width:90%; margin:0 auto; padding:35px 25px 15px; background:#42495e; font-size:25px; border:0; display:block; border-bottom:1px solid rgba(255, 255, 255, 0.12);}
.not-content-gnb{margin:0 15px;float:right;}
.not-content-gnb>div,.not-content-gnb>a{margin:10px 5px; padding:5px 10px; background:rgba(41, 45, 58, 0.34); float:left;}
.not-content-con{margin-top:65px; padding:0 24px;}


/*날짜 디자인 */
          </style>
          <form action="workPro.ops" method="post" name="formNot">
			<div ng-app="textAngularTest" ng-controller="wysiwygeditor" class="container">
			  <h3 class="P-editor-sub">프로젝트 총괄 시스템 Editor</h3>
			  <input type="title" class="title" name="title" value="" placeholder="제목">
			  <div text-angular="text-angular" name="htmlcontent" ng-model="htmlcontent" ta-disabled='disabled'>
			  	<div style="float:right;">
			  		<input type="text" id="txtStartDate" name="startDate" style="padding:9px 8px; background: #2c2f3d; border: 0;" placeholder="시작일 (YYYY-MM-DD)">
			  		<input type="text" id="txtEndDate" name="endDate" style="padding:9px 8px; background: #2c2f3d; border: 0;" placeholder="종료일 (YYYY-MM-DD)">
					<input type="hidden" class="pj_no" name="pj_no" value="${pjb[0].pj_no }">
			  	</div>
			  </div>
			  <textarea id="note" ng-model="htmlcontent" name="content" style="width:100%; display:none;" placeholder="html 코드 사입"></textarea>
			</div>
			</form>
			<script>
				function not(){
					formNot.submit();
				}
			</script>
			  <script src='https://ajax.googleapis.com/ajax/libs/angularjs/1.2.4/angular.min.js'></script>
			  <script src='https://ajax.googleapis.com/ajax/libs/angularjs/1.2.4/angular-sanitize.min.js'></script>
			  <script src='js/editor/textAngular.min.js'></script>
			  <script type="text/javascript" src="js/editor/editor.js"></script>
          <!-- 게시글 종료-->
        </div>
      </div>
      <div class="not-popup-BG"></div>
      <!--알림 파업 끝-->
      
      <!--알림 자세히보기 팝업 -->
      <div class="not-popup popup3">
        <div class="header">
          <div class="btn" onclick="UPMCkNot(1,3)">취소</div>
          <div class="title">게시판</div>
        </div>
        <div class="body" style="height:100%;">
        	<div class="not-content-title">내용입니다.</div>
        	<div class="not-content-gnb">
        		<div>작성자 : 김태경</div>
        		<div>공개범위</div>
        		<div>2019-06-12 ~ 2019-06-13</div>
        	</div>
        	<div class="not-content-con">
        		내용입니다.내용입니다..
        	</div>
        </div>
      </div>
      <!--알림 자세히보기 팝업  끝-->
      
      <!--조직도 파업 시작-->
      <div class="not-popup popup2">
        <div class="header">
          <div class="btn" onclick="UPMCkNot(1,2)">취소</div>
          <div class="title">조직도</div>
        </div>
        <div class="body" style="height:100%;">
          <iframe src="" style="width:100%; height:inherit; border:0;"></iframe>
        </div>
      </div>
      <!--조직도 파업 끝-->

      <aside class="admin-New-con pj-con">
        <div class="head">
          <div class="col1">
            <div class="title"><c:forEach var="pjb" items="${pjb}" varStatus="status"> ${pjb.pj_title}</c:forEach></div>
            <div class="subName">
              	기획 팀장
            </div>
          </div>
          <div class="col2">
            <div style="width:35px; margin-top:30px;">
              <svg version="1.1" x="0px" y="0px" viewBox="0 0 100 100" style="enable-background:new 0 0 100 100;" xml:space="preserve"> <path style="fill:#FFFFFF;" d="M95.5,45.7H54.3V4.5c0-2.2-1.8-4-4-4h0c-2.2,0-4,1.8-4,4v41.2H5c-2.2,0-4,1.8-4,4v0c0,2.2,1.8,4,4,4 h41.2V95c0,2.2,1.8,4,4,4h0c2.2,0,4-1.8,4-4V53.8h41.2c2.2,0,4-1.8,4-4v0C99.5,47.5,97.7,45.7,95.5,45.7z"/> </svg>
            </div>
          </div>
        </div>
        <div class="body">
          <ul class="subMenu">
            <li><a href="#" onclick="UPMCkNot(1,1)">알림생성</a></li>
            <li><a>｜</a></li>
            <!-- <li><a href="#" onclick="UPMCkNot(1,3)">업무생성</a></li>-->
            <li><a href="schedule.ops?no=${pjb[0].pj_no}">스캐줄</a></li>
            <li><a>｜</a></li>
            <li><a href="#" onclick="UPMCkNot(1,2)">조직도</a></li>
          </ul>
          <div class="line">
            <div class="replace-con">
              <div class="r-icon">
                <a href="#"><svg version="1.1" x="0px" y="0px" viewBox="0 0 100 100" style="enable-background:new 0 0 100 100;" xml:space="preserve"> <g> <path style="fill:#FFFFFF;" d="M49.5,99C23.3,99,2,77.7,2,51.5S23.3,4,49.5,4c4.8,0,9.5,0.7,14,2.1c1.8,0.6,2.9,2.5,2.3,4.3 c-0.6,1.8-2.5,2.9-4.3,2.3c-3.9-1.2-7.9-1.8-12-1.8C27.1,10.9,9,29.1,9,51.5S27.1,92,49.5,92S90,73.8,90,51.5 c0-1.9,1.6-3.5,3.5-3.5s3.5,1.6,3.5,3.5C97,77.7,75.7,99,49.5,99z"/> </g> <g> <path style="fill:#FFFFFF;" d="M74.6,15.5c-1.7,3.4-4.8,5.7-8.3,6.5c-0.8,0.2-1.5,0.7-1.9,1.5l-0.2,0.4c-1,2,0.5,4.3,2.7,4.2 L91,26.8c2.2-0.1,3.4-2.5,2.3-4.4L80.2,2.1c-1.2-1.8-3.9-1.7-4.9,0.2l-0.1,0.3C74.8,3.3,74.7,4.2,75,5 C76.4,8.3,76.3,12.1,74.6,15.5z"/> </g> </svg></a>
              </div>
              <div class="r-title">
                	새로고침
              </div>
            </div>
          </div>
          <div class="chatCon">
          	<c:forEach var="meworkMyList" items="${meworkMyList}" varStatus="status">
            <a href="#p" class="chatcontent GreenLine" onclick="UPMCkNot(1,3); notDocumentPopupView(${meworkMyList.wo_no})">
              	${meworkMyList.wo_title}
              <div class="date">
              	<span>수정</span> ${meworkMyList.wo_StratDate}
              </div>
            </a>
            </c:forEach>
          </div>
        </div>
      </aside>
      <section class="pj-con pj-row2">
        <article class="PJ-list">
          <div class="title">
            <div class="icon">
              <svg width="32" height="32" viewBox="0 0 24 24"><path fill="none" d="M0 0h24v24H0V0z"/><path d="M9 13.75c-2.34 0-7 1.17-7 3.5V19h14v-1.75c0-2.33-4.66-3.5-7-3.5zM4.34 17c.84-.58 2.87-1.25 4.66-1.25s3.82.67 4.66 1.25H4.34zM9 12c1.93 0 3.5-1.57 3.5-3.5S10.93 5 9 5 5.5 6.57 5.5 8.5 7.07 12 9 12zm0-5c.83 0 1.5.67 1.5 1.5S9.83 10 9 10s-1.5-.67-1.5-1.5S8.17 7 9 7zm7.04 6.81c1.16.84 1.96 1.96 1.96 3.44V19h4v-1.75c0-2.02-3.5-3.17-5.96-3.44zM15 12c1.93 0 3.5-1.57 3.5-3.5S16.93 5 15 5c-.54 0-1.04.13-1.5.35.63.89 1 1.98 1 3.15s-.37 2.26-1 3.15c.46.22.96.35 1.5.35z" style="fill:#fff;"/></svg>
            </div>
            <div class="cont">
             	 참여 중인 프로젝트 바로가기
            </div>
            <div class="info">
              <c:choose>
              	<c:when test="${fn:length(pjbl)>5}">
              		5건
              	</c:when>
              	<c:otherwise>
              		<c:out value="${fn:length(pjbl)}"></c:out>건
              	</c:otherwise>
              </c:choose>
              
            </div>
          </div>
          <div class="con">
            <ul class="list" style="height:263px; overflow-x:hidden;">
           	  <c:forEach var="pjbl" items="${pjbl}" varStatus="status" end="4">
              <li>
                <a href="project.op?pj_no=${pjbl.pj_no}"><div>${pjbl.pj_title}</div>
	                <span>그룹 : 디자인팀</span>
	                <span>그룹별 프로젝트 명 : 디자인 1팀</span>
	                <span>방식: 개인별</span>
                </a>
              </li>
              </c:forEach>
            </ul>
          </div>
        </article>
        <article class="weather-content">
          <!--날씨 정보 시작-->
            <div class="x-xuser-wtcon">
              <div id="loading-GPS" class="GPSICONX2" onclick="GPSCK()">
                  <svg version="1.1" x="0px"
                  	 y="0px" viewBox="0 0 16 16" style="enable-background:new 0 0 16 16;" xml:space="preserve">
                  <path style="fill:#FFFFFF;" d="M8,0.5C3.9,0.5,0.5,3.9,0.5,8s3.4,7.5,7.5,7.5s7.5-3.4,7.5-7.5S12.1,0.5,8,0.5z M12.4,12.4
                  	c-1,1-2.4,1.7-3.8,1.8v-2.6c0-0.1-0.1-0.2-0.2-0.2H7.6c-0.1,0-0.2,0.1-0.2,0.2v2.6c-1.4-0.1-2.8-0.8-3.8-1.8c-1-1-1.7-2.4-1.8-3.8
                  	h2.6c0.1,0,0.2-0.1,0.2-0.2V7.6c0-0.1-0.1-0.2-0.2-0.2H1.8c0.1-1.4,0.8-2.8,1.8-3.8c1-1,2.4-1.7,3.8-1.8v2.6c0,0.1,0.1,0.2,0.2,0.2
                  	h0.8c0.1,0,0.2-0.1,0.2-0.2V1.8c1.4,0.1,2.8,0.8,3.8,1.8c1,1,1.7,2.4,1.8,3.8h-2.6c-0.1,0-0.2,0.1-0.2,0.2v0.8
                  	c0,0.1,0.1,0.2,0.2,0.2h2.6C14.1,10.1,13.5,11.4,12.4,12.4z"/>
                  </svg>
              </div>
              <a id="GPS-ICON" href="#" class="GPSICONX2" onclick="GPSCK()">
                <svg version="1.1" x="0px"
                	 y="0px" viewBox="0 0 16 16" style="enable-background:new 0 0 16 16;" xml:space="preserve">
                <path style="fill:#FFFFFF;" d="M8,0.5C3.9,0.5,0.5,3.9,0.5,8s3.4,7.5,7.5,7.5s7.5-3.4,7.5-7.5S12.1,0.5,8,0.5z M12.4,12.4
                	c-1,1-2.4,1.7-3.8,1.8v-2.6c0-0.1-0.1-0.2-0.2-0.2H7.6c-0.1,0-0.2,0.1-0.2,0.2v2.6c-1.4-0.1-2.8-0.8-3.8-1.8c-1-1-1.7-2.4-1.8-3.8
                	h2.6c0.1,0,0.2-0.1,0.2-0.2V7.6c0-0.1-0.1-0.2-0.2-0.2H1.8c0.1-1.4,0.8-2.8,1.8-3.8c1-1,2.4-1.7,3.8-1.8v2.6c0,0.1,0.1,0.2,0.2,0.2
                	h0.8c0.1,0,0.2-0.1,0.2-0.2V1.8c1.4,0.1,2.8,0.8,3.8,1.8c1,1,1.7,2.4,1.8,3.8h-2.6c-0.1,0-0.2,0.1-0.2,0.2v0.8
                	c0,0.1,0.1,0.2,0.2,0.2h2.6C14.1,10.1,13.5,11.4,12.4,12.4z"/>
                </svg>
              </a>
              <div class="xwrcon">
                <div class="wr-content">
                  <div class="x-xuser-wticon">

                  </div>
                  <div class="x-xuser-wtinfo">
                    <div class="wt-do">
                      <span>--</span><span style="margin-left:2px;">℃</span>
                    </div>
                    <div class="wtsky">
                      	--
                    </div>
                    <div class="wtdust">
                        <span>미세먼지</span><span class="wtdStage2">--</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          <!--날씨 정보 종료-->
        </article>
      </section>
      <section class="memo-wrap pj-con">
        <div class="memo-h">
          <span>메모</span>
          <a href="#">
            <em>메모쓰기</em>
            <span style="width:20px; margin:4px 15px 0 0; display:block;">
              <svg version="1.1" x="0px" y="0px" viewBox="0 0 100 100" style="enable-background:new 0 0 100 100;" xml:space="preserve"> <g> <path style="fill:none;" d="M8.56249,21.52978v58.98545c0,4.14258,3.38936,7.53194,7.53195,7.53194H75.0799 c4.14256,0,7.53193-3.38937,7.53193-7.53194v-9.71998H51.7001c-4.05534,0-7.37336-3.31801-7.37336-7.37335V13.99783H16.09443 C11.95185,13.99783,8.56249,17.3872,8.56249,21.52978z"/> <path style="fill:#FFFFFF;" d="M84.06137,70.79525h-1.44955v9.71998c0,4.14258-3.38937,7.53194-7.53193,7.53194H16.09443 c-4.14258,0-7.53195-3.38937-7.53195-7.53194V21.52978c0-4.14258,3.38936-7.53195,7.53195-7.53195h28.23231v-2.31608 c0-2.04763,0.84623-3.90695,2.20584-5.2464H8.53194C4.38936,6.43535,1,9.82471,1,13.96729v74.11042 c0,4.14258,3.38936,7.53194,7.53194,7.53194h74.11044c4.14256,0,7.53192-3.38937,7.53192-7.53194V67.53205 C88.84624,69.49695,86.59808,70.79525,84.06137,70.79525z"/> </g> <path style="fill:#FFFFFF;" d="M90.23645,10.78467L42.72182,58.2993c-0.04383,0.04383-0.08317,0.09009-0.11848,0.13784 c-0.67234,0.70214-1.18456,1.54976-1.38496,2.39261l-1.85795,7.81448c-0.42028,1.76772,0.68216,2.87016,2.44986,2.44987 l7.8145-1.85793c0.84285-0.20041,1.69044-0.71264,2.39259-1.38499c0.04775-0.03532,0.09403-0.07463,0.13786-0.11846 l47.51463-47.51463c0.36765-0.36765,0.43922-0.89764,0.15912-1.17775l-8.41479-8.41479 C91.13407,10.34542,90.6041,10.41702,90.23645,10.78467z"/> </svg>
            </span>
          </a>
        </div>
        <div class="memo-con">
          <div class="memo-row">
            <div class="con">
              기념일!!
            </div>
            <div class="date">2019-01-13</div>
          </div>
          <div class="memo-row">
            <div class="con">
              ★ 휴가!! ★
            </div>
            <div class="date">2019-01-13</div>
          </div>
        </div>
      </section>
    </main>
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

    <div id="sortIdx"></div>
    <div id="sortIdx1"></div>
    <!--드래그엔 드롭-->
    <script>
    var NowWork;
    var MyWork;
    $( function() {
      $( "#drag1, #drag2" ).sortable({
        connectWith: ".connectedSortable",
        update: function(event, ui) {
          var productOrder2 = $('#drag2').sortable('toArray').toString();
          var productOrder1 = $('#drag1').sortable('toArray').toString();
          $("#sortIdx").text(productOrder1);
          $("#sortIdx1").text(productOrder2);
          
          var pj_no=$(".pj_no").val();
          MyWork=$("#sortIdx").text();
          NowWork=$("#sortIdx1").text();
          $.ajax({
        	  url:'workSortChange.ops',
        	  method:'post',
        	  dataType:'html',
        	  data:{myWork:MyWork, nowWork:NowWork, pj_no:pj_no},
        	  success: function(response){
        		  
        	  }
          });
          
        }
	      
      }).disableSelection();
      
      //업무 위치 변경(없으면 위에 두번 전송됨...)
      $( "#drag2" ).sortable({
    	  connectWith: ".connectedSortable",
          update: function(event, ui) {
	         
          }
      }).disableSelection();
      
      
    } );
    </script>
    <script>
    	//신규업무 더블클릭시 보여주기
    	function notDocumentPopup(wsNo){
    		$.ajax({
    			url:'workView.ops',
    			method:'post',
    			dataType:'html',
    			data:{ws_no:wsNo},
    			success:function(response){
    				$(".popup3").html(response);
    			}
    		});
    	}
    	//내가 생성한 업무 view 보여주기
    	function notDocumentPopupView(woNo){
    		$.ajax({
    			url:'MyWorkView.ops',
    			method:'post',
    			dataType:'html',
    			data:{wo_no:woNo},
    			success:function(response){
    				$(".popup3").html(response);
    			}
    		});
    	}
    </script>
</c:if>
	
<c:if test="${EM_id!=null}">
	<!-- 채팅보여주기 -->
    <aside id="x-xchaeTing-wrap" class="x-xchaeTing-wrap chOns2" oncontextmenu="return false" style="z-index:500;">
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
  
  <aside class="chOns" oncontextmenu="return false" style="right:430px; z-index:500; height:500px; bottom:0; background:none; border:0;">
        <div class="x-cht-con" style="display: block;">
        </div>        
  </aside>
  <!-- 채팅 마우스 우클릭 -->
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
  <!-- //채팅마우스 우클릭 -->
    <div class="message"></div>
    <!--채팅 마우스 우클릭-->
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
</c:if>

<script>
	

      function UPMCkNot(a,b){
        if(a==1){
        	
        	
          //$('.not-popup').css('display','block');
          $('.not-popup-BG').css('display','block');
          $('.popup'+b+'.not-popup-animaE').removeClass('not-popup-animaNone');
          $('.popup'+b+'.not-popup-animaE').addClass('not-popup');

          $('.popup'+b+'.not-popup').removeClass('not-popup-animaE');

          $('.popup'+b+'.not-popup').addClass('not-popup-animaS');
          a++;
          //$('.subMenu>li:nth-child(1)>a').attr('onclick','UPMCkNot('+a+','+b+')');
          $('a[onclick="UPMCkNot('+a+','+b+')"]').attr('onclick','UPMCkNot('+a+','+b+')');
          $('.popup'+b+'.not-popup>.header>div:nth-child(1)').attr('onclick','UPMCkNot('+a+','+b+')');
          
          if(b==2){
        	  var pj_no="orgchat.ops?pjNo="+<c:forEach var="pjb" items="${pjb}" varStatus="status">${pjb.pj_no}</c:forEach>;
        	  $(".popup2>.body>iframe").attr({"src":pj_no});
        	}
        	  
          }
        }
    </script>
  </body>
</html>
