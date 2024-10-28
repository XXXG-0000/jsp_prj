<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
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
	<%-- 객체 생성 --%>
	<%-- page - JSP페이지가 요청될 때마다 객체 생성, 생성된 객체는 해당 JSP에서만 사용(회원가입) --%>
	<%-- request - JSP페이지가 요청될 때마다 객체 생성, 생성된 객체는 해당 JSP와 forward로 이동한 JSP에서 사용 --%>
	<%-- session: 웹 브라우저마다 하나의 객체가 생성, --%>
	<%-- application - 최초 접속자에 의해 단 하ㄴ나의 객체가 생성, 생성된 객체는 모든 jsp에서 사용. 모든 접속자는 하나의 객체를 사용 --%>
	<jsp:useBean id="cVO" class="day1016.CounterVO" scope="application"/>
	<!-- setter 호출 -->
	<jsp:setProperty property="cnt" name="cVO" value="1"/>
	<%
		String cnt = String.valueOf(cVO.getCnt());
	
		for(int i = 0; i < cnt.length(); i++){%>
			<img src="./images/num_<%= cnt.charAt(i) %>.png">
		<% }// end for %>
	
	당신의 이 페이지의 <strong><jsp:getProperty property="cnt" name="cVO"/></strong>번째 방문자입니다.
	
	<a href="usescope2.jsp">이동</a>
<%-- 	<%
	RequestDispatcher rd = request.getRequestDispatcher("usescope2.jsp");	// page에선 넘어가지 않는다.
	rd.forward(request, response);
	%> --%>
</div>
</body>
</html>