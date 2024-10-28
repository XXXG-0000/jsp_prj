<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="내부 요청인지 외부 요청인지를 판단하는 일"
    %>
<%
	request.setCharacterEncoding("UTF-8");
	String movePage = "kor.jsp";
	String lang = "한국어"; // web parameter로 전송, web parameter로 생성한 한글은 전송될 때 깨짐
	// request 객체의 charset을 encoding 해야 한다.
	
	if(!"localhost".equals(request.getServerName())){
		movePage = "eng.jsp";
		lang = "english";
	}// end if

%>
<jsp:forward page="<%= movePage %>">
	 <jsp:param value="<%= lang %>" name="lang"/>
</jsp:forward>