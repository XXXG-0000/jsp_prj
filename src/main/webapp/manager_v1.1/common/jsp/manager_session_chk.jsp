<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:if test="${empty managerId}" >
    <script type="text/javascript">
        alert("%관리자 로그인이 필요한 페이지입니다.%");
        location.href="http://localhost/jsp_prj/manager/index.jsp"
    </script>
<%--    <c:redirect url="http://localhost/jsp_prj/manager/index.jsp"/>--%>
</c:if>
