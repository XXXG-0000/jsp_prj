<%@ page import="project.manager.manager.ManagerDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="kr.co.sist.chipher.DataEncryption" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" info="매니저 아이디 정보를 조회" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="mVO" class="project.manager.manager.ManagerVO" scope="page"/>
<jsp:setProperty name="mVO" property="*"/>
<%
	String managerId = request.getParameter("managerId");
	String managerPass = request.getParameter("managerPass");
	
	DataEncryption de = new DataEncryption("abcdef0123456789");

    ManagerDAO mDAO = ManagerDAO.getInstance();
    mVO.setManagerId(de.encrypt(managerId));
    mVO.setManagerPass(DataEncryption.messageDigest("SHA-1", managerPass));
    
    boolean loginFlag = false;
    try{
        loginFlag = mDAO.selectManager(mVO);
    } catch(SQLException se){
    	se.printStackTrace();
    }
    
    pageContext.setAttribute("loginFlag", loginFlag);
%>

<!DOCTYPE html>
<html lang="ko">
<jsp:include page="common/jsp/post_chk.jsp"/>
<jsp:useBean id="managerVO" class="project.manager.manager.ManagerVO" scope="page"/>
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
    var loginFlag = ${ loginFlag };
    var msg="문제가 발생했습니다. 잠시 후 다시 시도해주세요.";
    var flag = false;
    var url="http://localhost/jsp_prj/manager/dashboard/dashboard.jsp";
    const returnUrl = localStorage.getItem("returnUrl");
	
    if(!loginFlag){
    	msg="아이디나 비밀번호가 잘못 입력되었습니다.\n다시 확인해주세요."
    	alert(msg);
    	history.back();
    } else {
    	flag = true;
    }
    
    <%
    // 로그인에 성공했으니 세션에 두고두고 저장
    // 테스트 코드
    session.setMaxInactiveInterval(1800);  // 30분 = 1800초
    session.setAttribute("managerId", managerId);
    %>
    
    if(!flag){
    	alert(msg);
    	history.back();
    } else{
     	if(returnUrl != null){
    		url = returnUrl;
    		location.href = url;
    	}
    	
    	location.href = url;
    }
    </script>
</head>
<body>

</body>
</html>
