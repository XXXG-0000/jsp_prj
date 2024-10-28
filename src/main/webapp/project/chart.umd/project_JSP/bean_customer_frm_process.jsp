<%@page import="project.customerVO"%>
<%@page import="java.lang.foreign.SymbolLookup"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link  rel ="shorcut icon" href="http://192.168.10.211/jsp_prj/common/images/favicon.ico"/>
<link rel="stylesheet" type="text/css" href="http://192.168.10.211/jsp_prj/common/css/main_20240911.css">
<!-- bootstrap CDN 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<style type="text/css">
</style>
<script type="text/javascript">
$(function(){
	
});//ready
</script>
</head>
<body>
<div id="wrap">
<% request.setCharacterEncoding("UTF-8"); %>
	<!--1. VO객체를 생성  -->
	<jsp:useBean id="fcVO" class="project.customerVO" scope="page"/>
	<!--2. setter method 호출 ( * 설정하면 web parameter명과 VO의 instance variable명이 일치하는
			setter method를 자동으로 호출해준다.)   -->
	<jsp:setProperty property="*" name="fcVO"/>
	
	<h2>입력 값</h2>
	<ul>
	<li>아이디 : <jsp:getProperty property="cus_id" name="fcVO"/></li>
	<li>비밀번호 : <jsp:getProperty property="cus_pass" name="fcVO"/></li>
	<li>이름 : <jsp:getProperty property="nickname" name="fcVO"/></li>
	<li>휴대폰 : <jsp:getProperty property="phone" name="fcVO"/></li>
	<li>이메일 : <jsp:getProperty property="email" name="fcVO"/></li>
	</li>
	</ul>
</div>
</body>
</html>