<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> -->
<!--매인 페이지에 중복값이 존재하여 주서처리함...<script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<script>
function getLocation() {
	  if (navigator.geolocation) { // GPS를 지원하면
	    navigator.geolocation.getCurrentPosition(function(position) {
	      //alert(position.coords.latitude + ' ' + position.coords.longitude);
	    }, function(error) {
	      console.error(error);
	    }, {
	      enableHighAccuracy: false,
	      maximumAge: 0,
	      timeout: Infinity
	    });
	  } else {
	    alert('GPS를 지원하지 않습니다');
	  }
	}
	getLocation();

</script>
<div class="wr-content ${timeBG} weatherBG${sk} PTYS${PTYS}">
	<div class="x-xuser-wticon x-xuser-wticon${sk} ${timeBG}${sk}">
	
	</div>
	<div class="x-xuser-wtinfo">
	<div class="wtarea"></div>
	<div class="region" style="display:none;"></div>
	  <div class="wt-do">
	    <span><fmt:formatNumber value="${obsrValuedou}" type="number" pattern="00"></fmt:formatNumber></span><span style="margin-left:2px;">℃</span>
	  </div>
	  <div class="wtsky">
	  <c:choose>
	  	<c:when test="${PTY.equals('없음')}">
	  		${SKY}
	  	</c:when>
	  	<c:when test="${PTY.equals('비')}">
	  	</c:when>
	  	<c:when test="${PTY.equals('비/비눈')}">
	  	</c:when>
	  	<c:when test="${PTY.equals('눈')}">
	  	</c:when>
	  </c:choose>
	  </div>
	  <div class="wtdust">
	      <span>미세먼지</span><span class="wtdStage wtdStage2"></span>
	  </div>
	</div>
</div>
<script type="text/javascript">
  $.get("https://ipinfo.io?token=322747f9f912f2", function (response) {
	  console.log(response.ip, response.country);
  cit = response.city;
  switch(cit){
    case("Gimhae"):cit="김해시";
    region="경남";
    break;
    case("Gangwon-Do"):cit="강원도";
    break;
    case("Kyonggi-Do"):cit="경기도";
    break;
    case("Gwangju"):cit="광주";
    break;
    case("Electrification"):cit="대전";
    break;
    case("Busan"):cit="부산";
    break;
    case("Seoul"):cit="서울";
    break;
    case("Incheon"):cit="인천";
    region="인천";
    break;
    case("Ulsan"):cit="울산";
    region="울산";
    break;
    case("Cheju-Do"):cit="제주시";
    region="제주";
    break;
    case("Hwaseong-si"):
    cit="안성시";
    region="경기";
    break;
    case("Anseong-si"):
    cit="안성시";
    region="경기"
    break;
    case("Gwanak-gu"):
    cit="안성시";
    region="경기"
    break;

  }
  $(".wtarea").html(cit);
  $(".region").html(region);
  
//미세먼지

  cit=document.getElementsByClassName("wtarea")[0].innerText;
  region=document.getElementsByClassName("region")[0].innerText;
    name="mise.jsp?CityName="+cit+"&&region="+region;
    fetch(name).then(function(response){
      response.text().then(function(text){
  		$('.wtdStage').html(text);
  		var toid=$('.wtdStage').text().trim();
  		  switch(toid){
  		  	case("좋음"):toid="wtdStage1";
  		  	break;
  		  	case("보통"):toid="wtdStage2";
  		  	break;
  		  	case("나쁨"):toid="wtdStage3";
  		  	break;
  		  	case("매우나쁨"):toid="wtdStage4";
  		  	break;
  		  }
  		  $('.wtdStage').attr('id',toid);
      })
    });
  
}, "jsonp");

  
</script>
</body>
</html>

