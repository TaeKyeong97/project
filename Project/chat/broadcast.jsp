<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="net.chat_test.Chat" %>
<%@ page import="net.chat_test.ChatDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<script src="https://code.jquery.com/jquery-latest.js"></script>
    <title>채팅 서비스</title>
    <link rel="stylesheet" href="chat/css/chat.css">
    <script  src="chat/test.js"></script>
    <style>
    	.chating-wrap .chat-body{background:none;}
    </style>
</head>
<body>
	<div class="chating-wrap">
      <div class="chat-head">
        <h2><a href="#">김태경</a></h2>
        <a href="#">정보</a>
      </div>
      <div class="chat-body">
        <div id="messageWindow" class="chat-content" style="height:306px; background:#474b5f;">
        </div>
        <div class="chat-inp" style="width:360px; height:130px; margin:0;">
          <input type="text" id="inputMessage" name="chatContentValue" class="chat-value-Box" style="margin:0;">
          <input type="submit" value="보내기" onclick="send()" class="chat-subm-btn">
        </div>
      </div>
    </div>   
       

<script type="text/javascript">
        var textareas = document.getElementById("messageWindow");
        var webSocket = new WebSocket('ws://localhost:8080/Project/broadcasting');
        var inputMessage = document.getElementById('inputMessage'); 
        var meaa="${myid}".trim();
        
    webSocket.onerror = function(event) {
      onError(event)
    };
    webSocket.onopen = function(event) {
      onOpen(event)
    };
    webSocket.onmessage = function(event) {
      onMessage(event)
    };
    function onMessage(event) {
    	var now =new Date();
    	var messBuffer=event.data.split("[@user#]");
    	var oppa=messBuffer[1].trim();
    	if(oppa==meaa&&messBuffer[2]=="${param.opp.trim()}"){
    		textareas.innerHTML += "<div class=\"opp\">"
   	    	+"<div class=\"opp-info\">"
   	    	+"<div class=\"opp-img\">"
   	    	+"<img src=\"\" alt=\"\">"
   	    	+"</div>"
   	    	+"<div class=\"opp-name\">"
   	    	+"</div>"
   	    	+"</div>"
   	        +"<div class=\"opp content\">"
   			+ messBuffer[0]
   	        +"</div>"
   	        +"<div class=\"opp-date\">"
   	        + now.getHours()+":"+now.getMinutes()
   	        +"</div>"
   	      	+"</div>";
    	}    	
    	
    }
    function onOpen(event) {
    	//연결성공 메시지
        textareas.innerHTML += "";
    }
    function onError(event) {
      alert(event.data);
    }
    

    
    function send() {
    	var now =new Date();
    	$.ajax({
            url:'broadcastAction.jsp',
            dataType:'json',
            type:'post',
            data:{msgs:$('#inputMessage').val(),toID:'',dataID:'' },
        	success: whenSuccess
        });
    	function whenSuccess(resdata){
            console.log(resdata);
        }
        textareas.innerHTML += "<div class=\"me\">"       	  
	       +"<div class=\"me content\">"
	       + inputMessage.value
	       +"</div>"
	       +"<div class=\"opp-date\" style='float: right; left: auto; right: 10px;'>"
           + now.getHours()+":"+now.getMinutes()
           +"</div>"
	       +"</div>";
	           
        webSocket.send(inputMessage.value+" [@user#]${param.opp}[@user#]${myid}");
        inputMessage.value = "";
		
	} 
    
    document.onkeydown = function (evt) {
    	var now =new Date();
    	
    	var keyCode = evt ? (evt.which ? evt.which : evt.keyCode) : event.keyCode;
    	if (keyCode == 13) {
    		$.ajax({
                url:'broadcastAction.jsp',
                dataType:'json',
                type:'post',
                data:{msgs:$('#inputMessage').val(),toID:'',dataID:''},
            	success: whenSuccess
            });
        	function whenSuccess(resdata){
                console.log(resdata);
            }
        	
        	/*
        	textareas.innerHTML += "<div class=\"my ppo-msg-con0\"><div class=\"wrap\">" 
                //+"<div class=\"inf\">"+
                //"<div class=\"inf-img\"><img src=\"\" alt=\"\"></div>"
                //+"<div>나</div>"
                //+"</div>"
                +
                "<div class=\"msg\">"        
                + inputMessage.value + 
                "</div>"
                +"</div></div>\n";
            */
            textareas.innerHTML += "<div class=\"me\">"
            +"<div class=\"me content\">"
            + inputMessage.value
            +"</div>"
            +"<div class=\"opp-date\" style='float: right; left: auto; right: 10px;'>"
            + now.getHours()+":"+now.getMinutes()
            +"</div>"
          	+"</div>";
                
            webSocket.send(inputMessage.value+" [@user#]${param.opp}[@user#]${myid}");
            inputMessage.value = "";
    	 }
    	
    	//스크롤
    	//var tt= ta-305;
    	//if(tt < height){
        //setTimeout(function() {
        //	$("#messageWindow").scrollTop($("#messageWindow")[0].scrollHeight);
        	//}, 5000);
        //}
    }
	
    
    
  </script>
</body>
</html>