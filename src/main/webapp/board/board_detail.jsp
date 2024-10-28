<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.board.BoardVO"%>
<%@page import="kr.co.sist.user.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="글쓰기 페이지"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!-- 시간 받기 -->
<% 
	//실제 글의 고유번호를 받는다
	String tempNum = request.getParameter("num");
	int num = 0;
	try {
		num = Integer.parseInt(tempNum);
	} catch(NumberFormatException nfe){
		response.sendRedirect("board_list.jsp"); // 게시판으로 반환
		return;
	}// end catch
	
	//입력된 글 번호로 상세 조회 수행
	BoardDAO bDAO = BoardDAO.getInstance();
	
	BoardVO bVO = null;
	try{
		bVO = bDAO.selectDetailBoard(num);
	} catch(SQLException se){
		se.printStackTrace();
	}//end catch
	
	pageContext.setAttribute("bVO", bVO);
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
if(${ empty bVO }){ // bVO == null?
	alert("글 읽기 도중 문제가 발생했습니다.\n잠시 후 다시 시도해주세요.");
	location.href="board_list.jsp";
}

$(function(){
	$("#content").summernote({
		placeholder: '쓰고 싶은 글을 써주세요.',
		tabsize: 2,
        height: 500,
        width:700,
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
		var url="../board/board_list.jsp?currentPage=${ param.currentPage }";
		// param.currentPage: input type hidden 사용해 넘긴다.
		if(${ not empty param.keyword }){ // 키워드가 있을 경우
			url += "&field=${ param.field}&keyword=${ param.keyword }"			
		}// end if
		location.href = url;
	})
	
	$("#btnUpdate").click(function(){
		movePage('u');
	})//click
	
	$("#btnDelete").click(function(){
		movePage('d');
	})//click
}); // ready

function movePage(flag){
	//<form>태그의 action을 변경 document.폼이름.action="변경할 action"
	var action = "board_update.jsp";
	var msg = "글을 수정하시겠습니까?"
	if(flag == 'd'){
		action = "board_delete.jsp";
		msg="정말 글을 삭제하시겠습니까?"
	}// end if
	
	// method 속성 변경
	//document.readFrm.method = "GET";
	//alert( document.readFrm.action ); //버튼을 눌렀을 때 어디로 향하는지 알 수 있다
	//alert(document.readFrm.method);
	
	if(confirm(msg)){ // 사용자에게 한 번 더 확인을 거친다
		//폼태그 객체의 action 속성 변경
		document.readFrm.action = action;
		//변경은 내용이 존재하는지에 대해서만 판단
		//alert($("#content").val());
 		if(flag == 'u'){
			if($("#content").val().length < 15) {//내용이 없을 경우
				alert("내용은 필수 입력입니다.");
				return;
			}// end if
		} // end if
		
		$("#readFrm").submit();//form 전송
		
	}// end if
	
}//movePage


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
	
	$("#readFrm").submit();
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
<form action="board_write_frm_process.jsp" name="readFrm" id="readFrm" method="post">
	<table>
	<tr>
	<th colspan="2"><h2>글읽기</h2></th>
	</tr>
	<tr>
	<td style="width: 80px">제목</td>
	<td style="width: 500px">
		<input type="text" name="subject" id="subject"
		value="${ bVO.subject }"
		 style="width: 390px"/>
	</td>
	</tr>
	<tr>
	<td style="width: 80px">내용</td>
	<td>
	<textarea id="content" name="content">${ bVO.content }</textarea>
	</td>
	</tr>
	<tr>
	<td style="width: 80px">작성자</td>	
	<td>
	<c:out value="${ bVO.writer }"/>
	</td>
	</tr>
	<tr>
	<td style="width: 80px">작성일</td>	
	<td>
	<fmt:formatDate value="${ bVO.input_date }" pattern="yyyy-MM-dd a HH:mm:ss"/>
	</td>
	</tr>
	<tr>
	<td style="width: 80px">ip</td>	
	<td>
	<c:out value="${ bVO.ip }"/>
	<input type="hidden" name="num" value="${ bVO.num }"/>
	<input type="hidden" name="currentPage" value="${ param.currentPage }"/>
	</td>
	</tr>
	<tr>
	<td colspan="2" style="text-align: center">
		<c:if test="${ bVO.writer eq userData.id }">
		<input type="button" value="글수정" id="btnUpdate" class="btn btn-sm btn-primary"/>
		<input type="button" value="삭제" id="btnDelete" class="btn btn-sm btn-warning"/>
		</c:if>
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