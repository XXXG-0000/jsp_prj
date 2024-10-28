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
    <title>회원 관리 페이지</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/dashboard/">
    <link rel="stylesheet" href="http://localhost/jsp_prj/admin/common/css/project_main.css">
    <!-- Custom styles for this template -->
    <link href="http://localhost/jsp_prj/admin/common/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="http://localhost/jsp_prj/admin/common/css/dashboard.css" rel="stylesheet">
    
	<!-- bootstrap -->
    <link href="bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />

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
        a {	text-decoration: none; color: #333;	}
		a:hover { text-decoration: underline; }
        span.active { padding: 10px; color: #FFF; background-color: #4CAF50; border-radius: 20px }
		span.inactive { padding: 10px; color: #FFF; background-color: #CC0000; border-radius: 20px }
		#subject { width: 150px; height: 44px; }
		th, td {
			border: 1px solid #ddd;
			padding: 12px;
			text-align: left;
		}
		
        
    </style>




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
                            <a class="nav-link d-flex align-items-center gap-2" href="http://localhost/jsp_prj/admin/order/getListOrder.jsp">
                                <i class="bi bi-cart"></i>
                                	주문 관리
                            </a>                                                        
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2 active" href="http://localhost/jsp_prj/admin/member/getListMember.jsp">
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
                <h1 class="h2"><strong>회원관리</strong></h1>
                <jsp:include page="../common/jsp/toolbar.jsp"/> <!-- toolbar -->
            </div>
            <!--  -->
       <div class="search-bar">
      	<select id="subject" class="search-bar">
			<option value="">--분류--</option>
			<option value="id" name="cusId">ID</option>
			<option value="이름" name="name">이름</option>
		</select>
        <input type="text" class="keyword" name="keyword" placeholder="회원 검색...">
        <button>검색</button>
    </div>

	<form>
    <table class="user">
        <thead>
            <tr>
                <th class="id">ID</th>
                <th class="name">이름</th>
                <th class="phone">휴대전화</th>
                <th class="email">이메일</th>                
                <th class="inputDate">가입날짜</th>                
                <th class="grade">회원 등급</th>
                <th class="cusFlag">회원 상태</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="id"><a href="http://localhost/jsp_prj/admin/member/updateMember.jsp">user1</a></td>
                <td class="name">김회원</td>
                <td class="phone">010-1234-5678</td>
                <td class="email">test@test1.com</td>
                <td class="inputDate">2024-09-25</td>
                <td class="grade">실버</td>
                <td class="cusFlag"><span class="active">활동</span></td>
            </tr>
            <tr>
                <td class="id"><a href="http://localhost/jsp_prj/admin/member/updateMember.jsp">user22</a></td>
                <td class="name">이유저</td>
                <td class="phone">010-2345-6789</td>
                <td class="email">test2@test2.com</td>
                <td class="inputDate">2024-09-25</td>
                <td class="grade">골드</td>
                <td class="cusFlag"><span class="active">활동</span></td>
            </tr>
            <tr>
                <td class="id"><a href="http://localhost/jsp_prj/admin/member/updateMember.jsp">userXrd</a></td>
                <td class="name">박사원</td>
                <td class="phone">010-3333-4545</td>
                <td class="email">test3@test3.com</td>
                <td class="inputDate">2024-09-25</td>    
                <td class="grade">실버</td>
                <td class="cusFlag"><span class="active">활동</span></td>
            </tr>
            <tr>
                <td class="id"><a href="http://localhost/jsp_prj/admin/member/updateMember.jsp">user4th</a></td>
                <td class="name">최멤버</td>
                <td class="phone">010-4321-5978</td>
                <td class="email">test4@test4.com</td>
                <td class="inputDate">2024-09-25</td>
                <td class="grade">실버</td>
                <td class="cusFlag"><span class="inactive">탈퇴</span></td>
            </tr>
            <tr>
                <td class="id"><a href="http://localhost/jsp_prj/admin/member/updateMember.jsp">user555</a></td>
                <td class="name">정가입</td>
                <td class="phone">010-5678-9999</td>
                <td class="email">test5@test5.com</td>
                <td class="inputDate">2024-09-25</td>
                <td class="grade">실버</td>
                <td class="cusFlag"><span class="active">활동</span></td>
            </tr>
            <tr>
                <td class="id"><a href="http://localhost/jsp_prj/admin/member/updateMember.jsp">6ser</a></td>
                <td class="name">황보레옹</td>
                <td class="phone">010-9797-1597</td>
                <td class="email">test6@test6.com</td>
                <td class="inputDate">2024-09-25</td>
                <td class="grade">골드</td>
                <td class="cusFlag"><span class="inactive">탈퇴</span></td>
            </tr>
            <tr>
                <td class="id"><a href="http://localhost/jsp_prj/admin/member/updateMember.jsp">user777</a></td>
                <td class="name">김신입</td>
                <td class="phone">010-7777-7777</td>
                <td class="email">test7@test7.com</td>
                <td class="inputDate">2024-09-25</td>
                <td class="grade">골드</td>
                <td class="cusFlag"><span class="active">활동</span></td>
            </tr>
            <tr>
                <td class="id"><a href="http://localhost/jsp_prj/admin/member/updateMember.jsp">user8888</a></td>
                <td class="name">하완장</td>
                <td class="phone">010-4567-8888</td>
                <td class="email">test8@test8.com</td>
                <td class="inputDate">2024-09-25</td>
                <td class="grade">실버</td>
                <td class="cusFlag"><span class="inactive">탈퇴</span></td>
            </tr>
            <tr>
                <td class="id"><a href="http://localhost/jsp_prj/admin/member/updateMember.jsp">user999</a></td>
                <td class="name">강철</td>
                <td class="phone">010-1875-0999</td>
                <td class="email">test9@test9.com</td>
                <td class="inputDate">2024-09-25</td>
                <td class="grade">실버</td>
                <td class="cusFlag"><span class="active">활동</span></td>
            </tr>
            <tr>
                <td class="id"><a href="http://localhost/jsp_prj/admin/member/updateMember.jsp">user0000</a></td>
                <td class="name">장난감</td>
                <td class="phone">010-1577-8848</td>
                <td class="email">test0@test10.com</td>
                <td class="inputDate">2024-09-25</td>
                <td class="grade">실버</td>
                <td class="cusFlag"><span class="active">활동</span></td>
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

        </main>
    </div>
</div>
<script src="bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<script src="chart.umd.js" integrity="sha384-eI7PSr3L1XLISH8JdDII5YN/njoSsxfbrkCTnJrzXt+ENP5MOVBxD+l6sEG4zoLp" crossorigin="anonymous"></script><script src="dashboard.js"></script></body>
</html>