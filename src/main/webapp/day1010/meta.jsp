<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="meta 태그를 사용한 페이지 이동"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="refresh" content="30;http://sist.co.kr"/> <!-- content="-초후;URL" -->
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
	접속하신 서버 주소인 http://test.com은 2024년 11월 01일부터
	<strong>http://sist.co.kr</strong>로 변경됩니다.<br>
	이전 도메인은 추후 사용하실 수 없으며 새로운 도메인으로만 접속하실 수 있습니다.<br>
	30초 후 변경된 도메인으로 자동 연결됩니다.<br>
	바로 이동하시려면 <a href="http://sist.co.kr">여기</a>를 클릭해주세요.
	
</div>
</body>
</html>