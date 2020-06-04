<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String sessio[]= session.getValueNames();
for(int ce=0;ce<sessio.length;ce++){
	if(sessio[ce]=="member_id"||sessio[ce]=="member_name"||sessio[ce]=="eve"){
	}else{
		session=request.getSession(false);
		session.removeAttribute(sessio[ce]);
	}
}
%>
</body>
</html>