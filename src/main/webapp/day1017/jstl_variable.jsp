<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSTL 변수의 사용"
    %>
    
<!-- 1. 지시자 선언 -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<!-- 2. Tag Lib에서 제공하는 태그를 사용 -->
	<!-- 변수 선언 -->
	
	<c:set var="msg" value="오늘은 목요일 입니다."/>
	<c:set var="day" value="17"/>
	
	<!-- 출력 => EL -->
	<h2>변수 출력</h2>
	${ msg }<br>
	<c:out value="msg"/><br>
	<c:out value="${ msg }"/><br>
	<c:out value="${ day }"/>일<br>
	<c:out value="${ day+1 }"/>일<br><!-- ++ 지원 X -->
	
	<!-- 변수 삭제 -->
	<h2>변수 삭제 후 출력</h2>
	<c:remove var="msg"/>
	
	<!-- 삭제 후 변수를 출력하면 아무 것도 출력하지 않는다 -->
	msg: <c:out value="${ msg }"/><br>
	day: <c:out value="${ day }"/><br>
	
	<!-- 태그 출력 -->
	<c:set var="tag" value="오늘은 <strong>목요일</strong> 입니다."/>
	EL : ${ tag }<br>
	<!-- c태그 안에서는 출력 X => escapeXml="false" 설정 -->
	<c:out value="${ tag }" escapeXml="false"></c:out><br>
	
	<c:set var="name" value="이인혁"/>
	<!-- 사용자에게 노출되지 않는 것은 c:out을 쓰지 않는 것이 일반적 -->
	<input type="checkbox" value="${ name }" /><c:out value="${ name }"/>
	
</div>
</body>
</html>