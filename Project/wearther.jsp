<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*" %>
    <%@ page import="java.net.*" %>
    <%@ page import="org.json.simple.*" %>
    <%@ page import="org.json.simple.parser.JSONParser" %>
    <%@ page import="java.util.*" %>
    <%@ page import="java.text.*" %>
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
<%--
ApiExplorer apiExplorer = new ApiExplorer();

out.println(apiExplorer.getTonge());
--%>
<%
/*
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
 */
 Vector<String> va = new Vector<String>();
 SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
 SimpleDateFormat hors = new SimpleDateFormat("HH-mm");
 SimpleDateFormat horsA = new SimpleDateFormat("HH");

 /**********아침 점심 저녁 구분*******/

 String h=horsA.format(new java.util.Date());
 String h01=h.substring(0,1);
 String h02=h.substring(1,2);
 int h1=Integer.parseInt(h02);
 String timeBG="";
 if(h01.equals("0")){
 	 if(h1>=0&&h1<=4){
 		 //저녁
 		 timeBG="DinnerBG";
 	 }else if(h1>=5&&h1<=7){
 		 //새벽
 		 timeBG="dawnBG";
 	 }else if(h1>=8&&h1<=9){
 		 //아침
 		 timeBG="morningBG";
 	 }
 }else if(h01.equals("1")){
 	 if(h1>=0&&h1<=7){
 		 //아침 점심
 		 timeBG="morningBG";
 	 }else if(h1>=8&&h1<9){
 		 //해짐
 		 timeBG="sunsetBG";
 	 }else if(h1>=9){
 		//저녁 
 		 timeBG="DinnerBG";
 	 }	 
 }else if(h01.equals("2")){
 	//저녁
 	timeBG="DinnerBG";
 }


 /**********--아침 점심 저녁 구분*******/
 
 /*******************/
 //현재 시간 기상청 갱신 시간인지 확인 하기 위해 설정..함...
 String horss = hors.format(new java.util.Date());
 String horArray[]=horss.split("-");
 int horArrInt=Integer.parseInt(horArray[1]);
 int horArrInt2=Integer.parseInt(horArray[0]);
 String horsOne=null;
 
 String horArrString=Integer.toString(horArrInt);
 
 if(horArrInt>30){
 	/*해당 시간에 30분값을 담아 서 보내준다.*/
	horsOne=horsA.format(new java.util.Date());
	horsOne+="30";
 }else{
	 /*해당시간 1시간 전 시간을 담아 보내준다.*/
	 horsOne=horsA.format(new java.util.Date());
	 int horInt=Integer.parseInt(horsOne);
	 if(horInt!=00){
		 horInt=horInt-1;
	 }else{
		 horInt=23;
	 }
	 if(horArrString.substring(0,1)=="0"){
		//현재 갱신 가능 시간
		 horsOne="0"+horInt+"30";
		 //out.println(horsOne);
	 }else{
		 //현재 갱신 가능 시간
		 horsOne="0"+horInt+"30";
		 //out.println(horsOne);
	 }
 }
 //현재 날짜
 String today = date.format(new java.util.Date());
 
 /*00시는 하루전날 2330값 가져옴*/
 if(horArrInt2==00){
	 Calendar days = Calendar.getInstance();
		days.add(Calendar.DATE , -1);
		String beforeDates = new java.text.SimpleDateFormat("yyyyMMdd").format(days.getTime());
		today=beforeDates;
		horsOne="2330";
 /*01시는  0030값 가져옴*/
 }else if(horArrInt2==01){
	 horsOne="0030";
 }
 /*******************/


	//x
	String latitude=request.getParameter("latitude");
	//y
	String longitude=request.getParameter("longitude");
        try{
        	 
          /*요청정보입력
           * 아래와 같은 정보들은 사용자 가이드를 확인하여 찾아주시면 됩니다.
           * 위도 경도는 엑셀파일 안에 있습니다.
           * */
           
            //자신이 조회를 원하는 지역의 경도와 위도를 입력해주세요
            String nx = latitude;  //경도
            String ny = longitude;   //위도
            String baseDate = today; // 자신이 조회하고싶은 날짜를 입력해주세요
            String baseTime = horsOne; //자신이 조회하고싶은 시간대를 입력해주세요
            System.out.println(horsOne);
            // 서비스 인증키입니다. 공공데이터포털에서 제공해준 인증키를 넣어주시면 됩니다.
            String serviceKey = "NKr1%2FQfLQhOlZANC9dE%2F5qtVeM1Ayu4zRLb7jkfRvcWut0tiysJKT2f%2Frihd9gvEZZ7%2Bm5huttBoo0WZMLAruA%3D%3D";
 
            // 정보를 모아서 URL정보를 만들면됩니다. 맨 마지막 "&_type=json"에 따라 반환 데이터의 형태가 정해집니다.
            //String urlStr = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastSpaceData?"
            		String urlStr = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastGrib?"
            		+ "serviceKey=" + serviceKey + "&base_date=" + baseDate + "&base_time=" + baseTime
                + "&nx="+ nx + "&ny=" + ny +"&numOfRows=10"+ "&_type=json";
            URL url = new URL(urlStr); // 위 urlStr을 이용해서 URL 객체를 만들어줍니다.
            BufferedReader bf;
            String line = "";
            String result="";
 
            //날씨 정보를 받아옵니다.
            bf = new BufferedReader(new InputStreamReader(url.openStream()));
 
            //버퍼에 있는 정보를 하나의 문자열로 변환.
            while((line=bf.readLine())!=null){
                result=result.concat(line);
               //out.println(result);  // 받아온 데이터를 확인해봅니다.
            }
            
             // Json parser를 만들어 만들어진 문자열 데이터를 객체화 합니다.
        JSONParser parser = new JSONParser();
        JSONObject obj = (JSONObject) parser.parse(result);
         
        // Top레벨 단계인 response 키를 가지고 데이터를 파싱합니다.
        JSONObject parse_response = (JSONObject) obj.get("response");
        // response 로 부터 body 찾아옵니다.
        JSONObject parse_body = (JSONObject) parse_response.get("body");
        // body 로 부터 items 받아옵니다.
        JSONObject parse_items = (JSONObject) parse_body.get("items");
         
        // items로 부터 itemlist 를 받아오기 itemlist : 뒤에 [ 로 시작하므로 jsonarray이다
        JSONArray parse_item = (JSONArray) parse_items.get("item");
         
        String category;
        String obsrValue;
        double nY ;
        JSONObject weather; // parse_item은 배열형태이기 때문에 하나씩 데이터를 하나씩 가져올때 사용합니다.
 		
        //out.println("전체 사이즈 ="+parse_item.size());
        // 필요한 데이터만 가져오려고합니다.
        for(int i=0 ; i<parse_item.size(); i++)
        {

          weather = (JSONObject) parse_item.get(i);
          //String base_Date = (String)weather.get("baseDate");
          //String fcst_Time = (String)weather.get("fcstDate");
          //double fcst_Value = ((Long)weather.get("fcstValue")).doubleValue(); //실수로된 값과 정수로된 값이 둘다 있어서 실수로 통일했습니다.
          
        
          obsrValue = (String) weather.get("obsrValue").toString();


          //String nX = (String)weather.get("nx");
          category = (String)weather.get("category");
          
          
          
          //String base_Time = (String)weather.get("baseTime");
          //String fcscDate = (String)weather.get("fcscDate");
           
          // 출력합니다.
          /*
          out.print("배열의 "+i+"번째 요소");
          out.print("   category : "+ category);
          out.print("   obsrValue : "+ obsrValue);
          out.println("<br>");
          */
         
          if(category.equals("T1H")){
        	//out.print("온도 : ");
        	va.addElement(obsrValue);
            //out.print(obsrValue+"℃");
            //out.println("<br>");
          }else  if(category.equals("WSD")){
			//out.print("풍속 : ");
			va.addElement(obsrValue);
			//out.print(obsrValue+"m/s");
			//out.println("<br>");
          }else if(category.equals("PTY")){
        	  va.addElement(obsrValue);
          }
          
        }
            bf.close();
            
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        
      //강수 형태 (눈, 비) PTY 가 제일 먼저 JSON에 있기때문에 0번째에 담김
        String PTY =va.elementAt(0);
      	String PTYS="0";
      	
      	if(PTY.equals("0")){
      		PTY="없음";
      		PTYS="0";
      	}else if(PTY.equals("1")){
      		PTY="비";
      		PTYS="1";
      	}else if(PTY.equals("2")){
      		PTY="비/눈";
      		PTYS="2";
      	}else if(PTY.equals("3")){
      		PTY="눈";
      		PTYS="3";
      	}else if(PTY.equals("4")){
      		PTY="소나기";
      		PTYS="2";
      	}
        
		//온도 반올림을 위해 따로 담음
        String obsrValue2=va.elementAt(1);
        double obsrValuedou=Double.parseDouble(obsrValue2);
        //out.println("온도 : "+Math.round(obsrValuedou)+"℃");
        
        //out.println("<br>");
        
        //풍향 반올림을 위해 따로 담음
        String WSD =va.elementAt(2);
        double WSDdou=Double.parseDouble(WSD);
        //out.println("풍속 : "+Math.round(WSDdou)+"m/s <br>");
        
      	
      	//out.println("강수 : "+PTY);
%>


<%
		try{
        	 
          /*요청정보입력
           * 아래와 같은 정보들은 사용자 가이드를 확인하여 찾아주시면 됩니다.
           * 위도 경도는 엑셀파일 안에 있습니다.
           * */
           
            //자신이 조회를 원하는 지역의 경도와 위도를 입력해주세요
            String nx = latitude;  //경도
            String ny = longitude;   //위도
            String baseDate = today; // 자신이 조회하고싶은 날짜를 입력해주세요
            //동네 예보 주기 02,05,08,11,14,17,20,23
            String hor2=horsA.format(new java.util.Date());
            String hor2Array = hor2.substring(0, 1);
            String hor2Array2 = hor2.substring(1, 2);
            
            int horIntFirst=Integer.parseInt(hor2Array);
            int horIntLast=Integer.parseInt(hor2Array2);
            /*
            if(horIntFirst==0){
            	if(horIntLast>=0&&horIntLast<=1){
            		Calendar day = Calendar.getInstance();
            		day.add(Calendar.DATE , -1);
            		String beforeDate = new java.text.SimpleDateFormat("yyyyMMdd").format(day.getTime());
            		baseDate=beforeDate;
            		horsOne="2300";
            	}
            	
	            if(horIntLast>=2&&horIntLast<5){
	            	horsOne="0200";
	            }else if(horIntLast>=5&&horIntLast<8){
	            	horsOne="0500";
	            }else if(horIntLast>=8&&horIntLast<=9){
	            	horsOne="0800";
	            }
            }else if(horIntFirst==1){
            	if(horIntLast==0&&horIntFirst==1){
            		horsOne="0800";
            	}
            	
            	if(horIntLast>=1&&horIntLast<4){
	            	horsOne="1100";
	            }else if(horIntLast>=4&&horIntLast<7){
	            	horsOne="1400";
	            }else if(horIntLast>=7&&horIntLast<=9){
	            	horsOne="1700";
	            }
            }else if(horIntFirst==2){
            	if(horIntLast==0&&horIntFirst==2){
            		horsOne="1700";
            	}else if(horIntLast>=0&&horIntLast<3){
	            	horsOne="2000";
	            }else if(horIntLast>=3){
	            	horsOne="2300";
	            }
            }*/
            //현재 30분 주기 발표 만약 동네예보 사용시 주석
            if(horIntFirst==0){
            	if(horIntLast>=0&&horIntLast<=1){
            		Calendar day = Calendar.getInstance();
            		day.add(Calendar.DATE , -1);
            		String beforeDate = new java.text.SimpleDateFormat("yyyyMMdd").format(day.getTime());
            		baseDate=beforeDate;
            		horsOne="2330";
            	}
            }
            
            String baseTime = horsOne; //자신이 조회하고싶은 시간대를 입력해주세요
            // 서비스 인증키입니다. 공공데이터포털에서 제공해준 인증키를 넣어주시면 됩니다.
            String serviceKey = "NKr1%2FQfLQhOlZANC9dE%2F5qtVeM1Ayu4zRLb7jkfRvcWut0tiysJKT2f%2Frihd9gvEZZ7%2Bm5huttBoo0WZMLAruA%3D%3D";
             
            // 정보를 모아서 URL정보를 만들면됩니다. 맨 마지막 "&_type=json"에 따라 반환 데이터의 형태가 정해집니다.
            //String urlStr = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastSpaceData?" 동네 예보시 위의 horsOne 시간 사용 
            		String urlStr = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastTimeData?"
            		+ "serviceKey=" + serviceKey + "&base_date=" + baseDate + "&base_time=" + baseTime
                + "&nx="+ nx + "&ny=" + ny +"&numOfRows=13"+ "&_type=json";
            URL url = new URL(urlStr); // 위 urlStr을 이용해서 URL 객체를 만들어줍니다.
            BufferedReader bf;
            String line = "";
            String result="";
 
            //날씨 정보를 받아옵니다.
            bf = new BufferedReader(new InputStreamReader(url.openStream()));
 
            //버퍼에 있는 정보를 하나의 문자열로 변환.
            while((line=bf.readLine())!=null){
                result=result.concat(line);
               //out.println(result);  // 받아온 데이터를 확인해봅니다.
            }
            
             // Json parser를 만들어 만들어진 문자열 데이터를 객체화 합니다.
        JSONParser parser = new JSONParser();
        JSONObject obj = (JSONObject) parser.parse(result);
         
        // Top레벨 단계인 response 키를 가지고 데이터를 파싱합니다.
        JSONObject parse_response = (JSONObject) obj.get("response");
        // response 로 부터 body 찾아옵니다.
        JSONObject parse_body = (JSONObject) parse_response.get("body");
        // body 로 부터 items 받아옵니다.
        JSONObject parse_items = (JSONObject) parse_body.get("items");
         
        // items로 부터 itemlist 를 받아오기 itemlist : 뒤에 [ 로 시작하므로 jsonarray이다
        JSONArray parse_item = (JSONArray) parse_items.get("item");
         
        String category;
        String obsrValue;
        double nY ;
        JSONObject weather; // parse_item은 배열형태이기 때문에 하나씩 데이터를 하나씩 가져올때 사용합니다.
 		
        for(int i=0 ; i<parse_item.size(); i++)
        {
          weather = (JSONObject) parse_item.get(i);
          //String base_Date = (String)weather.get("baseDate");
          //String fcst_Time = (String)weather.get("fcstDate");
          //double fcst_Value = ((Long)weather.get("fcstValue")).doubleValue(); //실수로된 값과 정수로된 값이 둘다 있어서 실수로 통일했습니다.
          obsrValue = (String) weather.get("fcstValue").toString();
          category = (String)weather.get("category");
          

          
          if(category.equals("SKY")){
        	va.addElement(obsrValue);
          }
          
        }
            bf.close();
        }catch(Exception e){
            System.out.println(e.getMessage());
        }

		//날씨 (맑음 흐림)
		String SKY =va.elementAt(3);
		String sk="";
		if(SKY.equals("1")){
			SKY="맑음";
			sk="1";
		}else if(SKY.equals("2")){
			SKY="구름조금";
			sk="2";
		}else if(SKY.equals("3")){
			SKY="구름많음";
			sk="3";
		}else if(SKY.equals("4")){
			SKY="흐림";
			sk="4";
		}
		//out.println("날씨 : "+SKY);
        
%>
<div class="wr-content <%=timeBG%> weatherBG<%=sk%> PTYS<%=PTYS%>">
	<div class="x-xuser-wticon x-xuser-wticon<%=sk%> <%=timeBG%><%=sk%>">
	
	</div>
	<div class="x-xuser-wtinfo">
	<div class="wtarea"></div>
	<div class="region" style="display:none;"></div>
	  <div class="wt-do">
	    <span><%=Math.round(obsrValuedou)%></span><span style="margin-left:2px;">℃</span>
	  </div>
	  <div class="wtsky">
	  	<%
	  		if(PTY.equals("없음")){
	  	%>
	    <%=SKY%>
	    <%
	  		}else if(PTY.equals("비")){
	  			out.println("비");
	  		}else if(PTY.equals("비/눈")){
	  			out.println("비/눈");
	  		}else if(PTY.equals("눈")){
	  			out.println("눈");
	  		}
	    %>
	    
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

