<%@page import="day1016.TestVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="useBean 액션 태그()"
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

</style>
<script type="text/javascript">
/* JS 영역 => JS 코드 작성 */
$(function(){
	
}); // ready

</script>
</head>
<body>
<div id="wrap">
<!-- HTML 영역 => HTML 태그 작성, CSS 정의한 디자인 적용, JS에서 동적인 디자인 생성 보여주는 일, JS에서 HTML Form Control에 입력된 값을 
	유효성 검증 수행 => onxxx속성 사용 -->
	<%
	//1. 생성
	TestVO tVO = new TestVO();
	//2. scope 객체에 할당
	pageContext.setAttribute("tVO",tVO);
	//3.setter method에 값 할당
	tVO.setName("김현우");
	tVO.setAge(20);
	%>
	이름: <%= tVO.getName() %><br>
	나이: <%= tVO.getAge() %><br>
	
	<%
	//scope 객체에 저장된 값 얻기
	// casting 필요
	TestVO tVO2 = (TestVO)pageContext.getAttribute("tVO"); 
	%>
	이름: <%= tVO2.getName() %><br>
	나이: <%= tVO2.getAge() %><br>
	<br>
	<h2>useBean 표준액션 사용</h2>
	<!-- 객체화 + scope에 할당 -->
	<jsp:useBean id="tVO3" class="day1016.TestVO" scope="page"/>
	<!-- setter method 호출 값 할당 -->
	<jsp:setProperty property="name" name="tVO3" value="이일환"/>
	<jsp:setProperty property="age" name="tVO3" value="25"/>
	
	<!-- getter method 호출해 웹 브라우저 출력 -->
	이름: <jsp:getProperty property="name" name="tVO3"/><br>
	나이: <jsp:getProperty property="age" name="tVO3"/><br>
	
	<%
		//<jsp:sueBean id=는 객체명, 자바코드로 직접 접근해 사용 가능
		tVO3.setName("이인혁");
		tVO3.setAge(30);
	%>
	이름: <%= tVO3.getName() %><br>
	나이: <%= tVO3.getAge() %><br>
	
</div>
</body>
</html>