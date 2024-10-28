<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="EL 사용"
    isELIgnored="false"
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
	<h2>scope 객체의 사용</h2>
	<%
		String msg = "오늘은 목요일 입니다.";
	%>
	<h3>EL에서는 변수를 직접 접근할 수 없다.</h3>
	EL: ${ msg }<br>
	Expression: <%= msg %><br>
	<%
	//EL에서 변수를 사용하면 변수를 scope 객체에 젖아하고, scope 객체에 저장된 이름을 사용하여 변수를 사용
	
	// 1. scope 객체에 저장
	pageContext.setAttribute("m", msg);
	
	%>
	2. EL에서 scope객체를 사용한 접근: <strong>${ pageScope.m }</strong>
	${ m }
	
	<%
		pageContext.setAttribute("pMsg", "page 메시지");
		request.setAttribute("rMsg", "request 메시지");
		session.setAttribute("sMsg", "session 메시지");
		application.setAttribute("aMsg", "application 메시지");
	%>
	scope 객체를 사용한 접근<br>
	pageScope: ${ pageScope.pMsg }( ${ pMsg } )<br>
	request: ${ requestScope.rMsg }( ${ rMsg } )<br>
	session: ${ sessionScope.sMsg }( ${ sMsg } )<br>
	application: ${ applicationScope.aMsg }( ${ aMsg } )<br>
	<%
	pageContext.setAttribute("test", "page 메시지");
	request.setAttribute("test", "request 메시지");
	session.setAttribute("test", "session 메시지");
	application.setAttribute("test", "application 메시지");
	%>
	scope 객체에 같은 이름이 존재<br>
	pageScope: ${ pageScope.pMsg }( ${ test } )<br>
	request: ${ requestScope.rMsg }( ${ test } )<br>
	session: ${ sessionScope.sMsg }( ${ test } )<br>
	application: ${ applicationScope.aMsg }( ${ test } )<br>
</div>
</body>
</html>