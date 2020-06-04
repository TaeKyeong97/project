<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*, java.text.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String mem_id =(String) session.getValue("member_id");

java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
String today = formatter.format(new java.util.Date());

String Pmethod = request.getParameter("Pmethod");
String title[]=request.getParameterValues("title");
String supply[]=request.getParameterValues("supply");
String pay=request.getParameter("Pay");
int cd=0;
for(int c=0;c<supply.length;c++){
	cd+=Integer.parseInt(supply[c]);
}
//String pay=request.getParameter("pay");
//String Pbreak = title[0]+"("+title.length+")";
String Pbreak =title[0]+" 외("+Integer.toString(cd-1)+")";

	Connection conn = null;
	PreparedStatement ps= null;
	ResultSet rs = null;
	String sql =null;
	String url="jdbc:mysql://localhost:3306/member";
	int id=0;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(url,"root","1111");		
		sql="insert into pay(Pno,Pmethod,Pbreak,Pay,Pshop,Pstate,date,Puser) values(?,?,?,?,?,?,NOW(),?)";
		ps=conn.prepareStatement(sql);
		ps.setString(1,today);
		ps.setString(2,Pmethod);//주문방식
		ps.setString(3,Pbreak);//주문내역
		ps.setString(4,pay);//결재금액
		ps.setString(5,"안성점");//매장
		ps.setString(6,"1");//주문 상태 기본(1 준비중 2 배송중 3배달완료)
		ps.setString(7,mem_id);
		ps.executeUpdate();
		
		ps.close();
		conn.close();
	}catch(SQLException e){
		out.println(e.getMessage());
	}
	
	
String sessio[]= session.getValueNames();
for(int ce=0;ce<sessio.length;ce++){
	if(sessio[ce]=="member_id"||sessio[ce]=="member_name"||sessio[ce]=="eve"){
	}else{
		session=request.getSession(false);
		session.removeAttribute(sessio[ce]);
	}
}
response.sendRedirect("../index.jsp");
%>
</body>
</html>