<%@page import="kr.co.sist.chipher.DataDecryption"%>
<%@page import="kr.co.sist.chipher.DataEncryption"%>
<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@page import="java.security.MessageDigest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="메시지 암호화 변환"
    %>
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
	<%
		String plainText = "test1234~";
	// 일방향 Hash를 생성할 수 있는 객체 얻기
	MessageDigest md = MessageDigest.getInstance("MD5");
	// 일반 문자열을 일방향 Hash 변환
	md.update(plainText.getBytes());
	//사람아 일아볼 수 있는 문자열로 encoding
	Base64 b = new Base64();
	String mdTxt = new String(b.encode( md.digest() ));
	%>
	원본 문자열: <%= plainText %><br>
	encoding 되지 않는 Hash값: <%= new String( md.digest() ) %>
	8859_1로 encoding된 Hash값: <%= mdTxt %><br>
	<%
	String mdTxt2 = DataEncryption.messageDigest("MD5", plainText);
	%>
	<%= mdTxt2 %>
	<br>
	<%
	//양방향 암호화
	String email = "test@test.com";
	String key = "abcdef0123456789";
	DataEncryption de = new DataEncryption(key);
	String cipherTxt = de.encrypt(email);
	DataDecryption dd = new DataDecryption(key);
	String plainTxt = dd.decrypt(cipherTxt);
	%>
	원본 이메일: <%= email %><br>
	암호화된 이메일: <%= cipherTxt %><br>
	복호화 이메일: <%= plainTxt %><br>
	
</div>
</body>
</html>