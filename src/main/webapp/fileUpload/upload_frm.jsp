<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//이동한 페이지에서 새로고침했을 때 작업이 여러 번 발생하지 않도록 하기 위한 flag값 저장
	session.setAttribute("uploadFlag", false); 
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
	$("#btn").click(function(){
		chkNull();
	});//click
}); // ready

function chkNull(){
	if($("#uploader").val() == ""){
		alert("업로더는 필수 입력!!");
		$("#uploader").focus();
		return;
	}//end if
	
	if($("#upfile").val() == ""){
		alert("업로드 파일은 필수 입력!!");
		return;
	}//end if
	
	//업로드 가능 확장자는 이미지 관련 확장자만 가능하도록 유효성 검증
	// jpg, gif, png, bmp 확장자만 업로드 가능
	// 위 확장자가 아니면 alert("업로드 가능 확장자가 아닙니다.")를 보여주고 리턴
/* 	if( file.indexOf(".jpg") == -1 || file.indexOf(".gif") == -1 || file.indexOf(".png") == -1 || file.indexOf(".bmp") == -1 ){
		alert("업로드 가능 확장자가 아닙니다.");
		return;
	} */
	
	var file = $("#upfile").val();
	const blockExt = ["jpg","gif","png","bmf"];
	var fileExt = file.substring(file.lastIndexOf(".")+1);
	
	var blockFlag = false;
	for(var i = 0; i < blockExt.length; i++){
		if(blockExt[i] == fileExt){
			blockFlag=true;
			break;
		}//end if
	}//end if
	
	if(!blockFlag){
		alert("업로드 가능 확장자가 아닙니다.");
		return;
	}
	
	
	$("#frm").submit();
}//chkNull

</script>
</head>
<body>
<div id="wrap">
<!-- HTML 영역 => HTML 태그 작성, CSS 정의한 디자인 적용, JS에서 동적인 디자인 생성 보여주는 일, JS에서 HTML Form Control에 입력된 값을 
	유효성 검증 수행 => onxxx속성 사용 -->

<a href="file_list.jsp">파일 리스트 보기</a>
<form action="upload_process.jsp" method="post" enctype="multipart/form-data" id="frm">
<label>업로더</label>
<input type="text" name="uploader" id="uploader"/><br>

<label>파일확장자</label>
<input type="checkbox" name="ext" value="jpg" />jpg
<input type="checkbox" name="ext" value="png" />png
<input type="checkbox" name="ext" value="exe" />exe
<input type="checkbox" name="ext" value="hwp" />hwp
<br>
<label>파일</label>
<input type="file" name="upfile" id="upfile" /><br>
<input type="button" value="업로드" id="btn" class="btn btn-primary btn-sm" /><br>
</form>
</div>
</body>
</html>