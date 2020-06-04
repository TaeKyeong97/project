<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>OPS : 회원가입</title>
<link rel="stylesheet" href="css/join.css" type="text/css">
<link rel="stylesheet" href="../css/common.css" type="text/css">
</head>
<body>
<form method="post" id="form1" name="writeform" enctype="multipart/form-data" action="joinPro.ops">
<div id="join-wrap">
	<div class="join-header">
		<h1 class="logo"><a href="../index.ops"></a></h1>
	</div>
	<div class="join-content">
		<div class="consent-con">
      <div class="join-check checkID"></div>
			<div class="left join-input-con">
        <input type="text" name="EM_id" class="EM_id" placeholder="아이디">
        <button type="button" name="button" onclick="joinIdCk()">중복확인</button>
      </div>
      <div class="join-check checkPW"></div>
      <div class="left join-input-con">
        <input type="password" name="EM_pw" class="EM_pw" value="" placeholder="비밀번호">
      </div>
      <div class="left join-input-con">
        <input type="text" name="EM_name" value="" placeholder="이름">
      </div>
      <div class="left join-input-con join-temple">
        <input type="number" name="year" value="" placeholder="년도">
        <input type="number" name="month" value="" placeholder="월">
        <input type="number" name="day" value="" placeholder="일">
      </div>
      <div class="join-check checkPHONE"></div>
      <div class="left join-input-con">
        <input type="text" name="EM_phon" placeholder="휴대폰번호">
      </div>
      <div class="left join-input-con">
        <input type="text" name="EM_email" placeholder="이메일">
      </div>
			<div class="left join-input-con" style="height:188px;">
        <div style="padding:9px 0; font-size:15px; font-weight:bold;">프로필</div>
        <input id="document-file" type="file" name="userImg" style="padding:63px 19px;">
      </div>
      <div class="left join-input-con" style="height:188px;">
        <div style="padding:9px 0; font-size:15px; font-weight:bold;">증명서</div>
        <input id="document-file" type="file" name="document" style="padding:63px 19px;">
      </div>
		</div>
	</div>
	<div style="min-height:68px;"><input type="button" class="submit" value="가입하기" onclick="submits(this.form)"></div>
</div>
</form>
<div class="footer">
<a href="#">© OPS Corp.</a>
</div>
<script>
  function submits(form1){
    var EM_id=form1.EM_id.value;
    var EM_pw=form1.EM_pw.value;
    var EM_phon=form1.EM_phon.value;
    if(EM_id==""&&EM_pw==""&&EM_phon==""){
      document.getElementsByClassName("checkID")[0].innerHTML="필수정보입니다.";
      document.getElementsByClassName("checkPW")[0].innerHTML="필수정보입니다.";
      document.getElementsByClassName("checkPHONE")[0].innerHTML="필수정보입니다.";
      form1.EM_id.focus();
      return false;
    }
    if(EM_id==""&&EM_pw==""){
      document.getElementsByClassName("checkID")[0].innerHTML="필수정보입니다.";
      document.getElementsByClassName("checkPW")[0].innerHTML="필수정보입니다.";
      document.getElementsByClassName("checkPHONE")[0].innerHTML="";
      form1.EM_id.focus();
      return false;
    }
    if(EM_pw==""&&EM_phon==""){
      document.getElementsByClassName("checkID")[0].innerHTML="";
      document.getElementsByClassName("checkPW")[0].innerHTML="필수정보입니다.";
      document.getElementsByClassName("checkPHONE")[0].innerHTML="필수정보입니다.";
      form1.EM_pw.focus();
      return false;
    }
    if(EM_id==""&&EM_phon==""){
      document.getElementsByClassName("checkID")[0].innerHTML="필수정보입니다.";
      document.getElementsByClassName("checkPHONE")[0].innerHTML="필수정보입니다.";
      form1.EM_id.focus();
      return false;
    }

    if(EM_id==""){
      document.getElementsByClassName("checkID")[0].innerHTML="필수정보입니다.";
      document.getElementsByClassName("checkPW")[0].innerHTML="";
      document.getElementsByClassName("checkPHONE")[0].innerHTML="";
      form1.EM_id.focus();
      return false;
    }

    if(EM_pw==""){
      document.getElementsByClassName("checkID")[0].innerHTML="";
      document.getElementsByClassName("checkPW")[0].innerHTML="필수정보입니다.";
      document.getElementsByClassName("checkPHONE")[0].innerHTML="";
      form1.EM_pw.focus();
      return false;
    }
    if(EM_phon==""){
      document.getElementsByClassName("checkID")[0].innerHTML="";
      document.getElementsByClassName("checkPW")[0].innerHTML="";
      document.getElementsByClassName("checkPHONE")[0].innerHTML="필수정보입니다.";
      form1.EM_phon.focus();
      return false;
    }

    form1.submit();
  }
</script>

<script>
	function joinIdCk(writeform){
		 var id=document.getElementsByClassName('EM_id')[0];
		 var ids=id.value;
		 window.open("overCK.ops?EM_id="+ids, "네이버새창", "width=370, height=300, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
	
	}
	
	function okes(ok){
		var id=document.getElementsByClassName("EM_id")[0];
		id.value=ok;
	}
	function reCk(){
		var ok=document.getElementsByClassName("ok")[0];
		location.href="overCK.ops?EM_id="+ok.value;
	}
</script>
</body>
</html>

