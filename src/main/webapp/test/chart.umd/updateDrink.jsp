<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="음료 정보 수정"
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
    <title>주문 상태 확인</title>
    
	<!-- bootstrap -->
    <link href="bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/dashboard/">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
	
    <link rel="stylesheet" href="project_main.css">
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
		    color: #333;
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
		
		/* 이미지 업로드 미리보기 */
		.image-upload {
		    display: flex;
		    align-items: center;
		}
		
		.image-upload img {
		    width: 100px;
		    height: 100px;
		    margin-right: 10px;
		    margin-bottom: 10px;
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
     	$("#confirm").click(function(){
			window.close();
     	});//click
     	
    	$("#answer").click(function(){
 			Swal.fire({
				icon: 'success',
				title: '수정 완료',
				text: '메뉴가 수정되었습니다.',
			}); 
		});//click
     	
    	$("#delete").click(function(){
            Swal.fire({
                title: '현재 메뉴를 삭제하시겠습니까?',
                text: "다시 되돌릴 수 없습니다. 신중하세요.",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '삭제',
                cancelButtonText: '취소'
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire(
                       '삭제 완료 !',
                       '메뉴가 삭제 되었습니다 !'
                    )//fire
                }// end if
            })//fire
		});//click
    });//ready
    
    var myModalEl = document.getElementById('modify-confirm')
    myModalEl.addEventListener('hidden.bs.modal', function (event) {
  	// do something...
  	
	});
    </script>
    <script>
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
                <h1 class="h2"><strong>음료 상세 보기</strong></h1>
            </div>

		<div class="form-container">

        <form>
            <!-- 음료 이름 -->
            <label for="drink-name">이름</label>
            <input type="text" id="drink-name" name="drink-name" placeholder="음료 이름을 입력하세요" value="아메리카노(HOT)">
            <label for="drink-name">영어 이름</label>
            <input type="text" id="drink-name" name="drink-name" placeholder="음료 이름을 입력하세요" value="Americano(HOT)">

            <!-- 가격 -->
            <label for="drink-price">가격</label>
            <input type="text" id="drink-price" name="drink-price" placeholder="가격을 입력하세요" value="1,500">

            <!-- 설명 -->
            <label for="drink-description">설명</label>
            <textarea id="drink-description" name="drink-description" rows="4" placeholder="음료 설명을 입력하세요">빽다방만의 맛과 향을 더한 100% 아라비카 로스팅 원두로 뽑아내 깊고 진한 맛의 앗!메리카노
            </textarea>

            <!-- 이미지 추가 -->
            <label for="drink-image">이미지</label>
            <div class="image-upload">
                <img id="image-preview" src="http://localhost/jsp_prj/test/image/HOT-%EC%95%97%EB%A9%94%EB%A6%AC%EC%B9%B4%EB%85%B8-450x588.png" alt="이미지 미리보기" style="">
                <input type="file" id="drink-image" name="drink-image" accept="image/*" onchange="previewImage(event)">
            </div>

			<!-- 카테고리 구분 -->
			<fieldset>
			    <legend>카테고리</legend>
			    <label>커피<input type="radio" name="category" value="coffee"></label>
			    <label>음료<input type="radio" name="category" value="drink"></label>
			</fieldset>
			
			<!-- 구매 후 추가 옵션 -->
			<fieldset>
			    <legend>추가 옵션 설정:</legend>
			    <div id="options-container">
			        <div class="option">
			            <label for="extra-shot">샷 추가</label>
			            <input type="checkbox" id="extra-shot" name="extra-shot">
			        </div>
			        <div class="option">
			            <label for="size-option">사이즈 선택</label>
			            <input type="checkbox" id="size-option" name="size-option">
			        </div>
			        <div class="option">
			            <label for="syrup-option">시럽 추가</label>
			            <input type="checkbox" id="syrup-option" name="syrup-option">
			        </div>
			        <div class="option">
			            <label for="reusable-cup">다회용 컵 사용</label>
			            <input type="checkbox" id="reusable-cup" name="reusable-cup">
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
			            <td><input type="text" value="237 mg"></td>
			        </tr>
			        <tr>
			            <td>칼로리</td>
			            <td><input type="text" value="14 kcal"></td>
			        </tr>
			        <tr>
			            <td>나트륨</td>
			            <td><input type="text" value="4 g"></td>
			        </tr>
			        <tr>
			            <td>당류</td>
			            <td><input type="text" value="0 g"></td>
			        </tr>
			        <tr>
			            <td>포화지방</td>
			            <td><input type="text" value="0 g"></td>
			        </tr>
			        <tr>
			            <td>단백질</td>
			            <td><input type="text" value="0 g"></td>
			        </tr>
			    </table>
			</fieldset>
			
			            <!-- 제출 버튼 -->
			            <!-- <button type="submit">수정 내용 저장</button> -->
			            <button type="button" style="float: none;" class="confirm" id="confirm">확인</button>	        
				        <button type="button" style="float: none;" class="answer" id="answer">정보 수정</button>
				        <button type="button" style="float: none;" class="cancel delete" id="delete">삭제</button>
			        </form>
			    </div>

            <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>
        </main>
    </div>
</div>
<script src="bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<script src="chart.umd.js" integrity="sha384-eI7PSr3L1XLISH8JdDII5YN/njoSsxfbrkCTnJrzXt+ENP5MOVBxD+l6sEG4zoLp" crossorigin="anonymous"></script><script src="dashboard.js"></script></body>
</body>
<!-- 모달 버튼 -->
    <!-- 
        btn : [bootstrap] 버튼 사용
        btn-sm : [bootstrap] 작은 버튼
        btn-info : [bootstrap] 버튼 테마 적용(청색)
        ml-2 : [bootstrap] margin left의 줄임말, - 뒤 숫자 만큼 margin을 줌
        mt-2 : [bootstrap] margin top의 줄임말, - 뒤 숫자 만큼 margin을 줌
        modalBtn : 작성자는 클릭 이벤트에 사용, 여러 버튼을 사용할 때 주로 이용함
     -->
<!-- modal 공간 -->
<div class="modal fade" id="delete-confirm" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">경고</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="text-align: center;">
      	<span style="font-size: 20px;"><strong>고객의 소리를 삭제하시겠습니까?</strong></span><br><br>
      	이 작업은 되돌릴 수 없습니다.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-danger" id="delete">삭제</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="answer-confirm" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
  
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">알림</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="text-align: center;">
      	<span style="text-align: center;">정보가 수젱되었습니다.</span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="answer-alert" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
  
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">알림</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="text-align: center;">
      	<span style="text-align: center;">답변을 입력해주세요.</span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>

</html>