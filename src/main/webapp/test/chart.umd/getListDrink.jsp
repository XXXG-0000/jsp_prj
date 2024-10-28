<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="음료 관리"
    %>
<!doctype html>
<html lang="en" data-bs-theme="auto">
<head><script src="/docs/5.3/assets/js/color-modes.js"></script>
<!-- 이쪽이 진짜 -->

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.122.0">
    <title>음료 관리 페이지</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/dashboard/">
    <link rel="stylesheet" href="project_main.css?after">
    
	<!-- bootstrap -->
    <link href="bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />

	<!-- jQuery -->
  	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	

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
        form { max-width: 750px; margin: 0 auto; }
        a {	text-decoration: none; color: #333;	}
		a:hover { text-decoration: underline; }
        span.active { padding: 10px; background-color: #00F200; border-radius: 45% }
		span.inactive { padding: 10px; background-color: #F20000; border-radius: 45% }
		#subject { width: 150px; height: 44px; }
		th, td {
			border: 1px solid #ddd;
			padding: 12px;
			text-align: left;
		}
		#drinkImg { width: 40px; height: 50px;}
		
		/* 숨기기 */
		.hidden {
		    display: none;
		}
        
    </style>

<script type="text/javascript">
//탭을 보여주는 함수
$(function(){
	$("#btnradio1").click(function(){
		showTab('coffeeChart');
	});//click
	
	$("#btnradio2").click(function(){
		showTab('drinkChart');
	});//click
});//ready

function showTab(tab) {
    document.getElementById('coffeeChart').classList.add('hidden');
    document.getElementById('drinkChart').classList.add('hidden');
    document.getElementById(tab).classList.remove('hidden');
    
    let tabs = document.querySelectorAll('.tab');
    tabs.forEach(t => t.classList.remove('active'));
    event.target.classList.add('active');
}
 
/*  $(document).on('change', 'input:radio[id^="btnradio"]', function (event) {
	    //alert("click fired");
	 	event.stopImmediatePropagation();
	 $("#btnradio1").click(function(event){
	    //alert("click fired");
	 	event.stopImmediatePropagation();
		var t1 = document.getElementById("coffeeChart");
		var t2 = document.getElementById("drinkChart");
		
		t1.style.display = "block";
		t2.style.display = "none";
	});//click
	
	$("#btnradio2").click(function(event){
	    //alert("click fired");
	 	event.stopImmediatePropagation();
		var t1 = document.getElementById("coffeeChart");
		var t2 = document.getElementById("drinkChart");
		
		t1.style.display = "none";
		t2.style.display = "block";
	});//click
});//ready */
</script>

    <!-- Custom styles for this template -->
    <link href="bootstrap-icons.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="dashboard.css" rel="stylesheet">

</head>
<body>
<jsp:include page="svg.jsp"/> <!-- jsp -->
<jsp:include page="headbar.jsp"/> <!-- headbar -->

<div class="container-fluid">
    <div class="row">
        <div class="border border-right col-md-3 col-lg-2 p-0 bg-body-tertiary">
            <div class="offcanvas-md offcanvas-end bg-body-tertiary" tabindex="-1" id="sidebarMenu" aria-labelledby="sidebarMenuLabel">

                <div class="offcanvas-body d-md-flex flex-column p-0 pt-lg-3 overflow-y-auto">
                    <ul class="nav nav-pills flex-column">
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" aria-current="page" href="http://localhost/jsp_prj/test/chart.umd/dashboard.jsp">
                                <i class="bi bi-house"></i>
                                관리자 대시보드
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2 active" href="http://localhost/jsp_prj/test/chart.umd/getListDrink.jsp">
                                <svg class="bi"><use xlink:href="#cup-hot"/></svg>
                                음료 관리
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" href="http://localhost/jsp_prj/test/chart.umd/getListDessertIcecream.jsp">
                            	<svg class="bi"><use xlink:href="#cake"/></svg>
                                디저트&아이스크림 관리
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" href="http://localhost/jsp_prj/test/chart.umd/getListOrder.jsp">
                                <i class="bi bi-cart"></i>
                                	주문 관리
                            </a>                                                        
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" href="http://localhost/jsp_prj/test/chart.umd/getListMember.jsp">
                                <i class="bi bi-people"></i>
                                회원 관리
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" href="http://localhost/jsp_prj/test/chart.umd/getListCustomSound.jsp">
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
                <h1 class="h2"><strong>음료 관리</strong></h1>
            </div>
			<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups" style="margin-bottom: 10px;">
			 <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
			  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
			  <label class="btn btn-outline-primary" for="btnradio1" class="btnradio1">커피</label>
			
			  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
			  <label class="btn btn-outline-primary" for="btnradio2" class="btnradio2">음료</label>
			</div>
			</div>
		<form>
        <table id="coffeeChart">
        <thead>
            <tr>
                <th style="width: 100px;">상품번호</th>
                <th>음료 이름</th>
                <th style="width: 100px;">가격</th>
                <th style="width: 100px;">카테고리</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1</td>
                <td><img id="drinkImg" src="../image/더블에스프레소-2-450x588.png">
                <a href="updateDrink.jsp">더블에스프레소</a></td>
                <td>1,500</td>
                <td>커피</td>
            </tr>
            <tr>
                <td>2</td>
                <td><img id="drinkImg" src="../image/HOT-앗메리카노-450x588.png">
                <a href="updateDrink.jsp">아메리카노(HOT)</a></td>
                <td>1,500</td>
                <td>커피</td>
            </tr>
            <tr>
                <td>3</td>
                <td><img id="drinkImg" src="../image/ICED-앗메리카노-450x588.png">
                <a href="updateDrink.jsp">아메리카노(ICED)</a></td>
                <td>2,000</td>
                <td>커피</td>
            </tr>
            <tr>
                <td>4</td>
                <td><img id="drinkImg" src="../image/HOT-원조커피-450x588.png">
                <a href="updateDrink.jsp">원조커피(HOT)</a></td>
                <td>2,500</td>
                <td>커피</td>
            </tr>
            <tr>
                <td>5</td>
                <td><img id="drinkImg" src="../image/슈크리미-라떼HOT-450x588.png">
                <a href="updateDrink.jsp">슈크리미 라떼(HOT)</a></td>
                <td>4,000</td>
                <td>커피</td>
            </tr>
            <tr>
                <td>6</td>
                <td><img id="drinkImg" src="../image/슈크리미-라떼ICED-450x588.png">
                <a href="updateDrink.jsp">슈크리미 라떼(ICED)</a></td>
                <td>4,000</td>
                <td>커피</td>
            </tr>
        </tbody>
        </table>
        
        <table id="drinkChart" class="hidden">
        <thead>
            <tr>
                <th style="width: 100px;">상품번호</th>
                <th>음료 이름</th>
                <th style="width: 100px;">가격</th>
                <th style="width: 100px;">카테고리</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1</td>
                <td><img id="drinkImg" src="../image/뱅쇼hot_thumb-450x588.png">
                <a href="updateDrink.jsp">뱅쇼(HOT)</a></td>
                <td>3,800</td>
                <td>음료</td>
            </tr>
            <tr>
                <td>2</td>
                <td><img id="drinkImg" src="../image/뱅쇼iced_thumb-450x588.png">
                <a href="updateDrink.jsp">뱅쇼(ICED)</a></td>
                <td>3,800</td>
                <td>음료</td>
            </tr>
            <tr>
                <td>3</td>
                <td><img id="drinkImg" src="../image/우리쌀라떼-핫-450x588.png">
                <a href="updateDrink.jsp">우리쌀 라떼(HOT)</a></td>
                <td>3,500</td>
                <td>음료</td>
            </tr>
            <tr>
                <td>4</td>
                <td><img id="drinkImg" src="../image/우리쌀라떼-아이스-450x588.png">
                <a href="updateDrink.jsp">우리쌀 라떼(HOT)</a></td>
                <td>4,000</td>
                <td>음료</td>
            </tr>
            <tr>
                <td>5</td>
                <td><img id="drinkImg" src="../image/우리쌀쉐이크-450x588.png">
                <a href="updateDrink.jsp">우리쌀 라떼(HOT)</a></td>
                <td>4,000</td>
                <td>음료</td>
            </tr>
            <tr>
                <td>6</td>
                <td><img id="drinkImg" src="../image/구아바크림주스-450x588.png">
                <a href="updateDrink.jsp">우리쌀 라떼(HOT)</a></td>
                <td>4,300</td>
                <td>음료</td>
            </tr>
        </tbody>
        </table>
        </form>
             <ul class="pagination justify-content-center">
                		<li class="page-item">
						<a class="page-link" href="#">
						<i class="bi bi-chevron-double-left" title="최신 글 보기"></i></a>
						</li>
						<li class="page-item">
						<a class="page-link" href="#">
						<i class="bi bi-chevron-left"></i></a>
						</li>
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
						<a class="page-link" href="#">
						<i class="bi bi-chevron-right"></i></a>
						</li>
                		<li class="page-item">
						<a class="page-link" href="#">
						<i class="bi bi-chevron-double-right" title="마지막 글 보기"></i></a>
						</li>
					</ul>
        	<button class="btn btn-primary" style="border:none; float: right; margin-left: 10px; border-radius: 20px; padding: 10px;">
        		<a href="insertDrink.jsp" style="color:#FFF; font-weight: bold;">
        		<svg class="bi"><use xlink:href="#plus-circle"/></svg> 음료 추가</a>
        	</button>
            <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>
        </main>
    </div>
</div>
<script src="bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<script src="chart.umd.js" integrity="sha384-eI7PSr3L1XLISH8JdDII5YN/njoSsxfbrkCTnJrzXt+ENP5MOVBxD+l6sEG4zoLp" crossorigin="anonymous"></script><script src="dashboard.js"></script>
</body>
</html>