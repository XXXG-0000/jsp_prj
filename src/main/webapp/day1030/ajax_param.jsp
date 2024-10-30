<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="parameter 연습"
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
		sendData();
	});//click
}); // ready

function sendData() {
	var name=$("#name").val();
	var age=$("#age").val();
	
	if(name.trim() == ""){
		alert("이름은 필수 입력!");
		$("#name").focus();
		return;
	}//end if
	
	if(age.trim() == ""){
		alert("나이는 필수 입력!");
		$("#age").focus();
		return;
	}//end if
	
	//서버로 보낼 데이터 작성
	//1.QueryString 작성
	//var param = "name="+name+"&age="+age;
	
	//2. JSONObject로 작성 (이름이 파라메터명이 됩니다. {이름: 값})
	var param={ na : name, age : age }; //앞: 이름, 뒤: 변수
	
	$.ajax({
		url:"test_param.jsp",
		type:"get",
		data:param,
		dataType:"json",
		error:function(xhr){
			console.log(xhr.status + "에러 발생!");
		},//error
		success:function(jsonObj){
			var inter = jsonObj.interests;
			var msg = jsonObj.msg;
			$("#output").html(msg+"<br>관심사는 "+inter+"입니다.");
			$("#txtOut").val(inter);
		}//success
	});//ajax
	
}//sendData

</script>
</head>
<body>
<div id="wrap">
<!-- HTML 영역 => HTML 태그 작성, CSS 정의한 디자인 적용, JS에서 동적인 디자인 생성 보여주는 일, JS에서 HTML Form Control에 입력된 값을 
	유효성 검증 수행 => onxxx속성 사용 -->
	<div id="output" style="height: 80px"></div>
	<div><input type="text" id="txtOut"></div>
	<label>이름</label>
	<input type="text" name="name" id="name"/>
	<label>나이</label>
	<input type="text" name="age" id="age"/>
	<input type="button" value="전송" class="btn btn-success" id="btn" />
</div>
</body>
</html>