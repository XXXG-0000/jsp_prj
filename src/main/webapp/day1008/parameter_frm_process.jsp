<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="HTML Form Control에 입력값을 받는 일"
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
	<% String method = request.getMethod();
	%>
	<h2><%= method %>방식의 요청</h2>
	<%
	// POST 방식일 때만 동작: 입력스트림의 모든 charset을 변환
	request.setCharacterEncoding("UTF-8");
	
	// 이름이 유일한 web parameter 받기(request 내장 객체 사용)
	// parameter_frm_process.jsp?text=ff&pass=f&chk=on&hid=숨김값&sel=JDBC&ta=ff
	String text = request.getParameter("text");// <input type="text">
	String pass = request.getParameter("pass");// <input type="password">
	String chk = request.getParameter("chk");// <input type="checkbox">
	String hidden = request.getParameter("hid");// <input type="hidden">
	String sel = request.getParameter("sel");// <select>
	String ta = request.getParameter("ta");// <textarea>
	// 업무로직, 유효성 검증
	// POST 방식일 때 한글 변환
/* 	if(method.equals("POST")){
		//String class를 사용한 변환(문자열을 byte[]로 쪼개서 인코딩 수행)
		text = new String( text.getBytes("8859_1"), "UTF-8" );
		//URLEncoder, URLDecoder
		hidden = URLDecoder.decode(URLEncoder.encode(hidden, "8859_1"), "UTF-8");
		sel = new String( sel.getBytes("8859_1"), "UTF-8" );
	} */
// 사용빈도 저조
	%>
<ul>
	<li>입력값</li>
	<li>text: <%= text %></li>
	<li>password: <%= pass %></li>
	<li>checkbox: <%= chk %></li>
	<li>hidden: <%= hidden %></li>
	<li>select: <%= sel %></li>
	<li>textarea: <%= ta %></li>
</ul>
<input type="text" value="<%= text %>"/>
</div>
</body>
</html>