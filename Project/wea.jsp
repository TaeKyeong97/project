<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="css/user-p-main.css">
    <!--<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script> -->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript">
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
        //var url="wearther.jsp?latitude="+latitude+"&longitude="+longitude;
        //$('.weatherCon').attr("src","wearther.jsp?latitude="+xy.x+"&longitude="+xy.y);


            $.ajax({
        		url : 'wearther.jsp',
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
  </head>
  <body>
    <div class="x-xuser-wtcon">
      <div id="loading-GPS" class="GPSICONX2" type="button" name="GPS" alt="GPS" onclick="GPSCK()">
          <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px"
          	 y="0px" viewBox="0 0 16 16" style="enable-background:new 0 0 16 16;" xml:space="preserve">
          <path style="fill:#FFFFFF;" d="M8,0.5C3.9,0.5,0.5,3.9,0.5,8s3.4,7.5,7.5,7.5s7.5-3.4,7.5-7.5S12.1,0.5,8,0.5z M12.4,12.4
          	c-1,1-2.4,1.7-3.8,1.8v-2.6c0-0.1-0.1-0.2-0.2-0.2H7.6c-0.1,0-0.2,0.1-0.2,0.2v2.6c-1.4-0.1-2.8-0.8-3.8-1.8c-1-1-1.7-2.4-1.8-3.8
          	h2.6c0.1,0,0.2-0.1,0.2-0.2V7.6c0-0.1-0.1-0.2-0.2-0.2H1.8c0.1-1.4,0.8-2.8,1.8-3.8c1-1,2.4-1.7,3.8-1.8v2.6c0,0.1,0.1,0.2,0.2,0.2
          	h0.8c0.1,0,0.2-0.1,0.2-0.2V1.8c1.4,0.1,2.8,0.8,3.8,1.8c1,1,1.7,2.4,1.8,3.8h-2.6c-0.1,0-0.2,0.1-0.2,0.2v0.8
          	c0,0.1,0.1,0.2,0.2,0.2h2.6C14.1,10.1,13.5,11.4,12.4,12.4z"/>
          </svg>
      </div>
      <a id="GPS-ICON" href="#" class="GPSICONX2" type="button" name="GPS" alt="GPS" onclick="GPSCK()">
        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px"
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
  </body>
</html>
