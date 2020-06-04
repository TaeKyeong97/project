<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="net.chat_test.Chat" %>
<%@ page import="net.chat_test.ChatDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="My" class="net.chat_test.Chat" scope="page"/>

<%
	String msg =null;
	if(request.getParameter("msgs") != null){
		msg = request.getParameter("msgs");
		My.setChatContent(msg);
	}
	out.println(My.getChatContent());
	String toID =null;
	if(request.getParameter("toID") != null){
		toID=request.getParameter("toID");
	}
	String dataID=null;
	if(request.getParameter("dataID") != null){
		dataID=request.getParameter("dataID");
	}
	//DB 연결	
	String userID =null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null){
		PrintWriter script =response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 하세요.')");
		script.println("location.href = '../login/login.jsp'");
		script.println("</script>");
	}else{
		ChatDAO ch = new ChatDAO();
		int result = ch.submit(userID,msg,toID,dataID);
		if(result == -1){
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기에 실패했습니다. (4096byte)글자 수 초과 또는 서버 에러입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("location.href = '../bbs.jsp?userIDS="+userID+"'");
			script.println("</script>");
		}
	}
%>

</body>
</html>