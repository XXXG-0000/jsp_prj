<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="글쓰기 페이지"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/jsp/session_chk.jsp" %>
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

<!-- include summernote css/js-->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs5.min.css
" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs5.min.js">
</script>

<style type="text/css">
/* CSS영역 => CSS 디자인 코드 작성 */

</style>
<script type="text/javascript">
/* JS 영역 => JS 코드 작성 */
$(function(){
	$("#content").summernote({
		placeholder: '쓰고 싶은 글을 써주세요.',
		tabsize: 2,
        height: 100,
        width:490,
        toolbar: [
        	['style', ['style']],
            ['font', ['bold', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['insert', ['picture']],
            ['view', ['codeview', 'help']]
        ]	
	});//summernote
	
	$("#btnWrite").click(function(){
		chkNull();
	})
	$("#btnList").click(function(){
		location.href="../board/board_list.jsp"
	})
}); // ready

function chkNull(){
	if($("#subject").val().trim() == ""){
		alert("제목은 필수 입력");
		$("#subject").focus();
		return;
	}// end if
	
	if($("#content").val().trim() == ""){
		alert("내용은 필수 입력");
		return;
	}// end if
	
	$("#writeFrm").submit();
}//chkNull

</script>
</head>
<body>
<div id="wrap">
<!-- HTML 영역 => HTML 태그 작성, CSS 정의한 디자인 적용, JS에서 동적인 디자인 생성 보여주는 일, JS에서 HTML Form Control에 입력된 값을 
	유효성 검증 수행 => onxxx속성 사용 -->
<div id="header">
<c:import url="http://localhost/jsp_prj/common/jsp/header.jsp"/>
</div>
<div id="contentDiv">
<div id="writeFrmDiv">
<form action="board_write_frm_process.jsp" name="writeFrm" id="writeFrm" method="post">
	<table>
	<tr>
	<th colspan="2"><h2>글쓰기</h2></th>
	</tr>
	<tr>
	<td style="width: 80px">제목</td>
	<td style="width: 500px">
		<input type="text" name="subject" id="subject" style="width: 390px"/>
	</td>
	</tr>
	<tr>
	<td style="width: 80px">내용</td>
	<td>
	<textarea id="content" name="content"></textarea>
	</td>
	</tr>
	<tr>
	<td style="width: 80px">작성자</td>	
	<td style="width: 400px">
		<input type="text" name="writer" id="writer" readonly="readonly" style="width: 390px" value="${ userData.id }"/>
	</td>
	</tr>
	<tr>
	<td colspan="2" style="text-align: center">
		<input type="button" value="글쓰기" id="btnWrite" class="btn btn-sm btn-primary"/>
		<input type="reset" value="초기화" class="btn btn-sm btn-warning"/>
		<input type="button" value="리스트" id="btnList" class="btn btn-sm btn-secondary"/>
	</td>
	</tr>
	</table>
	</form>
</div>
</div>
</div>
</body>
</html>