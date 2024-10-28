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
	<form action="use_el2.jsp">
	<h2>parameter 받기</h2>
	<input type="text" name="name" placeholder="이름"/><br>
	<input type="text" name="addr" placeholder="주소"/><br>
	<label>취미</label>
	<input type="checkbox" name="hobby" 등산="등산"/>등산<br>
	<input type="checkbox" name="hobby" 등산="낚시"/>낚시<br>
	<input type="checkbox" name="hobby" 등산="독서"/>독서<br>
	<input type="checkbox" name="hobby" 등산="운동"/>운동<br>
	
	<input type="submit" name="btn btn-outline-primary" value="전송"/>
	
	</form>
	<div>
	입력값<br>
	이름: ${ param.name eq '' or param.name eq null ?"이름을 입력":param.name }<br>
	주소: ${ empty param.addr ? "주소를 입력":param.addr }<br>
<!-- 배열은 선택된 갯수만큼 반복해야한다. => JSTL의 <c:forEach >와 함께 사용. -->
	취미: ${ paramValues.hobby[0] }
	${ paramValues.hobby[1] }
	${ paramValues.hobby[2] }
	${ paramValues.hobby[3] }<br>
	</div>
	
	<div>
	<!-- nick이 없다면 아래 링크를 클릭해주세요를 웹 브라우저에 출력, nick이 존재한다면 nick과 age의 설정 값을 웹 브라우저에 출력 -->
	입력값<br>
	nick: ${ empty param.nick ?"아래 링크를 클릭해주세요":param.nick }<br>
	age: ${ empty param.age ? "나이를 입력":param.age }<br>	
	
	</div>
	<div>
	<!-- 요청 링크를 클릭했을 때 nick의 값으로 test를, age를 20으로 설정하여 현재 페이지로 요청하는 URL과 Query String을 작성 -->
	<a href="http://localhost/jsp_prj/day1017/use_el2.jsp?nick=test&age=20">요청</a>
	<a href="use_el2.jsp?nick=test&age=20">요청</a>
	</div>
	<%
	String msg="오늘은 목요일";
	int temp = 0;
	%>
	<!-- EL에서는 변수 직접 출력 불가 => scope 객체에 저장해 출력-->
	${ msg }
	${ temp }
	
</div>
</body>
</html>