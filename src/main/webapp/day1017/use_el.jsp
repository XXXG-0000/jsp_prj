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
	<div>
	<h2>연산자</h2>
	<ul>
	<li>10+17=${ 10+17 }</li>
	<li>10 % 2=${ 10 % 2 } (${ 10 mod 2 })</li>
	<li>10 > 2=${ 10 > 2 } (${ 10 gt 2 })</li>
	<li>10 < 2=${ 10 < 2 } (${ 10 lt 2 })</li>
	<li>10 &gt; 2=${ 10 > 2 } (${ 10 gt 2 })</li>
	<li>10 &lt; 2=${ 10 < 2 } (${ 10 lt 2 })</li>
	<li>10 &ge; 10=${ 10 >= 10 } (${ 10 ge 10 })</li>
	<li>10 &le; 10=${ 10 <= 10 } (${ 10 le 10 })</li>
	<li>10 == 10=${ 10 == 10 } (${ 10 eq 10 })</li>
	<li>10 > 2 && 10 < 11=${ 10 > 2 && 10 < 11 } (${ 10 gt 2 and 10 lt 11 })</li>
	<li>10 > 2 || 10 < 11=${ 10 > 2 || 10 < 11 } (${ 10 gt 2 or 10 lt 11 })</li>
	<li>10은 ${ 10 % 2 == 0?"짝수":'홀수' } (${ 10 mod 2 eq 0?'짝수':"홀수" })</li>
	</ul>
	</div>
</div>
</body>
</html>