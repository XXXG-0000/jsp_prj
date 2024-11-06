<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="ajax로 파싱2 - 5"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	$("#btn").click(function(){
		$.ajax({
			url:"http://localhost/jsp_prj/day1106/parsing_xml2.jsp",
			type:"get",
			dataType:"text",
			error:function(xhr){
				alert(xhr.status);
			},
			success:function(xmlDoc){
				//parsing
				//1. jQuery Object에 xml문서 전달, 파싱할 노드를 찾기
				var msg = "";
				var nameNode = $(xmlDoc).find("msg").each(function(i,msgNode){
					//2. 찾아낸 노드의 parsing(값을 얻기)
					msg=$(msgNode).text();
					sel.options[i+1] = new Option(msg, msg);
				});
			}
		});//ajax
	});//click
}); // ready

</script>
</head>
<body>
<div id="wrap">
<!-- HTML 영역 => HTML 태그 작성, CSS 정의한 디자인 적용, JS에서 동적인 디자인 생성 보여주는 일, JS에서 HTML Form Control에 입력된 값을 
	유효성 검증 수행 => onxxx속성 사용 -->
	<input type="button" value="XML Parsing" class="btn btn-success btn-sm" id="btn"/>
	<br>
	<select id="sel">
	<option value="N/A">메시지 선택</option>
	</select>
</div>
</body>
</html>