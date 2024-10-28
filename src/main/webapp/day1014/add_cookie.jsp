<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="쿠키 생성하여 접속자에게 심는 일"
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
	//1. 쿠키 생성
	Cookie cookieName = new Cookie("name", "이일환");
	//Cookie cookieAge = new Cookie("age", 25); // 문자열만 받는다
	Cookie cookieAge = new Cookie("age", "25");
	//2. 생존시간 설정
	cookieName.setMaxAge(60*60*1);// 초*분*시*일
	cookieAge.setMaxAge(10);// 초*분*시*일 // 쿠키가 파기되는 시간
	//3. 쿠키 심기(출력스트림 사용)
	response.addCookie(cookieName);
	response.addCookie(cookieAge);
	%>
	<h2>쿠키 심기 완료</h2>
	<a href="read_cookie.jsp">읽기</a>
</div>
</body>
</html>