<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,java.util.*,java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/main.css">
<title>Insert title here</title>
<script type="text/javascript">

    var openWin;
	var title;
	var totals;
    function openChild()
    {
    	title=document.getElementsByClassName("title")[0].value;
    	totals=document.getElementsByClassName("totals")[0].innerHTML;
        // window.name = "부모창 이름"; 
        window.name = "parentForm";
        // window.open("open할 window", "자식창 이름", "팝업창 옵션");
        openWin = window.open("Approval.jsp?title="+title+"&&total="+totals,
                "childForm", "width=426, height=550, resizable = no, scrollbars = no");    
    }
</script>

<SCRIPT language="javascript">
var name;
var tt=null;
function check(name){
	tt=document.querySelector('input[name="Pmethod"]:checked').value;
if(typeof name!=="undefined"){
	document.pay.submit();
 }
if(tt==1||tt==2){
  document.pay.submit();
}
with(document.pay){
  if(tt==3){
		openChild();
		return false;
  }else{
	  return true;
	  document.pay.submit();
  }
 }
}
</SCRIPT> 
</head>
<body>
<input type="hidden" id="p_id">
<form action="payment_press.jsp" name="pay" method="post">
<div class="x-pay-wrap">
      <div class="x-p-head-con"></div>
      <div class="x-p-head">
        <div class="code"></div>
        <div class="result">
          <span>총 결제 금액</span>
          <span class="totals">100</span>
          <input type="hidden" value="" name="Pay">
        </div>
      </div>
      <div class="x-p-body">
        <div class="p-h">
          <ul class="x-table">
            <li>품명</li>
            <li>수량</li>
            <li>단가</li>
          </ul>
        </div>
        <div class="p-b">
        </div>
        <div class="x-p-b">
          <div class="p-ck-t">결제방식</div>
          <div class="p-ck">
            <input type="radio" name="Pmethod" value="1" id="ck" checked class="tt">
            <label for="ck">카드 결제</label>
            <input type="radio" name="Pmethod" value="2" id="ck2" class="tt">
            <label for="ck2">현금 결제</label>
            <input type="radio" name="Pmethod" value="3" id="ck3" class="tt">
            <label for="ck3">휴대폰 결제</label>
          </div>
        </div>
        <div class="submit">
        <input type="hidden" class="title" name="title" value="test">
        <a href="#" onclick="check()" class="inputButt">결제</a>
          <!-- <input type="submit" name="" value="결제 하기"> -->
        </div>
      </div>
    </div>
   </form>
</body>
</html>