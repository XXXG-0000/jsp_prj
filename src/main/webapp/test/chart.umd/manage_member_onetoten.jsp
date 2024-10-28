<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="공통 디자인을 사용하는 페이지"
    %>
<!doctype html>
<html lang="en" data-bs-theme="auto">
<head><script src="/docs/5.3/assets/js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.122.0">
    <title>Dashboard Template</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/dashboard/">
    <link rel="stylesheet" href="project_main.css?after">
    
	<!-- bootstrap -->
    <link href="bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />

    <link rel="stylesheet" href="css@3.css">
    <meta name="theme-color" content="#712cf9">
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
        form { max-width: 300px; margin: 0 auto; }
        a {	text-decoration: none; color: #333;	}
		a:hover { text-decoration: underline; }
        span.active { padding: 10px; background-color: #00F200; border-radius: 45% }
		span.inactive { padding: 10px; background-color: #F20000; border-radius: 45% }
		#subject { width: 150px; height: 44px; }
        
    </style>


    <!-- Custom styles for this template -->
    <link href="bootstrap-icons.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="dashboard.css" rel="stylesheet">

</head>
<body>
<jsp:include page="svg.jsp"/> <!-- jsp -->

<header class="navbar sticky-top bg-dark flex-md-nowrap p-0 shadow" data-bs-theme="dark">
    <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3 fs-6 text-white" href="#">빽스다방</a>

    <ul class="navbar-nav flex-row d-md-none">
        <li class="nav-item text-nowrap">
            <button class="nav-link px-3 text-white" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSearch" aria-controls="navbarSearch" aria-expanded="false" aria-label="Toggle search">
                <svg class="bi"><use xlink:href="#search"/></svg>
            </button>
        </li>
        <li class="nav-item text-nowrap">
            <button class="nav-link px-3 text-white" type="button" data-bs-toggle="offcanvas" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
                <svg class="bi"><use xlink:href="#list"/></svg>
            </button>
        </li>
    </ul>

    <div id="navbarSearch" class="navbar-search w-100 collapse">
        <input class="form-control w-100 rounded-0 border-0" type="text" placeholder="Search" aria-label="Search">
    </div>
</header>

<div class="container-fluid">
    <div class="row">
        <div class="sidebar border border-right col-md-3 col-lg-2 p-0 bg-body-tertiary">
            <div class="offcanvas-md offcanvas-end bg-body-tertiary" tabindex="-1" id="sidebarMenu" aria-labelledby="sidebarMenuLabel">

                <div class="offcanvas-body d-md-flex flex-column p-0 pt-lg-3 overflow-y-auto">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2 active" aria-current="page" href="#">
                                <i class="bi bi-house"></i>
                                관리자 대시보드
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" href="#">
                                <svg class="bi"><use xlink:href="#cup-hot"/></svg>
                                음료 관리
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" href="#">
                            	<svg class="bi"><use xlink:href="#cake"/></svg>
                                디저트&아이스크림 관리
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="bi bi-cart"></i>
                                	주문 관리
                                  <ul class="dropdown-menu">
    								<li><button class="dropdown-item" type="button">미수령 주문</button></li>
    								<li><button class="dropdown-item" type="button">수령 완료 주문</button></li>
  								</ul>
                            </a>                                                        
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" href="#">
                                <i class="bi bi-people-fill"></i>
                                회원 관리
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" href="#">
								<i class="bi bi-file-earmark-bar-graph"></i>
                                고객의 소리
                            </a>
                        </li>
                    </ul>

                    <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-body-secondary text-uppercase">
                        <span>리포트 저장</span>
                        <a class="link-secondary" href="#" aria-label="Add a new report">
                            <svg class="bi"><use xlink:href="#plus-circle"/></svg>
                        </a>
                    </h6>
                    <ul class="nav flex-column mb-auto">
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" href="#">
                                <i class="bi bi-calendar-month"></i>
                                이번달 정산
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" href="#">
                                <i class="bi bi-calendar-range"></i>
                                분기별 정산
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" href="#">
                                <i class="bi bi-calendar"></i>
                                이번년도 정산
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
                <h1 class="h2"><strong>회원관리</strong></h1>
                <div class="btn-toolbar mb-2 mb-md-0">
                    <div class="btn-group me-2">
                        <button type="button" class="btn btn-sm btn-outline-secondary">공유</button>
                        <button type="button" class="btn btn-sm btn-outline-secondary">추출</button>
                    </div>
                    <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle d-flex align-items-center gap-1">
                        <i class="bi bi-calendar3"></i>
                        이번주
                    </button>
                </div>
            </div>
            <!--  -->
       <div class="search-bar">
      	<select id="subject" class="search-bar">
			<option val="">--분류--</option>
			<option val="ID">ID</option>
			<option val="회원 등급">회원 등급</option>
			<option val="회원 상태">회원 상태</option>
		</select>
        <input type="text" class="keyword" name="keyword" placeholder="회원 검색...">
        <button>검색</button>
    </div>

	<form>
    <table class="user">
        <thead>
            <tr>
                <th class="id">ID</th>
                <th class="rank">회원 등급</th>
                <th class="status">회원 상태</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="id" name="id"><a href="info_manager.html">user1</a></td>
                <td class="rank" name="rank">실버</td>
                <td class="status" name="status"><span class="active">활동</span></td>
            </tr>
            <tr>
                <td class="id" name="id"><a href="info_manager.html">user2</a></td>
                <td class="rank" name="rank">골드</td>
                <td class="status" name="status"><span class="active">활동</span></td>
            </tr>
        </tbody>
    </table>
	</form>

    <script>
        var modal = document.getElementById("deleteModal");
        var span = document.getElementsByClassName("close")[0];
        var deleteConfirmMessage = document.getElementById("deleteConfirmMessage");
        var userToDelete = "";


        function closeModal() {
            modal.style.display = "none";
        }

        span.onclick = closeModal;

        window.onclick = function(event) {
            if (event.target == modal) {
                closeModal();
            }
        }
    </script>
    
                    <ul class="pagination justify-content-center">
						<li class="page-item active">
						<a class="page-link" href="#">1</a>
						</li>
 						<li class="page-item">
						<a class="page-link" href="#">2</a>
						</li>
						<li class="page-item">
						<a class="page-link" href="#">3</a>
						</li>
						<li class="page-item">
						<a class="page-link" href="#">4</a>
						</li>
						<li class="page-item">
						<a class="page-link" href="#">5</a>
						</li>
						<li class="page-item">
						<a class="page-link" href="#">6</a>
						</li>
						<li class="page-item">
						<a class="page-link" href="#">7</a>
						</li>
						<li class="page-item">
						<a class="page-link" href="#">8</a>
						</li>
						<li class="page-item">
						<a class="page-link" href="#">9</a>
						</li>
						<li class="page-item">
						<a class="page-link" href="#">10</a>
						</li>
						<li class="page-item">
						<a class="page-link" href="#">
						<i class="bi bi-chevron-right"></i></a>
						</li>
						<li class="page-item">
						<a class="page-link" href="#" title="첫 글 보기">
						<i class="bi bi-chevron-double-right"></i></a>
						</li>
					</ul>

            <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>
        </main>
    </div>
</div>
<script src="bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<script src="chart.umd.js" integrity="sha384-eI7PSr3L1XLISH8JdDII5YN/njoSsxfbrkCTnJrzXt+ENP5MOVBxD+l6sEG4zoLp" crossorigin="anonymous"></script><script src="dashboard.js"></script></body>
</html>