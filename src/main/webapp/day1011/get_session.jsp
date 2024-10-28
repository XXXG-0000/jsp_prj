<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="세션에 설정된 값을 얻는 페이지"
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
	//session은 내장객체이므로 scriptlet이나 expression에서 사용할 수 있다.
	//1. 세션 값 읽기
	String name=(String)session.getAttribute("name");
	Object objAge = session.getAttribute("age");
	
	int age = 0;
	if(objAge != null){
		age = ((Integer)(objAge)).intValue();
	}// end if
	//int age=((Integer)session.getAttribute("age")).intValue();
	//int age=(int)session.getAttribute("age");
	%>
	
	<% if(name == null){ %>
	세션에 값이 존재하지 않습니다.<br>
	<form action = "set_session.jsp">
	<label for="name">이름</label>
	<input type="text" name="name" id="name" /><br>
	<label for="age">나이</label>
	<select name="age" id="id">
	<%for(int i = 20; i < 40; i++){ %>
		<option value="<%= i %>"><%= i %></option>
	<% }// end for %>
	</select>
<button class="btn btn-sm btn-primary">입력</button>
	</form>
	<% } else { %>
	세션에 값이 있습니다.<br>
	<button type="button" class="btn btn-primary">
  		<%= name %>님 안녕하세요?  <span class="badge text-bg-secondary">나이는 <%= age %></span>
	</button>
	  <a href="remove_session.jsp">세션 삭제</a>
	<%}// end if %>
</div>
</body>
</html>