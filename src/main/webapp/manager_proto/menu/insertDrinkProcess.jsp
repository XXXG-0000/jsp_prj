<%@page import="java.sql.SQLException"%>
<%@page import="project.manager.menu.DrinkDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="음료 추가 폼의 입력 정보 받기"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="pVO" class="project.manager.menu.ProductVO" scope="page"/>
<jsp:setProperty property="*" name="pVO"/>
<%= pVO %>
<%
	 		
%>
		<%-- DrinkDAO dDAO = DrinkDAO.getInstance();
		try{
			boolean flag = dDAO.selectName(dDAO.getiNameK());
			if(flag){ // 해당 메뉴명이 있을 경우
				%>
				<h2>해당 메뉴명은 이미 존재합니다.</h2>
				<strong><c:out value="${ param.iNameK }"/></strong>는 이미 사용 중입니다.
				<a href="javascript:history.back()">뒤로 이동</a>
				<%
			} else { // 해당 메뉴 이름이 없을 경우
				dDAO.insertItem(pVO);
			%>        
			<%
			}//end else
		} catch(SQLException se){
			se.printStackTrace();			
			%>	
			메뉴 등록 중 문제가 발생했습니다.<br>
			잠시 후 다시 시도해주세요
		} --%>
<!DOCTYPE html>
<html>
<head>
<script src="/docs/5.3/assets/js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.122.0">
    <link rel="stylesheet" href="http://localhost/jsp_prj/project/chart.umd/css/orderStateList.css">
    <link rel="stylesheet" href="http://localhost/jsp_prj/project/chart.umd/css/orderDetails.css">
    <title>음료 추가</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/dashboard/">
    <link rel="stylesheet" href="http://localhost/jsp_prj/admin/common/css/project_main.css">
    <!-- Custom styles for this template -->
    <link href="http://localhost/jsp_prj/admin/common/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="http://localhost/jsp_prj/admin/common/css/dashboard.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    
	<!-- bootstrap -->
    <link href="bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />

    <!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>    
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
   
    <link rel="stylesheet" href="css@3.css">
    <meta name="theme-color" content="#712cf9"> 

	<script type="text/javascript">
    $(function(){

    });//ready
    </script>
    
	<script type="text/javascript">

	</script>

</head>
<body>
<script src="bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<script src="chart.umd.js" integrity="sha384-eI7PSr3L1XLISH8JdDII5YN/njoSsxfbrkCTnJrzXt+ENP5MOVBxD+l6sEG4zoLp" crossorigin="anonymous"></script><script src="dashboard.js"></script></body>
</body>
</html>