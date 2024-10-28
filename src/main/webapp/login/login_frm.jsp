<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en" data-bs-theme="auto">
  <head>
  <script src="http://192.168.10.212/jsp_prj/login/js/color-modes.js"></script>
	<meta charset="UTF-8">
    <title>로그인</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

<link href="http://192.168.10.212/jsp_prj/login/css/bootstrap.min.css" rel="stylesheet">

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    
    <!-- Custom styles for this template -->
    <link href="http://192.168.10.212/jsp_prj/login/sign-in.css" rel="stylesheet">
  <script type="text/javascript">
  window.onload=function(){
	  document.getElementById("id").addEventListener("keydown", enterKey);
	  document.getElementById("pass").addEventListener("keydown", enterKey);
	  document.getElementById("btnLogin").addEventListener("click", chkNull);
  } // onload
  
/*   // 아이디 이벤트 처리 코드
  function toPass(evt) {
	  var idData = document.loginFrm.id.value;
	  if(evt.which == 13){ // 엔터를 눌렀을 경우
		  if(idData.trim() == ""){ // 아이디에 값이 없으면 움직이지 않는다.
			  return;
		  } else { // 아이디에 값이 존재하므로 커서를 패스워드로 이동
			  document.loginFrm.pass.focus();		  
		  }		  
	  }
  }
  
  // 패스워드 이벤트 처리 코드
  function toLogIn(evt) {
	  var idData = document.loginFrm.id.value;
	  var passData = document.loginFrm.pass.value;
	  
	  if(evt.which == 13){ // 엔터를 눌렀을 경우
		  if(passData.trim() == ""){	// 비번이 없다면 동작하지 않는다.
			  return;
		  }
		  
		  if(idData.trim() == ""){ // 아이디가 없다면 아이디로 커서 이동
			  document.loginFrm.id.focus();
		  } else { // 아이디와 비번에 값이 존재하므로 alert로 로그인 이동 출력
			  alert("로그인이동!")
		  }		  
	  }
	  
  }
  
  // 로그인 버튼 이벤트 처리 코드
  function loginProcess(evt){
	  var idData = document.loginFrm.id.value;
	  var passData = document.loginFrm.pass.value;
	  
	  if(idData.trim() == ""){ // 아이디가 없으면 아이디로 커서 이동
		  document.loginFrm.id.focus();
	  } else if(passData.trim() == ""){ // 비번이 없으면 비번으로 커서 이동
		  document.loginFrm.pass.focus();
	  } else { // 아이디와 비번이 존재하면 alert로 로그인이동 출력
		  alert("로그인이동!")
	  }
  } */
  
  function enterKey(evt) {
	  if(evt.which == 13){
		  chkNull();
	  }
  }
  
  function chkNull() {
	  var obj = document.loginFrm;
	  var idNode = obj.id;
	  var passNode = obj.pass;
	  
	  if(idNode.value.replaceAll(/ /g, "") == ""){
		  idNode.value=""; // " " 넣는 경우 방지
		  idNode.focus();
		  return;
	  }//end if
	  
	  if(passNode.value.replaceAll(/ /g, "") == ""){
		  passNode.value=""; // " " 넣는 경우 방지
		  passNode.focus();
		  return;
	  }//end if
	  
	  $("#loginFrm").submit(); // submit
  }
  
  
  </script>
  </head>
  <body class="d-flex align-items-center py-4 bg-body-tertiary">
    
    

    
<main class="form-signin w-100 m-auto">
  <form name="loginFrm" id="loginFrm" action="login_frm_process.jsp" method="post">
    <h1 class="h3 mb-3 fw-normal">로그인</h1>

    <div class="form-floating">
      <input type="email" class="form-control" name="id" id="id" placeholder="name@example.com">
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" name="pass" id="pass" placeholder="Password">
    </div>

    <input class="btn btn-primary w-100 py-2" id="btnLogin" type="button" value="로그인"/>
  </form>
</main>
<script src="http://192.168.10.212/jsp_prj/login/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
