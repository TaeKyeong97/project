<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Project.action.ProjectRegistService,java.util.Date,java.text.SimpleDateFormat,java.io.*,java.util.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	//시간생성
	Date now =new Date();
	SimpleDateFormat formatDate=new SimpleDateFormat("yyyyMMdd");
	String date=formatDate.format(now.getTime());
	
	
	//파일업로드 준비
	System.out.println(now);
	String realFolder="";
	String folder="/upload/"+date;
	String enctype="utf-8";
	int maxSize=1024*1024*5;
	
	ServletContext context=getServletContext();
	realFolder=context.getRealPath(folder);
	//out.println(realFolder);
	//오늘 날짜 폴더생성
	File file=new File(realFolder);
	if(!file.exists()){//폴더가 없으면 생성
		file.mkdirs();
	}
	//업로드
	MultipartRequest multi=null;
	try{
		multi=new MultipartRequest(request,realFolder,maxSize,enctype,new DefaultFileRenamePolicy());
	}catch(Exception e){
		e.printStackTrace();
	}
	String EM_id=multi.getParameter("EM_id");
	String EM_pw=multi.getParameter("EM_pw");
	String year=multi.getParameter("year");
	String month=multi.getParameter("month");
	String day=multi.getParameter("day");
	String EM_bir=year+"-"+month+"-"+day;
	String EM_email=multi.getParameter("EM_email");
	String document=multi.getParameter("document");
	
	out.println(EM_id);
		
	ProjectRegistService prs=new ProjectRegistService();
/*
	prs.setInsertMember(m);
	*/
%>
</body>
</html>