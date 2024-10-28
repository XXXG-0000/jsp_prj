<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="데이터 처리 결과를 받아와서 화면을 구현하여 응답되는 페이지"
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
	$(".nav-link").click(function(evt){
		chgActive();
	}); // click
}); // ready

function chgActive(){
	
}

</script>
</head>
<body>
<div id="wrap">
<!-- HTML 영역 => HTML 태그 작성, CSS 정의한 디자인 적용, JS에서 동적인 디자인 생성 보여주는 일, JS에서 HTML Form Control에 입력된 값을 
	유효성 검증 수행 => onxxx속성 사용 -->
<%
// 업무처리한 결과를 받아와서 화면을 구현하는 일
String name = (String)request.getAttribute("name");
List<String> list = (List<String>)request.getAttribute("data");

//forward_b.jsp에서 forward_a.sjp의 parameter를 받을 수 있는 이유는
// forward()의 매겨변수로 request를 전달해주기 때문에 가능하다
String paramSelectNum = request.getParameter("selectNum");
int selectNum = paramSelectNum == null? 0:Integer.parseInt(paramSelectNum);
%>
<h3><%= name %></h3>
<ul class="nav nav-underline">
<% 
for(int i = 0; i < list.size(); i++){ %>
  <li class="nav-item">
    <a class="nav-link<%= i==selectNum? " active":"" %>" aria-current="page" href="forward_a.jsp?selectNum=<%= i %>"><%= list.get(i)%></a>
  </li>
<% }// end for %>
</ul>
</div>
</body>
</html>