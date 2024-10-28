<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="이동한 페이지 - 이전 페이지에서 사용한 값을 사용할 수 없다."
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
	<%-- <%= name %> 이전 페이지에서 존재하는 변수를 사용할 수 있는 방법이 없다.
	scriptlet - 지역변수 -> 사용불가
	declaration - 인스턴스 변수 -> 개발자가 이전페이지의 객체를 사용할 수 없으므로 -> 사용불가
				- static 변수 -> 개발자가 이전페이지의 클래스명을 사용할 수 없으므로 -> 사용불가
	--%>
	작업페이지입니다.
</div>
</body>
</html>