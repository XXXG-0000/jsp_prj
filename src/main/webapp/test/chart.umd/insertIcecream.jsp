<!-- 음료 정보 수정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="아이스크림을 추가하는 페이지"
    %>
<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>
<script src="/docs/5.3/assets/js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.122.0">
    <link rel="stylesheet" href="../css/orderStateList.css">
    <link rel="stylesheet" href="../css/orderDetails.css">
    <title>아이스크림 추가</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/dashboard/">
    <link rel="stylesheet" href="project_main.css?after">
    
	<!-- bootstrap -->
    <link href="bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />

	<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>  


    <link rel="stylesheet" href="css@3.css">
    <meta name="theme-color" content="#712cf9"> 
    <style type="text/css">

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
        
        h1 {
		    font-size: 24px;
		    color: #333;
		    text-align: center;
		    margin-bottom: 20px;
		}
		
        form { max-width: 500px; margin: 0 auto; }
		
		label {
		    font-size: 16px;
		    margin-bottom: 5px;
		}
		
		input[type="text"], textarea, input[type="file"] {
		    width: 100%;
		    padding: 10px;
		    margin-bottom: 15px;
		    border: 1px solid #ddd;
		    border-radius: 5px;
		    font-size: 14px;
		}
		
		textarea {
		    resize: none;
		}
		
		fieldset {
		    border: 1px solid #ddd;
		    padding: 10px;
		    margin-bottom: 15px;
		    border-radius: 5px;
		}
		
		legend {
		    font-size: 16px;
		    color: #333;
		    padding: 0 10px;
		}
		
		label input {
		    margin-right: 10px;
		}
		
		button {
		    padding: 10px 20px;
		    font-size: 16px;
		    background-color: #b12704;
		    color: white;
		    border: none;
		    border-radius: 5px;
		    cursor: pointer;
		    transition: background-color 0.3s ease;
		    margin-top: 10px;
		}
		
		button:hover {
		    background-color: #a02603;
		}
		
		/* 이미지 업로드 미리보기 */
		.image-upload {
		    display: flex;
		    align-items: center;
		}
		
		.image-upload img {
		    width: 100px;
		    height: 100px;
		    margin-bottom: 10px;
		    margin-right: 10px;
		    border-radius: 5px;
		    object-fit: cover;
		    border: 1px solid #ddd;
		}
		
		/* 옵션 설정 체크박스 */
		.option {
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    padding: 2px;
		    border-radius: 5px;
		    margin-bottom: 2px;
		    transition: background-color 0.3s ease;
		    
		}
		
		input[type="checkbox"] {
		    margin-left: auto;
		    transform: scale(1.2);
		}
		
		/* 체크박스 선택 시 배경색 변경 */
		input[type="checkbox"]:checked + label {
		    background-color: #d4f1c5;
		}
		
		input[type="checkbox"]:checked {
		    background-color: #d4f1c5;
		}
		
		.option-actions {
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		}
		
		.option-actions input {
		    width: 50%;
		    margin-right: 10px;
		}
		
		.option-actions button {
		    width: 22%;
		}
    </style>
    <script type="text/javascript">
    $(function(){
    	$("#chgSuccess").click(function(){
 			Swal.fire({
				icon: 'success',
				title: '추가 완료',
				text: '메뉴가 추가되었습니다.',
			}); 
		});//click
    });//ready
    </script>

	<script type="text/javascript">
	        // 이미지 미리보기 기능
	        function previewImage(event) {
	            const reader = new FileReader();
	            reader.onload = function(){
	                const imagePreview = document.getElementById('image-preview');
	                imagePreview.src = reader.result;
	                imagePreview.style.display = 'block';
	            }
	            reader.readAsDataURL(event.target.files[0]);
	        }
		
	        // 옵션 추가 기능
	        function addOption() {
	            const optionName = document.getElementById('new-option-name').value;
	            if (optionName) {
	                const optionsContainer = document.getElementById('options-container');
	                const newOptionDiv = document.createElement('div');
	                newOptionDiv.classList.add('option');
	                
	                const label = document.createElement('label');
	                label.textContent = optionName;
	                
	                const checkbox = document.createElement('input');
	                checkbox.type = 'checkbox';
	                
	                newOptionDiv.appendChild(label);
	                newOptionDiv.appendChild(checkbox);
	                optionsContainer.appendChild(newOptionDiv);
		
	                document.getElementById('new-option-name').value = ''; // 입력 필드 초기화
	            }
	        }
		
	        // 선택된 체크박스 옵션 삭제 기능
	        function removeCheckedOptions() {
	            const optionsContainer = document.getElementById('options-container');
	            const options = optionsContainer.querySelectorAll('.option');
	            
	            options.forEach(option => {
	                const checkbox = option.querySelector('input[type="checkbox"]');
	                if (checkbox.checked) {
	                    optionsContainer.removeChild(option);
	                }
	            });
	        }
	        
	      	//성분표 라디오 선택 여부 성분표 보여주기 기능
	        function toggleTable(show) {
	            const table = document.getElementById('nutrition-table');
	            table.style.display = show ? 'table' : 'none';
	        }
	      	
	        function toggleOption(show) {
	            const table = document.getElementById('options-container');
	            table.style.display = show ? 'block' : 'none';
	        }
	</script>

    <!-- Custom styles for this template -->
    <link href="../css/bootstrap-icons.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="../css/dashboard.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

</head>
<body>
<jsp:include page="svg.jsp"/> <!-- svg -->
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
                            <a class="nav-link d-flex align-items-center gap-2" href="http://localhost/jsp_prj/test/chart.umd/getListDrink.jsp">
                                <svg class="bi"><use xlink:href="#cup-hot"/></svg>
                                음료 관리
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2 active" href="http://localhost/jsp_prj/test/chart.umd/getListDessertIcecream.jsp">
                            	<svg class="bi"><use xlink:href="#cake"/></svg>
                                디저트&아이스크림 관리
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2" href="http://localhost/jsp_prj/test/chart.umd/getListOrder.jsp" data-bs-toggle="dropdown" aria-expanded="false">
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
                <h1 class="h2"><strong>아이스크림 추가</strong></h1>
            </div>

		<div class="plus-container">
		
		        <form>
		            <!-- 음료 이름 -->
		            <label for="drink-name">이름</label>
		            <input type="text" id="drink-name" name="drink-name" placeholder="아이스크림 이름을 입력하세요">
		            <label for="drink-name">영어 이름</label>
		            <input type="text" id="drink-name" name="drink-name" placeholder="아이스크림 영어 이름을 입력하세요">
		
		            <!-- 가격 -->
		            <label for="drink-price">가격</label>
		            <input type="text" id="drink-price" name="drink-price" placeholder="가격을 입력하세요">
		
		            <!-- 설명 -->
		            <label for="drink-description">설명</label>
		            <textarea id="drink-description" name="drink-description" rows="4" placeholder="아이스크림 설명을 입력하세요"></textarea>
		
		            <!-- 이미지 추가 -->
		            <label for="drink-image">이미지</label>
		            <div class="image-upload">
		                <img id="image-preview" src="#" alt="이미지 미리보기" style="display: none;" title="새 파일">
		                <input type="file" id="drink-image" name="drink-image" accept="image/*" onchange="previewImage(event)">
		            </div>
		
		            <!-- 카테고리 구분 -->
		            <fieldset>
		                <legend>카테고리</legend>
		                <label>아이스크림<input type="radio" name="category" value="icecream"></label>
		            </fieldset>
		
		            <!-- 구매 후 추가 옵션 -->
		            <fieldset>
		                <legend>추가 옵션 설정:</legend>
					    <div id="options-container">
					        <div class="option">
					            <label for="extra-shot">초콜릿 토핑 추가</label>
					            <input type="checkbox" id="extra-shot" name="extra-shot">
					        </div>
					        <div class="option">
					            <label for="size-option">딸기 베이스 추가</label>
					            <input type="checkbox" id="size-option" name="size-option">
					        </div>
					    </div>
					    <div class="option-actions">
					        <input type="text" id="new-option-name" placeholder="추가 옵션 이름">
				            <button type="button" class="btn btn-primary" onclick="addOption()">추가</button>
				            <button type="button" class="btn btn-danger" onclick="removeCheckedOptions()">삭제</button>
					    </div>
		            </fieldset>
		
		            <!-- 영양 성분표 제공 여부 -->
		                   <fieldset>
		    <legend>영양 성분표 제공 여부:</legend>
		    <label><input type="radio" name="nutritional-info" value="yes" onclick="toggleTable(true)"> 제공</label>
		    <label><input type="radio" name="nutritional-info" value="no" onclick="toggleTable(false)"> 미제공</label>
		
		    <table id="nutrition-table">
		        <tr>
		            <th>성분</th>
		            <th>함량</th>
		        </tr>
		        <tr>
		            <td>카페인</td>
		            <td><input type="text" value="59 mg"></td>
		        </tr>
		        <tr>
		            <td>칼로리</td>
		            <td><input type="text" value="2 kcal"></td>
		        </tr>
		        <tr>
		            <td>지방</td>
		            <td><input type="text" value="0 g"></td>
		        </tr>
		        <tr>
		            <td>탄수화물</td>
		            <td><input type="text" value="0 g"></td>
		        </tr>
		        <tr>
		            <td>단백질</td>
		            <td><input type="text" value="0.3 g"></td>
		        </tr>
		    </table>
		</fieldset>
		
		            <!-- 제출 버튼 -->
		            <button type="button" class="btn btn-primary" id="chgSuccess">추가 메뉴 저장</button>
		        </form>
		    </div>

        </main>
    </div>
</div>
<script src="bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<script src="chart.umd.js" integrity="sha384-eI7PSr3L1XLISH8JdDII5YN/njoSsxfbrkCTnJrzXt+ENP5MOVBxD+l6sEG4zoLp" crossorigin="anonymous"></script><script src="dashboard.js"></script></body>
</html>