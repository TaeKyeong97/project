<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, javax.sql.*, java.io.*, java.net.*" %>
<%@ page import = "javax.xml.parsers.* ,org.w3c.dom.*, javax.xml.xpath.*, org.xml.sax.InputSource" %>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>


<%
String CityName=request.getParameter("CityName");
String region=request.getParameter("region");
try {

    String strUrl = "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnMesureSidoLIst?serviceKey=NKr1%2FQfLQhOlZANC9dE%2F5qtVeM1Ayu4zRLb7jkfRvcWut0tiysJKT2f%2Frihd9gvEZZ7%2Bm5huttBoo0WZMLAruA%3D%3D&numOfRows=17&pageNo=1&sidoName="+region+"&searchCondition=DAILY";
    BufferedReader br = new BufferedReader(new InputStreamReader((new URL(strUrl)).openConnection().getInputStream(),"UTF-8"));
    String strHtml = "";
    String strLine = "";
    while ((strLine = br.readLine()) != null){
        strHtml += strLine;
   }

   br.close();
   
   	
   
	String CityArray[]=strHtml.split(CityName);
	/*
	so2Value 아황산가스
	coValue 일산화탄소 
	o3Value 오존 농도
	no2Value 이산화질소 농도
	pm10Value 미세먼지(PM10) 농도
	pm10Value24 미세먼지(PM10) 24시간예측이동농도
	pm25Value 미세먼지(PM2.5) 농도
	pm25Value24 미세먼지(PM2.5) 24시간예측이동농도
	
	*/
	
	String Citpm10=CityArray[1].trim();	
	String Cita=Citpm10.replaceAll("<(/)?([a-zA-Z0-9]*)(\\s[a-zA-Z0-9]*=[^>]*)?(\\s)*(/)?>", ",").trim();
	String CitArray[]=Cita.split(",");
	//해당 지역의 미세먼지 농도 뽑아옴
	//out.println(CitArray[10]);
	int CitpmInt=Integer.parseInt(CitArray[10]);
	String CitypmString="";
	if(CitpmInt>=0&&CitpmInt<=30){
		CitypmString="좋음";
	}else if(CitpmInt>=31&&CitpmInt<=80){
		CitypmString="보통";
	}else if(CitpmInt>=81&&CitpmInt<=150){
		CitypmString="나쁨";
	}else if(CitpmInt>=151){
		CitypmString="매우 나쁨";
	}else{
		CitypmString="--";
	}
	//미세먼지 상태 뽑음
	out.println(CitypmString);
	
	
} catch(Exception e) {
    out.println(e.getMessage());
}

%>

</body>
</html>