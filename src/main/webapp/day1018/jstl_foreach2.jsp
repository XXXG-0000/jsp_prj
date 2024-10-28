<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="jstl forEach 반복문 2"
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
		String[] arr={"Java SE","DBMS","JDBC","HTML"};
		List<String> list = new ArrayList<String>();
		list.add("JSP tag's");
		list.add("내장객체");
		list.add("표준액션태그");
		list.add("EL");
		list.add("JSTL");
		
		// 배열과 list를 EL에서 사용하기 위해 scope 객체에 저장
		pageContext.setAttribute("arrSubject", arr);
		pageContext.setAttribute("listJSP", list);
	%>
<%-- 	${ arrSubject }<br>
	${ listJSP } --%>
<%-- 	<c:forEach var="subject" items="${ arrSubject }">	<!-- begin 쓸 필요 없음 -->
		<c:out value="${ subject }"/>
	</c:forEach> --%>
	<c:forEach var="subject" items="${ arrSubject }" varStatus="i">
		<%-- <c:set var="i" value="${i+1}"/> --%>
		<c:out value="${i.count}"/>. <input type="text" value="${ subject }"${ i.first?" readonly='readonly'":"" }${ i.count eq 2?" autofocus='autofocus'":""}/><br>
	</c:forEach>
	
	<!-- list의 값을 체크박스로 만들어서 출력 -->
	<c:forEach var="element" items="${ listJSP }" varStatus="i">
		<%-- <c:set var="i" value="${i+1}"/> --%>
		<c:out value="${i.count}"/>. <input type="checkbox" class="list" value="${ element }"/> <c:out value="${ element }"/>
	</c:forEach>
</div>
</body>
</html>