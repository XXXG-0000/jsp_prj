<%@page import="day1018.ProductVO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		int num = 20141018;
		pageContext.setAttribute("num", num);
		
		Date date = new Date();
		pageContext.setAttribute("date", date);
		
		ProductVO pVO = new ProductVO(1241,"img2.jpg",1500000,new Date());
		pageContext.setAttribute("pVO", pVO);
	%>
	<c:out value="${ num }"/><br>
	0패턴 <fmt:formatNumber value="${ num }" pattern="000,000,000,000"/><br>
	#패턴 <fmt:formatNumber value="${ num }" pattern="###,###,###,###"/><br>
	<div>
	<fmt:formatDate value="${ date }" pattern="yyyy-MM-dd a HH(hh):mm:ss EEEE"/>
	</div>
	<div>
	<img src="../common/images/${ pVO.img }" style="width: 100px;"/><br>
	가격: <fmt:formatNumber value="${ pVO.price }" pattern="###,###,###"/>원<br>
	발행일: <fmt:formatDate value="${ pVO.date }" pattern="MM-dd-yyyy a HH(hh):mm:ss EEEE"/>
	</div>
</div>
</body>
</html>