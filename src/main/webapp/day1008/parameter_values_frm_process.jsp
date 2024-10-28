<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="이름이 중복되는 HTML Form Control 값 받기"
    %>
<%//POST방식일 때 한글 처리
	request.setCharacterEncoding("UTF-8");
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
<%-- <% if(request.getMethod().equals("GET")){ %>
	span { color: #0000FF }
<% } else { %>
	span { color: #FF0000 }
<% } %>
 --%>
.blue {color: #0000FF}	
.red {color: #FF0000}	

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
String css = "blue";
if(method.equals("POST")){
	css = "red";
}
%>

<h2><span class="<%= css %>"><%= method %></span> 방식의 요청</h2>
<%
// <input type="radio"는 그룹으로 묶여 하나의 값이 전달된다 => request.getParameter
String gender = request.getParameter("gender");	// gender

// <input type="checkbox"는 그룹으로 묶이지만 다수 선택이 가능하다 => request.getParameterValues
String[] hobbies = request.getParameterValues("hobby");
%>

성별: <%= gender %><br/>
취미: 
<ul>
<%	if(hobbies == null ){ %>
	<li>선택한 취미가 없습니다.</li>
<% } else { 
	for(String selectHobby : hobbies) { %>
		<li><%= selectHobby %></li>
	<% }// end for
	}// end else %>
</ul>
</div>
</body>
</html>