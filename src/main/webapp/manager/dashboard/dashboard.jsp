<%@ page import="project.manager.dashboard.DashboardDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Arrays" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         info="대시보드 페이지"
    %>
<%--관리자 세션을 검증하는 jsp include--%>
<%@ include file="../common/jsp/manager_session_chk.jsp"%>

<!doctype html>
<html lang="kor" data-bs-theme="auto">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <title>Dashboard Template</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link href="https://getbootstrap.com/docs/5.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

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
         .nav-item.dropdown .dropdown-menu {
             display: block;
             opacity: 0;
             visibility: hidden;
             transition: all 0.2s ease;
             margin-top: -10px;
         }

        .nav-item.dropdown:hover .dropdown-menu {
            opacity: 1;
            visibility: visible;
            margin-top: 0;
        }
        .chart-container {
            height: 300px;
            margin-bottom: 20px;
            border: 1px solid #CECECE;
            border-radius: 15px;
            box-shadow: 5px 5px #5A5D61;
        }
    </style>

    <!-- Custom styles for this template -->
    <link href="https://getbootstrap.com/docs/5.3/examples/dashboard/dashboard.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- jQuery CDN 시작 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

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
                            <a class="nav-link d-flex align-items-center gap-2 active" aria-current="page" href="http://localhost/jsp_prj/manager/dashboard/dashboard.jsp">
                                <i class="bi bi-house"></i>
                                관리자 대시보드
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" href="http://localhost/jsp_prj/manager/menu/selectCoffeeList.jsp">
                                <svg class="bi"><use xlink:href="#cup-hot"/></svg>
                                음료 관리
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" href="http://localhost/jsp_prj/manager/menu/selectDessertList.jsp">
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
                            <a class="nav-link d-flex align-items-center gap-2" href="http://localhost/jsp_prj/manager/customer/list_customer.jsp">
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
                <div class="btn-toolbar mb-2 mb-md-0">
                    <div class="btn-group me-2">
                        <button type="button" class="btn btn-sm btn-outline-secondary">공유</button>
                        <button type="button" class="btn btn-sm btn-outline-secondary">추출</button>
                    </div>
                    <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle d-flex align-items-center gap-1">
                        <i class="bi bi-calendar-date"></i>
                        today
                    </button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="chart-container">
                        <canvas id="chart1"></canvas>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="chart-container">
                        <canvas id="chart2"></canvas>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="chart-container">
                        <canvas id="chart3"></canvas>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="chart-container">
                        <canvas id="chart4"></canvas>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
<%
    DashboardDAO dDAO = DashboardDAO.getInstance();

    int[] drinkSales =  null;
    int[] dessertSales = null;
    int[] join = null;
    int[] withdraw = null;
    int[] voc = null;
    int[] total = null;
    try {
        drinkSales = dDAO.selectDrinkSales();
        dessertSales = dDAO.selectDessertSales();
        join = dDAO.selectJoinCustomer();
        withdraw =dDAO.selectWithdrawCustomer();
        voc = dDAO.selectVoc();
        total = dDAO.selectSales();

    } catch (SQLException e) {
        e.printStackTrace();
    }
    pageContext.setAttribute("selectDrinkSales", drinkSales);
    pageContext.setAttribute("selectDessertSales", dessertSales);
    pageContext.setAttribute("join",join);
    pageContext.setAttribute("withdraw", withdraw);
    pageContext.setAttribute("voc", voc);
    pageContext.setAttribute("total", total);
%>

<script>
    // 날짜 sysdate -n 의 데이터를 가져온다.
    const days = ['월', '화', '수', '목', '금', '토', '일'];

    // 실제 데이터 삽입 구간
    const data = {
        음료: [${selectDrinkSales[6]}, ${selectDrinkSales[5]}, ${selectDrinkSales[4]},
            ${selectDrinkSales[3]}, ${selectDrinkSales[2]}, ${selectDrinkSales[1]},
            ${selectDrinkSales[0]}],
        디저트: [${selectDessertSales[6]}, ${selectDessertSales[5]}, ${selectDessertSales[4]},
            ${selectDessertSales[3]}, ${selectDessertSales[2]}, ${selectDessertSales[1]},
            ${selectDessertSales[0]}],
        가입: [${join[6]}, ${join[5]}, ${join[4]},
            ${join[3]}, ${join[2]}, ${join[1]},
            ${join[0]}],
        탈퇴: [${withdraw[6]}, ${withdraw[5]}, ${withdraw[4]},
            ${withdraw[3]}, ${withdraw[2]}, ${withdraw[1]},
            ${withdraw[0]}],
        voc: [${voc[6]}, ${voc[5]}, ${voc[4]},
            ${voc[3]}, ${voc[2]}, ${voc[1]},
            ${voc[0]}],
        매출: [${total[6]}, ${total[5]}, ${total[4]},
            ${total[3]}, ${total[2]}, ${total[1]},
            ${total[0]}]
    };

    // 차트 1: 음료 판매량
    new Chart(document.getElementById('chart1'), {
        type: 'bar',
        data: {
            labels: days,
            datasets: [{
                   label: '음료/커피 판매량',
                    data: data.음료,
                    backgroundColor: 'rgba(50, 99, 132, 0.5)',
                },
                {
                    label: '디저트/아이스크림 판매량',
                    data:data.디저트,
                    backgroundColor: 'rgba(70, 190, 132, 0.5)',
                }
            ]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                title: {
                    display: true,
                    text: '일일 판매량(건수)'
                }
            }
        }
    });

    // 차트 2: 디저트 판매량
    new Chart(document.getElementById('chart2'), {
        type: 'line',
        data: {
            labels: days,
            datasets: [{
                label: '총 매출',
                data: data.매출,
                borderColor: 'rgba(153, 102, 255, 1)',
                tension: 0.1
            }


            ]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                title: {
                    display: true,
                    text: '일일 총 매출량 '
                }
            }
        }
    });

    // 차트 3: 회원 가입 수
    new Chart(document.getElementById('chart3'), {
        type: 'bar',
        data: {
            labels: days,
            datasets: [
                {
                label: '신규 회원 수',
                data: data.가입,
                backgroundColor: 'rgba(75, 192, 192, 0.5)'
                },
                {
                    label: '탈퇴 회원 수',
                    data: data.탈퇴,
                    backgroundColor: 'rgb(255, 99, 132,0.5)',
                }
            ]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                title: {
                    display: true,
                    text: '일일 신규 회원 및 탈퇴 회원'
                }
            }
        }
    });

    // 차트 4: 총 매출
    new Chart(document.getElementById('chart4'), {
        type: 'line',
        data: {
            labels: days,
            datasets: [{
                label: '고객의 소리',
                data: data.voc,
                borderColor: 'rgba(54, 162, 235, 1)',
                tension: 0.1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                title: {
                    display: true,
                    text: '일일 고객의 소리(건수)'
                }
            }
        }
    });
</script>

</body>
</html>