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
	$("#btnSend").click(function(){
		$("#frm").submit();
	});//click
	
	$("#profile").change(function(evt){
		preview(evt);
	});//click
	
	$("#btnUpdate").click(function(){
		ajaxFileUpload();
	})
}); // ready

function ajaxFileUpload(){
	if($("#profile").val() == ""){
		alert("이미지를 선택해주세요");
		return;
	}
	
	//1. form 태그 얻기 // formControl의 값을 AJAX로 전달
	var form=$("#frm")[0];
	//alert(form);//object HtmlInputElement
	
	//2. HTML Form Control의 값을 data 속성으로 전달하기 위해 생성
	var formData = new FormData(form);
	
	$.ajax({
		url:"upload_img_process.jsp",
		contentType: false,
		processData: false,
		data: formData,
		type: "post",
		dataType: "json",
		error:function(xhr){
			console.log(xhr.status);
			alert("이미지 업로드 실패");
		},
		success:function(jsonObj){
			//alert(jsonObj.uploadflag)//false
			var msg="이미지 업로드 실패";
			if(!jsonObj.uploadflag){
				msg="이미지가 업로드 되었습니다."
			}
			alert(msg);
		}
	});
	
}//ajaxFileUpload

function preview(evt){
	//alert(evt);//object Object
	if($("#profile").val() == ""){
		alert("이미지를 선택해주세요");
		return;
	}
	
	//1. 파일 컴포넌트 얻기 
	//var inputFile = $("input[name='profile']");
	//var files = inputFile[0].files;
	//alert(files);//object FileList
	//var file = evt.target[0];
	//var file = evt.target;//object HtmlInputElement
	var file = evt.target.files[0];
	//alert(file);
	
	//2. 스트림 생성
	var reader = new FileReader();
	//alert(reader);
	
	//3. FileReader객체의 onload 이벤트 핸들러를 설정
	reader.onload = function(evt2){// 이미지 로딩 완료시
		$("#preview").prop("src",evt2.target.result);//이미지 명이 설정
	}
	
	//4. 파일에서 읽어들여 실제 img 태그에 출력(미리보기)
	reader.readAsDataURL(file);
}

</script>
</head>
<body>
<div id="wrap">
<!-- HTML 영역 => HTML 태그 작성, CSS 정의한 디자인 적용, JS에서 동적인 디자인 생성 보여주는 일, JS에서 HTML Form Control에 입력된 값을 
	유효성 검증 수행 => onxxx속성 사용 -->
	<form action="fileupload_process.jsp" method="post" name="frm" id="frm">
	<img src="images/default_img.png" id="preview" style="width: 171px; height: 176px"/><br>
	<label>프로필 이미지</label>
	<input type="file" name="profile" id="profile"/>
	<input type="button" value="이미지 업로드" id="btnUpdate" class="btn btn-sm btn-success"/>
	<br>
	<label>이름</label>
	<input type="text" name="name" id="name" /><br>
	<label>id</label>
	<input type="text" name="id" id="id" /><br>
	<input type="button" value="전송" id="btnSend" /><br>
	</form>
</div>
</body>
</html>