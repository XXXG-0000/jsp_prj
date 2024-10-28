<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="주문 관리 페이지"
    %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.122.0">
    <link rel="stylesheet" href="http://localhost/jsp_prj/project/chart.umd/css/orderStateList.css">
    <link rel="stylesheet" href="http://localhost/jsp_prj/project/chart.umd/css/orderDetails.css">
    <title>주문 상태 확인</title>
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
        
        form { max-width: 900px; margin: 0 auto; }
        th { text-align: center; }
        
		 /* 상태에 따른 색상 */
		.status {
		    font-weight: bold;
		    border-radius: 20px;
		    padding: 10px;
		}
		
		.completed {
		    background-color: #4CAF50;
		    color: white;
		}
		
		.pending {
		    background-color: #FFA500;
		    color: white;
		}       
    </style>
    <style>
        .search-bar { margin-bottom: 20px; }
        .search-bar input { padding: 8px; width: 300px; }
        .search-bar button { padding: 8px 16px; background-color: #4CAF50; color: white; border: none; cursor: pointer; }
        .actions button { margin-right: 5px; padding: 6px 12px; cursor: pointer; border: none; color: white; }
        .edit-btn { background-color: #FFD700; }
        .delete-btn { background-color: #FF0000; }
        .add-member { background-color: #4CAF50; color: white; border: none; padding: 10px 20px; cursor: pointer; }
        .orderCode { cursor: pointer; }
        
        .received { padding: 10px; color: #000; background-color: #00F200; border-radius: 45% }
		.not-received { padding: 10px; color: #000; background-color: #F20000; border-radius: 45% }
        .close { color: #aaa; float: right; font-size: 28px; font-weight: bold; }
        .close:hover, .close:focus { color: black; text-decoration: none; cursor: pointer; }
        .confirm-delete { background-color: #FF0000; color: white; border: none; }
        .cancel-delete { background-color: #f2f2f2; color: black; border: 1px solid #ddd; }
        #drinkImg { width: 40px; height: 50px;}
    </style>

    <script type="text/javascript">
	    // 탭을 보여주는 함수
	    $(function(){
			$("#btnradio1").click(function(){
				showTab('not-received');
			});//click
			
			$("#btnradio2").click(function(){
				showTab('received');
			});//click
			
			$(".orderCode").click(function(){
				openPopup();
			});//click
	    });//ready
	    
	    function showTab(tab) {
	        document.getElementById('received').classList.add('hidden');
	        document.getElementById('not-received').classList.add('hidden');
	        document.getElementById(tab).classList.remove('hidden');
	    }
	
	    // 테이블 정렬 함수
	    let sortDirection = true; // true는 오름차순, false는 내림차순
	    function sortTable(columnIndex, tableId) {
	        let table = document.getElementById(tableId);
	        let rows = Array.from(table.querySelectorAll('tbody tr'));
	        let isDateColumn = columnIndex === 1; // 날짜 정렬
	
	        rows.sort((rowA, rowB) => {
	            let cellA = rowA.cells[columnIndex].innerText;
	            let cellB = rowB.cells[columnIndex].innerText;
	
	            if (isDateColumn) {
	                // 날짜 형식 비교 (YYYY-MM-DD)
	                return sortDirection ? new Date(cellA) - new Date(cellB) : new Date(cellB) - new Date(cellA);
	            } else {
	                // 문자열을 숫자로 변환해서 비교 (주문 ID)
	                return sortDirection ? cellA.localeCompare(cellB, undefined, {numeric: true}) : cellB.localeCompare(cellA, undefined, {numeric: true});
	            }
	        });
	
	        // 정렬된 행들을 테이블에 다시 추가
	        let tbody = table.querySelector('tbody');
	        tbody.innerHTML = '';
	        rows.forEach(row => tbody.appendChild(row));
	
	        // 다음 정렬 방향 반전
	        sortDirection = !sortDirection;
	    }
    </script>
    <script type="text/javascript">
        function openPopup() {
            document.getElementById('popupBackground').style.display = 'block';
        }

        function closePopup() {
            document.getElementById('popupBackground').style.display = 'none';
        }
    </script>
    
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
                            <a class="nav-link d-flex align-items-center gap-2" href="http://localhost/jsp_prj/admin/menu/getListDessertIcecream.jsp">
                            	<svg class="bi"><use xlink:href="#cake"/></svg>
                                디저트&아이스크림 관리
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2 active" href="http://localhost/jsp_prj/admin/order/getListOrder.jsp">
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
	    <h1 class="h2"><strong>주문 상태 리스트</strong></h1>
	</div>

    <!-- 탭 메뉴 -->
<!--     <div class="tab-container">
        <div class="tab" onclick="showTab('received')">수령 완료</div>
        <div class="tab" onclick="showTab('not-received')">미수령</div>
    </div> -->
    
    <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups" style="margin-bottom: 10px;">
		<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
			  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
			  <label class="btn btn-outline-primary" for="btnradio1" class="btnradio1">미수령</label>
			
			  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
			  <label class="btn btn-outline-primary" for="btnradio2" class="btnradio2">수령</label>
		</div>
	</div>
	
    <form>
    <!-- 미수령 주문 -->
    <table id="not-received">
        <thead>
            <tr>
                <th class="sortable" onclick="sortTable(0, 'not-received')">번호 @</th>
                <th>상품 이름</th>
                <th class="orderPopup" onclick="openPopup()">주문자</th>
                <th class="sortable" onclick="sortTable(3, 'not-received')">주문 시간 @</th>
                <th>주문 수량</th>
                <th>주문 상태</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>ON_004</td>
                <td>아이스 아메리카노</td>
                <td>한잔만</td>
                <td>2024-10-11</td>
                <td>4 잔</td>
                <td><span class="status pending">미수령</span></td>
            </tr>
            <tr>
                <td>ON_005</td>
                <td>녹차</td>
                <td>한잔만</td>
                <td>2024-10-12</td>
                <td>4 잔</td>
                <td><span class="status pending">미수령</span></td>
            </tr>
            <tr>
                <td>ON_006</td>
                <td>식혜</td>
                <td>한잔만</td>
                <td>2024-10-13</td>
                <td>4 잔</td>
                <td><span class="status pending">미수령</span></td>
            </tr>
        </tbody>
    </table>
    
    <!-- 수령 완료 주문 -->
    <table id="received" class="hidden">
        <thead>
            <tr>
                <th class="sortable" onclick="sortTable(0, 'received')">번호 @</th>
                <th>상품 이름</th>
                <th>주문자</th>
                <th class="sortable" onclick="sortTable(3, 'received')">주문 시간 @</th>
                <th>주문 수량</th>
                <th>주문 상태</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>ON_001</td>
                <td>아이스 아메리카노</td>
                <td>한잔만</td>
                <td>2024-10-11</td>
                <td>4 잔</td>
               <td><span class="status completed">수령 완료</span></td>
            </tr>
            <tr>
                <td>ON_002</td>
                <td>아이스 아이스크림</td>
                <td>한잔만</td>
                <td>2024-10-12</td>
                <td>4 잔</td>
               <td><span class="status completed">수령 완료</span></td>
            </tr>
            <tr>
                <td>ON_003</td>
                <td>구아바 크림 주스</td>
                <td>한잔만</td>
                <td>2024-10-13</td>
                <td>4 잔</td>
               <td><span class="status completed">수령 완료</span></td>
            </tr>
            <tr>
                <td>ON_004</td>
                <td>구아바 크림 주스</td>
                <td>한잔만</td>
                <td>2024-10-13</td>
                <td>4 잔</td>
                <td><span class="status completed">수령 완료</span></td>
            </tr>
            <tr>
                <td>ON_005</td>
                <td>구아바 크림 주스</td>
                <td>한잔만</td>
                <td>2024-10-12</td>
                <td>4 잔</td>
                <td><span class="status completed">수령 완료</span></td>
            </tr>
            <tr>
                <td>ON_006</td>
                <td>구아바 크림 주스</td>
                <td>한잔만</td>
                <td>2024-10-11</td>
                <td>4 잔</td>
                <td><span class="status completed">수령 완료</span></td>
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
						<li class="page-item">
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
    <!-- <button onclick="openPopup()">주문 상세 보기</button> -->
			<canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>
        </main>
    </div>
</div>
	
    <!-- 팝업 배경 -->
    <div id="popupBackground" class="popup-background">
        <!-- 팝업 창 -->
        <div class="popup">
            <h1>주문 상세 정보</h1>

            <div class="order-info">
                <span>주문 번호: ON_001</span>
                <span>주문일자: 2024-10-11</span>
            </div>

            <table>
                <thead>
                    <tr>
                        <th>상품명</th>
                        <th>수량</th>
                        <th>가격</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>아이스 아메리카노</td>
                        <td>1</td>
                        <td>₩3,000</td>
                    </tr>
                    <tr>
                        <td>사라다 빵</td>
                        <td>2</td>
                        <td>₩5,000</td>
                    </tr>
                </tbody>
            </table>

            <div class="customer-info">
                <span>주문자: 한잔만</span>
                <span>회원 등급: 실버</span>
            </div>

            <div class="total-amount">총 결제 금액: ₩13,000</div>

            <button class="close-btn" onclick="closePopup()">확인</button>
        </div>
    </div>
</body>
</html>
