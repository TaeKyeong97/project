<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>구매 목록</title>
    <link rel="stylesheet" type="text/css" href="css/user-p-main.css">
    <link rel="stylesheet" href="css/admin-p-main2.css">
    <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
  	<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
  	<style>
  		.admin_pjList-table tr{padding:14px 16px;}
  		.admin_pjList-table td:nth-child(2){width:42%;}
  		.admin_pjList-table td{width:26%;}
  	</style>
  </head>
  <body>
    <%@include file="head.jsp" %>
    <%@include file="nav.jsp" %>
<main>
	<section>
        <article class="">
          <table class="admin_pjList-table">
            <tr>
              <td>번호</td>
              <td>프로젝트명</td>
              <td>구분</td>
              <td>구매가격</td>
              <td>사용일</td>
            </tr>
            <c:forEach var="buyList" items="${buyList}" varStatus="status">
            <tr>
              <td>${buyList.buy_no}</td>
              <td>${buyList.pj_title}</td>
              <td>--</td>
              <td>\ ${buyList.buy_price}</td>
              <td>${buyList.buy_date} ~ ${buyList.buy_useDate}</td>
            </tr>
            </c:forEach>
          </table>
        </article>    
      </section>
</main>
</body>
</html>