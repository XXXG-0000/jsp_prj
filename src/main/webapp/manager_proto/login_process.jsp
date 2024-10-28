<%@ page import="first_prj.jsp_prj2.dao.ManagerDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" info="매니저 아이디 정보를 조회" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<%--useBean으로 폼으로 전달된 정보 저장, 추후 클래스 변경--%>
<jsp:include page="common/jsp/post_chk.jsp"/>
<jsp:useBean id="managerVO" class="first_prj.jsp_prj2.VO.ManagerVO" scope="page"/>
<jsp:setProperty name="managerVO" property="*"/>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="http://192.168.10.213:8080/jsp_prj2/common/css/main_20240911.css">
    <link rel="icon" type="image/png" sizes="16x16" href="../common/images/favicon-16x16.png">
    <!--bootstrap CDN-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>

    <!-- jQuery CDN 시작 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

    <script type="text/javascript">
        $(function () {

        });
    </script>
</head>
<body>
<%
    //TODO 복호화 암호화 수행하지 않음 추후에 변경할 예정.
    ManagerDAO mDAO = ManagerDAO.getInstance();
    try {
        String managerId = mDAO.selectManager(managerVO);
        if("".equals(managerId) || managerId.isEmpty()){%>
        <script>
            alert("로그인 실패! 다시 시도해주세요.");
            location.href = "http://localhost/jsp_prj/manager/index.jsp";
        </script>
    <%
        }
        // 세션에 두고두고 저장
        session.setAttribute("managerId", managerId);
        response.sendRedirect("http://localhost/jsp_prj/manager/dashboard/dashboard.jsp");
    } catch (SQLException e) {
        e.printStackTrace();
    } %>
</body>
</html>
