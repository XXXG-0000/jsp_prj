<%@ page import="project.manager.customer.CustomerDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="project.manager.customer.Grade"%>
<%@ page import="project.manager.customer.CustomerVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--관리자 세션을 검증하는 jsp include--%>
<%@ include file="../common/jsp/manager_session_chk.jsp"%>
<%
    //회원의 아이디를 전달 받는다.
    String cusId = request.getParameter("cusId");

    CustomerDAO cDAO = CustomerDAO.getInstance();

    CustomerVO cVO = null;
    try {
        cVO = cDAO.selectOneCustomer(cusId);
    } catch (SQLException e) {
        e.printStackTrace();
    }

    pageContext.setAttribute("cVO", cVO);
    pageContext.setAttribute("Grade", Grade.class);
%>
<!doctype html>
<html lang="en" data-bs-theme="auto">
<head><script src="/docs/5.3/assets/js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.122.0">
    <title>회원 상세보기</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/dashboard/">
    <link rel="stylesheet" href="http://localhost/jsp_prj/manager/common/css/project_main.css">
    <!-- Custom styles for this template -->
    <link href="http://localhost/jsp_prj/manager/common/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="http://localhost/jsp_prj/manager/common/css/dashboard.css" rel="stylesheet">

	<!-- bootstrap -->
    <link href="bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />

	<!-- SweetAlert -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

    <!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <meta name="theme-color" content="#712cf9">
    <style type="text/css">

	    body { font-family: Arial, sans-serif; margin: 0; }
        h1 { margin-bottom: 20px; }
        form { max-width: 500px; margin: 0 auto; }
        label { display: block; margin-top: 10px; }
        input, select { width: 100%; padding: 8px; margin-top: 5px; box-sizing: border-box; }
        a { text-decoration: none; color: #FFF; }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

/*         .container-fluid {
			width: 100%;
		    height: 100%;
		} */

        .bi {
            vertical-align: -.125em;
            fill: currentColor;
        }
        .nav-scroller .nav {
            display: flex;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: -1px;
            overflow-x: auto;
            text-align: center;
            white-space: nowrap;
            -webkit-overflow-scrolling: touch;
        }

        .bd-mode-toggle .dropdown-menu .active .bi {
            display: block !important;
        }

          .active {
 			 color: #FFFFFF;
		}
    </style>
    <script type="text/javascript">
    $(function(){

     	$("#answer").click(function( event){
             event.preventDefault();
            movePage('u');
		});//click

        $("#confirm").click(function (event) {
            event.preventDefault();
            movePage();
        });
     	$("#cancel").click(function(event){
            event.preventDefault();
            movePage('d')
     	});//click
    });//ready

    function movePage(flag) {
        if(flag =='u'){
            document.customerFrm.action="http://localhost/jsp_prj/manager/customer/update_customer.jsp";
            $("#customerFrm").submit();
            return;
        }
        if(flag =='d'){
           let actionText = "${cVO.cusFlag}" === 'Y' ? '비활동' : '활동';

           if(confirm(`[ ${cVO.cusId} ] 유저를 정말 `+actionText+ `으로 변경하시겠습니까?`)){
               document.customerFrm.action="http://localhost/jsp_prj/manager/customer/delete_customer.jsp?cusId=<%=cusId%>";
               $("#customerFrm").submit();
           }
           return;
        }
        location.href="http://localhost/jsp_prj/manager/customer/list_customer.jsp?currentPage=${param.currentPage}";
    }

    </script>

</head>
<body>
<jsp:include page="../common/svg.jsp"/> <!-- svg -->
<jsp:include page="../common/headbar.jsp"/> <!-- headbar -->

<div class="container-fluid">
    <div class="row">
        <div class="border border-right col-md-3 col-lg-2 p-0 bg-body-tertiary" style="height: 900px">
            <div class="offcanvas-md offcanvas-end bg-body-tertiary" tabindex="-1" id="sidebarMenu" aria-labelledby="sidebarMenuLabel">

                <div class="offcanvas-body d-md-flex flex-column p-0 pt-lg-3 overflow-y-auto">
                    <ul class="nav nav-pills flex-column">
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" aria-current="page" href="http://localhost/jsp_prj/manager/dashboard/dashboard.jsp">
                                <i class="bi bi-house"></i>
                                관리자 대시보드
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" href="http://localhost/jsp_prj/manager/menu/getListDrink.jsp">
                                <svg class="bi"><use xlink:href="#cup-hot"/></svg>
                                음료 관리
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" href="http://localhost/jsp_prj/manager/menu/getListDessertIcecream.jsp">
                                <svg class="bi"><use xlink:href="#cake"/></svg>
                                디저트&아이스크림 관리
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" href="http://localhost/jsp_prj/manager/order/selectNotReceivedOrderList.jsp">
                                <i class="bi bi-cart"></i>
                                주문 관리
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2 active" href="http://localhost/jsp_prj/manager/customer/list_customer.jsp">
                                <i class="bi bi-people"></i>
                                회원 관리
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" href="http://localhost/jsp_prj/manager/voc/getListCustomSound.jsp">
                                <i class="bi bi-file-earmark-bar-graph"></i>
                                고객의 소리
                            </a>
                        </li>
                    </ul>

                    <hr class="my-3">
                    <ul class="nav flex-column mb-auto">
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" href="#">
                                <svg class="bi"><use xlink:href="#door-closed"/></svg>
                                로그아웃
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2" style="font-weight: bold;">회원 상세보기</h1>
            </div>
            <form action="" method="post" name="customerFrm" id="customerFrm">
                <label for="cusId">ID:</label>
                <input type="text" id="cusId" name="cusId" value="${cVO.cusId}" readonly>
                <input type="hidden" id="currentPage" value="${param.currentPage}"/>

                <label for="name">이름:</label>
                <input type="text" id="name" name="name" value="${cVO.name}" required>

                <label for="email">이메일:</label>
                <input type="email" id="email" name="email" value="${cVO.email}" required>

                <label for="inputDate">가입일:</label>
                <input type="date" id="inputDate" value="<fmt:formatDate value='${cVO.inputDate}' pattern='yyyy-MM-dd' />" readonly>

                <label for="grade">회원 등급:</label>
                <select id="grade" name="grade" required>
                    <c:forEach items="<%=Grade.values()%>" var="gradeOption">
                        <option value="${gradeOption.value}" ${cVO.grade == gradeOption ? 'selected' : ''}>
                                ${gradeOption}
                        </option>
                    </c:forEach>
                </select>

                <input type="radio" id="status1" name="cusFlag" value="Y" style="text-align: left; width: 5%"  ${cVO.cusFlag == 'Y'? 'checked': 'disabled'}>활동
                <input type="radio" id="status2" name="cusFlag" value="N" style="text-align: left; width: 5%" ${cVO.cusFlag == 'N'? 'checked': 'disabled'}>비활동
                <input type="hidden" id="cusFlag" name="Flag" value="${cVO.cusFlag}">

                <label for="phone">전화번호:</label>
                <input type="tel" id="phone" name="phone" value="${cVO.phone}" required>

                <div style="text-align: center;">
                    <button class="confirm" id="confirm" >확인</button>
                    <button class="answer" id="answer">수정</button>
                    <button class="cancel" id="cancel">
                        ${cVO.cusFlag == 'Y' ? '비활동' : '활동'}
                    </button>
                </div>
            </form>
        </main>
    </div>
</div>
<script src="bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="chart.umd.js" integrity="sha384-eI7PSr3L1XLISH8JdDII5YN/njoSsxfbrkCTnJrzXt+ENP5MOVBxD+l6sEG4zoLp" crossorigin="anonymous"></script><script src="dashboard.js"></script>
</body>
</html>