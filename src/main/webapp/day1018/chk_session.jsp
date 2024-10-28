<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 로그인 X => 로그인 창으로 전송 -->
<!-- 관리자 페이지는 어떤 페이지든 이 페이지가 있어야 한다. => include 지시자로 추가 -->
<%-- <%@ include file="chk_session.jsp" %> --%>
<c:if test="${ empty user_id }">
<c:redirect url="create_session.jsp"/>
</c:if>