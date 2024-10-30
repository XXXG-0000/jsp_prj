<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
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
	$("#btnTxt").click(function(){
		$.ajax({
			url:"text.txt",
			type:"get",
			dataType:"text",
			error:function(xhr){
				alert(xhr.status + " / " + xhr.statusText);
			},//error
			success:function(data){
				$("#output").html(data);
			}//success
		});//ajax
	});//click
	$("#btnHtml").click(function(){
		$.ajax({
			url:"response_html.html",
			type:"get",
			dataType:"html",
			error:function(xhr){
				alert(xhr.status + " / " + xhr.statusText);
			},//error
			success:function(data){
				$("#output").html(data);
			}//success
		});//ajax
	});//click
	
	$("#btnXml").click(function(){
		$.ajax({
			url:"response_xml.xml",
			type:"get",
			dataType:"xml",
			error:function(xhr){
				alert(xhr.status + " / " + xhr.statusText);
			},//error
			success:function(data){
				var msg = $( data ).find("msg").text();
				$("#output").html(msg);
			}//success
		});//ajax
	});//click
	
	$("#btnJson").click(function(){
		$.ajax({
			url:"response_json.json",
			type:"get",
			dataType:"json",
			error:function(xhr){
				alert(xhr.status + " / " + xhr.statusText);
			},//error
			success:function(data){
				$("#output").html(data.msg);
			}//success
		});
	});//click
	
	$("#btnTxt2").click(function(){
		$.ajax({
			url:"response_text.jsp",
			type:"get",
			dataType:"text",
			error:function(xhr){
				alert(xhr.status + " / " + xhr.statusText);
			},//error
			success:function(data){
				$("#output").html(data);
			}//success
		});//ajax
	});//click
	
	$("#btnHtml2").click(function(){
		$.ajax({
			url:"response_html.jsp",
			type:"get",
			dataType:"html",
			error:function(xhr){
				alert(xhr.status + " / " + xhr.statusText);
			},//error
			success:function(data){
				$("#output").html(data);
			}//success
		});//ajax
	});//click
	
	$("#btnXml2").click(function(){
		$.ajax({
			url:"http://localhost/jsp_prj/day1030/response_xml.jsp",
			type:"get",
			dataType:"xml",
			error:function(xhr){
				alert(xhr.status + " / " + xhr.statusText);
			},//error
			success:function(data){
				var msg = $( data ).find("msg").text();
				$("#output").html(msg);
			}//success
		});//ajax
	});//click
	
	$("#btnJson2").click(function(){
		$.ajax({
			url:"response_json.jsp",
			type:"get",
			dataType:"json",
			error:function(xhr){
				alert(xhr.status + " / " + xhr.statusText);
			},//error
			success:function(data){
				$("#output").html(data.msg);
			}//success
		});
	});//click
	
}); // ready

</script>
</head>
<body>
<div id="wrap">
<!-- HTML 영역 => HTML 태그 작성, CSS 정의한 디자인 적용, JS에서 동적인 디자인 생성 보여주는 일, JS에서 HTML Form Control에 입력된 값을 
	유효성 검증 수행 => onxxx속성 사용 -->
<div id="output" style="height: 80px; border: 1px solid #333"></div>
	<input type="button" class="btn btn-primary" value="TEXT" id="btnTxt"/>
	<input type="button" class="btn btn-secondary" value="TEXT" id="btnHtml"/>
	<input type="button" class="btn btn-success" value="TEXT" id="btnXml"/>
	<input type="button" class="btn btn-danger" value="TEXT" id="btnJson"/>
	<br>
	<strong>JSP의 contentType 속성 변경</strong><br>
	<input type="button" class="btn btn-primary" value="TEXT" id="btnTxt2"/>
	<input type="button" class="btn btn-secondary" value="TEXT" id="btnHtml2"/>
	<input type="button" class="btn btn-success" value="TEXT" id="btnXml2"/>
	<input type="button" class="btn btn-danger" value="TEXT" id="btnJson2"/>
</div>
</body>
</html>