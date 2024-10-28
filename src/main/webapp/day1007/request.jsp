<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<% 
String[] blockIp={"192.168.10.213","192.168.10.218","192.168.10.216","192.168.10.215","192.168.10.222", "192.168.10.225", "192.168.10.229", "192.168.10.230"};

String connectIP = request.getRemoteAddr();

for(String ip : blockIp) {
	if(ip.equals(connectIP)){
		response.sendRedirect("https://www.police.go.kr/index.do");
		return;
	}
}
%>
<div id="wrap">
<!-- HTML 영역 => HTML 태그 작성, CSS 정의한 디자인 적용, JS에서 동적인 디자인 생성 보여주는 일, JS에서 HTML Form Control에 입력된 값을 
	유효성 검증 수행 => onxxx속성 사용 -->
	<h2>request(javax.servlet.HttpRequest) 내장객체 사용</h2>
	<ul>
		<li>요청방식: <%= request.getMethod() %></li>
		<li>요청URL: <%= request.getRequestURL() %></li>
		<li>요청 protocol: <%= request.getProtocol() %></li>
		<li>요청 서버명: <%= request.getServerName() %></li>
		<li>요청 서버포트: <%= request.getServerPort() %></li>
		<li>요청 URI: <%= request.getRequestURI() %></li>
		<li>요청 파일 경로 얻기: <%= request.getServletPath() %></li>
		<li>접속자 IP address: <%= request.getRemoteAddr() %></li>
		<!-- localhost인 경우: 0:0:0:0:0:0:0:1 외부 컴퓨터에서 접속하는 경우에는 IPv4의 주소가 나온다. -->
		<li>접속자 Port Number: <%= request.getRemotePort() %></li>
		<li>QueryString: <%= request.getQueryString() %></li>
		<li>web Parameter(요청 값) 얻기(이름 유일): <%= request.getParameter("name") %></li>
		<li>web Parameter(요청 값) 얻기(이름 중복): <%= request.getParameter("age") %></li>
		<li>이름이 중복되는 파라미터들:
  	<% 	
 		String[] ages = request.getParameterValues("age");
		// 최초 요청이거나 age가 존재하지 않는 경우 배열에 null 할당
		if(ages != null){
			for(String age : ages){
				out.print(age);
				out.print(" ");
			}// end for
		}// end if 
		%>
		</li>
		<!-- GET 방식에만 존재(POST방식은 존재하지 않음) -->
	</ul>
	<a href="http://localhost/jsp_prj/day1007/request.jsp?name=kim&age=20&age=21">요청</a>
	<a href="http://192.168.10.222/jsp_prj/day1007/request.jsp?name=kim&age=20&age=21">요청</a>
	<form method="post" action="request.jsp" enctype="application/x-www-form-urlencoded">
	<!-- 자신 페이지를 다시 요청할 때에는 action 속성을 생락할 수 있다. -->
	<input type="hidden" name="name" value="park"/>
	<input type="hidden" name="age" value="25"/>
	<input type="hidden" name="age" value="26"/>
	<button id="btn" class="btn btn-primary btn-sm">POST 방식 요청</button>
	</form>
</div>
</body>
</html>