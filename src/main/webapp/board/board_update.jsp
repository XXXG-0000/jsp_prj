<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/jsp/session_chk.jsp" %>
<%@ include file="../common/jsp/post_chk.jsp" %><!-- post 방식인지 체크 -->

<jsp:useBean id="bVO" class="kr.co.sist.user.board.BoardVO" scope="page"/>
<jsp:setProperty name="bVO" property="*"/>
<%-- setProperty 했을 때 글 번호, 글 제목, 내용의 세 가지를 받는다. --%>
<%
	bVO.setWriter(sessionId);
	//out.print(bVO); // bVO로 넘어오는 정보
	BoardDAO bDAO = BoardDAO.getInstance();
	int cnt = 0;
	try{
		cnt = bDAO.updateBoard(bVO);//0-실패(num 외부에서 변경) 1-성공
	} catch(SQLException se) {
		cnt = -1;	// -1: DB에서 문제 발생
		se.printStackTrace();
	}// end catch
	
	pageContext.setAttribute("cnt", cnt); //${}에서 사용 가능, -1,0,1
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

<script type="text/javascript">
var msg = "DB에서 문제가 발생했습니다." // cnt = -1
var cnt = ${ cnt }; // js의 변수에다 jsp의 값을 넣은 것
if(cnt == 0){
	msg = "글 번호가 외부에서 임의로 편집되었습니다.";
}//end if

if(cnt == 1){
	msg = "글이 수정되었습니다.";
}//end if

alert(msg);

if(cnt == -1 || cnt == 0){
	history.back();
} else {
	location.href="board_list.jsp?currentPage=${ param.currentPage }";
}

$(function(){
	
}); // ready

</script>
</head>
<body>

</body>
</html>