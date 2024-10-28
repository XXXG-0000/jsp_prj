<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    info="테스트"
    %>
<!-- 인코딩, info 값이 다를 경우 error -->
	<%
		// 모든 JSP에서 사용하게 될 공통 코드를 주로 작성
		// 예) 로그인 이후 세션이 생성된다. 로그인이 되었는지 체크하는 코드를 작성한 후 필요한 JSP에서
		// include하여 사용한다.
		String msg = "오늘은 usecase를 confirm 합니다";
	%>
	<div id="in">내부JSP</div>
	<div id="in"><%= msg %></div>
