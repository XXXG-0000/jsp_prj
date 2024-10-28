<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="회원 가입 폼의 입력 정보 받기"
    %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://192.168.10.212/jsp_prj/common/css/main_20240911.css">

<!-- bootstrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>


<style type="text/css">
/* CSS영역 => CSS 디자인 코드 작성 */
.id { color: #0000FF }
</style>
<script type="text/javascript">
/* JS 영역 => JS 코드 작성 */
$(function(){
	
}); // ready

</script>
</head>
<body>
<div id="wrap">
<!-- 1. VO객체 생성 -->
<jsp:useBean id="jfVO" class="day1016.JoinFormVO" scope="page"></jsp:useBean>

	<!-- 2. setter method 호출
	(설정시 web parameter명과 VO의 instance variable명이 일치하는 setter method 호출)
	 -->
	 
	 <jsp:setProperty property="*" name="jfVO"/>
	 
	 <h2><strong><span class="id"><jsp:getProperty property="id" name="jfVO"/></span></strong> 회원님 가입을 축하드립니다.</h2>
	<hr>
	<h3>입력정보</h3>
	비밀번호: <jsp:getProperty property="pass" name="jfVO"/><br>
	이름: <jsp:getProperty property="name" name="jfVO"/><br>
	생일: <jsp:getProperty property="birth" name="jfVO"/><br>
	연락처: <%
		String tel = jfVO.getTell();
		if(tel == null){
			out.println("<strong>입력하신 연락처가 없습니다.</strong><br>");
		} else { %>
	<jsp:getProperty property="tell" name="jfVO"/><br>
	<% }// end else %>
	휴대폰: <jsp:getProperty property="cellphone" name="jfVO"/><br>
	이메일: <jsp:getProperty property="email" name="jfVO"/>@<jsp:getProperty property="email2" name="jfVO"/><br>
	성별: <jsp:getProperty property="gender" name="jfVO"/><br>
	관심언어:<%
	String[] lang = jfVO.getLang();
	if(lang == null){
		out.println("<strong>관심 언어가 없습니다.</strong><br>");
	} else {
		for(String temp : lang){
			out.print(temp);
			out.println("<br>");
		}// end for
	}// end else
	%>
	소재지: <jsp:getProperty property="location" name="jfVO"/><br>
	우편번호: <jsp:getProperty property="zipcode" name="jfVO"/><br>
	주소: <jsp:getProperty property="addr1" name="jfVO"/> <jsp:getProperty property="addr2" name="jfVO"/><br>
</div>
</body>
</html>