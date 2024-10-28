<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="디저트, 아이스크림을 관리하는 페이지"
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
    <link rel="stylesheet" href="http://localhost/jsp_prj/admin/common/css/project_main.css">
    <!-- Custom styles for this template -->
    <link href="http://localhost/jsp_prj/admin/common/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="http://localhost/jsp_prj/admin/common/css/dashboard.css" rel="stylesheet">
    
	<!-- bootstrap -->
    <link href="bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />

    <!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>    
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	

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
		.dessertImg, .iceImg { width: 40px; height: 50px;}
		
		/* 숨기기 */
		.hidden {
		    display: none;
		}
        
    </style>

<script type="text/javascript">
//탭을 보여주는 함수
$(function(){
	$("#btnradio1").click(function(){
		showTab('dessertChart');
	});//click
	
	$("#btnradio2").click(function(){
		showTab('icecreamChart');
	});//click
	
	$("span").click(function(){
		alert($("span").value);
	})
});//ready

function showTab(tab) {
    document.getElementById('dessertChart').classList.add('hidden');
    document.getElementById('icecreamChart').classList.add('hidden');
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
<jsp:include page="../common/svg.jsp"/> <!-- svg -->
<jsp:include page="../common/headbar.jsp"/> <!-- headbar -->
<div class="container-fluid">
    <div class="row">
        <div class="border border-right col-md-3 col-lg-2 p-0 bg-body-tertiary">
            <div class="offcanvas-md offcanvas-end bg-body-tertiary" tabindex="-1" id="sidebarMenu" aria-labelledby="sidebarMenuLabel">

                <div class="offcanvas-body d-md-flex flex-column p-0 pt-lg-3 overflow-y-auto">
                    <ul class="nav nav-pills flex-column">
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" aria-current="page" href="http://localhost/jsp_prj/admin/dashboard/dashboard.jsp">
                                <i class="bi bi-house"></i>
                                관리자 대시보드
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" href="http://localhost/jsp_prj/admin/menu/getListDrink.jsp">
                                <svg class="bi"><use xlink:href="#cup-hot"/></svg>
                                음료 관리
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2 active" href="http://localhost/jsp_prj/admin/menu/getListDessertIcecream.jsp">
                            	<svg class="bi"><use xlink:href="#cake"/></svg>
                                디저트&아이스크림 관리
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" href="http://localhost/jsp_prj/admin/order/getListOrder.jsp">
                                <i class="bi bi-cart"></i>
                                	주문 관리
                            </a>                                                        
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" href="http://localhost/jsp_prj/admin/member/getListMember.jsp">
                                <i class="bi bi-people"></i>
                                회원 관리
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" href="http://localhost/jsp_prj/admin/voc/getListCustomSound.jsp">
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
                <h1 class="h2"><strong>디저트 & 아이스크림 관리</strong></h1>
            </div>
			<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups" style="margin-bottom: 10px;">
			 <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
			  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
			  <label class="btn btn-outline-primary" for="btnradio1" class="btnradio1">디저트</label>
			
			  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
			  <label class="btn btn-outline-primary" for="btnradio2" class="btnradio2">아이스크림</label>
			</div>
			</div>
		<form>
        <table id="dessertChart">
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
                <td >1</td>
                <td><img class="dessertImg" src="http://localhost/jsp_prj/admin/common/image/%ED%81%AC%EB%A6%AC%EB%AF%B8%EC%8A%88-450x588.png">
                <a href="updateDessert.jsp">크리미슈</a></td>
                <td>2,000</td>
                <td>디저트</td>
            </tr>
            <tr>
                <td>2</td>
                <td><img class="dessertImg" src="http://localhost/jsp_prj/admin/common/image/32%EA%B2%B9_%ED%9B%84%EB%A0%88%EC%89%AC%EB%B2%88-450x588.jpg">
				<a href="updateDessert.jsp">32겹 후레쉬번</a></td>
                <td>3,300</td>
                <td>디저트</td>
            </tr>
            <tr>
                <td>3</td>
                <td><img class="dessertImg" src="http://localhost/jsp_prj/admin/common/image/%EC%95%84%EC%9D%B4%EC%8A%A4-%EC%9A%B0%EC%9C%A0%ED%81%AC%EB%A6%BC%EB%B9%B5-450x588.png">
                <a href="updateDessert.jsp">아이스 우유크림빵</a></td>
                <td>2,800</td>
                <td>디저트</td>
            </tr>
            <tr>
                <td>4</td>
                <td><img class="dessertImg" src="http://localhost/jsp_prj/admin/common/image/%ED%81%AC%EB%A3%BD%EC%A7%80-450x588.png">
                <a href="updateDessert.jsp">크룽지</a></td>
                <td>2,800</td>
                <td>디저트</td>
            </tr>
            <tr>
                <td>5</td>
                <td><img class="dessertImg" src="http://localhost/jsp_prj/admin/common/image/%EC%86%8C%EA%B8%88%EB%B9%B5-450x588-450x588.png">
               	<a href="updateDessert.jsp">고메버터소금빵</a></td>
                <td>2,500</td>
                <td>디저트</td>
            </tr>
            <tr>
                <td>6</td>
                <td><img class="dessertImg" src="http://localhost/jsp_prj/admin/common/image/%EC%82%AC%EB%9D%BC%EB%8B%A4%EB%B9%B5-450x588.png">
                <a href="updateDessert.jsp">사라다빵</a></td>
                <td>3,500</td>
                <td>디저트</td>
            </tr>
        </tbody>
        </table>
        
        <table id="icecreamChart" class="hidden">
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
                <td><img class="iceImg" src="http://localhost/jsp_prj/admin/common/image/%EB%85%B8%EB%A7%90%ED%95%9C%EC%86%8C%ED%94%84%ED%8A%B8-3-450x588.png">
                <a href="updateIcecream.jsp">소프트 아이스크림</a></td>
                <td>1,500</td>
                <td>아이스크림</td>
            </tr>
            <tr>
                <td>2</td>
                <td><img class="iceImg" src="http://localhost/jsp_prj/admin/common/image/%EB%85%B8%EB%A7%90%ED%95%9C%EC%86%8C%ED%94%84%ED%8A%B8-3-450x588.png">
                <a href="updateIcecream.jsp">소프트 아이스크림</a></td>
                <td>2,000</td>
                <td>아이스크림</td>
            </tr>
            <tr>
                <td>3</td>
                <td><img class="iceImg" src="http://localhost/jsp_prj/admin/common/image/%EB%85%B8%EB%A7%90%ED%95%9C%EC%86%8C%ED%94%84%ED%8A%B8-3-450x588.png">
                <a href="updateIcecream.jsp">소프트 아이스크림</a></td>
                <td>2,500</td>
                <td>아이스크림</td>
            </tr>
            <tr>
                <td>4</td>
                <td><img class="iceImg" src="http://localhost/jsp_prj/admin/common/image/%EB%85%B8%EB%A7%90%ED%95%9C%EC%86%8C%ED%94%84%ED%8A%B8-3-450x588.png">
                <a href="updateIcecream.jsp">소프트 아이스크림</a></td>
                <td>2,500</td>
                <td>아이스크림</td>
            </tr>
            <tr>
                <td>5</td>
                <td><img class="iceImg" src="http://localhost/jsp_prj/admin/common/image/%EB%85%B8%EB%A7%90%ED%95%9C%EC%86%8C%ED%94%84%ED%8A%B8-3-450x588.png">
                <a href="updateIcecream.jsp">소프트 아이스크림</a></td>
                <td>3,500</td>
                <td>아이스크림</td>
            </tr>
            <tr>
                <td>6</td>
                <td><img class="iceImg" src="http://localhost/jsp_prj/admin/common/image/%EB%85%B8%EB%A7%90%ED%95%9C%EC%86%8C%ED%94%84%ED%8A%B8-3-450x588.png">
                <a href="updateIcecream.jsp">소프트 아이스크림</a></td>
                <td>3,500</td>
                <td>아이스크림</td>
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
        	<button class="btn btn-primary" style="border:none; float: right; border-radius: 20px; padding: 10px;">
        		<a href="insertDessertIcecream.jsp" style="color:#FFF; font-weight: bold;">
        		<svg class="bi"><use xlink:href="#plus-circle"/></svg> 아이스크림 추가</a>
        	</button>
        	<button class="btn btn-warning" style="border:none; float: right; border-radius: 20px; margin-right: 10px; padding: 10px;">
        		<a href="insertDessertIcecream.jsp" style="color:#FFF; font-weight: bold;">
        		<svg class="bi"><use xlink:href="#plus-circle"/></svg> 디저트 추가</a>
        	</button>
            <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>
        </main>
    </div>
</div>
<script src="bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<script src="chart.umd.js" integrity="sha384-eI7PSr3L1XLISH8JdDII5YN/njoSsxfbrkCTnJrzXt+ENP5MOVBxD+l6sEG4zoLp" crossorigin="anonymous"></script><script src="dashboard.js"></script>
</body>
</html>