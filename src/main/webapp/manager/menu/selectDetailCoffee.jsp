<%@page import="project.manager.menu.IngredientVO"%>
<%@page import="project.manager.menu.DrinkOptionVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="project.manager.menu.ProductVO"%>
<%@page import="project.manager.menu.SearchVO"%>
<%@page import="project.manager.menu.DrinkDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="커피 정보 읽기"
    %>
<%--관리자 세션을 검증하는 jsp include--%>
<%-- <jsp:include page="../common/jsp/manager_session_chk.jsp"/> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
// 실제 커피 메뉴의 상품 번호를 받는다.
	String tempNum = request.getParameter("itemNum");
	int itemNum = 0;
	try {
		itemNum = Integer.parseInt(tempNum);
	} catch(NumberFormatException nfe) {
		response.sendRedirect("selectCoffeeList.jsp"); // 커피 목록으로 반환
		return;
	}// end catch
	
	// 입력된 아이템 번호로 상세 조회 수행
	DrinkDAO dDAO = DrinkDAO.getInstance();
	
	ProductVO pVO = null;
	DrinkOptionVO oVO = null;
	IngredientVO iVO = null;
	
	try{
		pVO = dDAO.selectDetailItemBoard(itemNum);
		oVO = dDAO.selectDetailOptionBoard(itemNum);
		iVO = dDAO.selectDetailIngredientBoard(itemNum);
	} catch(SQLException se){
		se.printStackTrace();
	}// end catch
	
	pageContext.setAttribute("pVO", pVO);
	pageContext.setAttribute("oVO", oVO);
	pageContext.setAttribute("iVO", iVO);
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
    <link rel="stylesheet" href="http://localhost/jsp_prj/project/chart.umd/css/orderStateList.css">
    <link rel="stylesheet" href="http://localhost/jsp_prj/project/chart.umd/css/orderDetails.css">
    <title>주문 상태 확인</title>
  	<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/dashboard/">
    <link rel="stylesheet" href="http://localhost/jsp_prj/manager/common/css/project_main.css">
    <!-- Custom styles for this template -->
    <link href="http://localhost/jsp_prj/manager/common/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="http://localhost/jsp_prj/manager/common/css/dashboard.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    
	<!-- bootstrap -->
    <link href="bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />

	<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>  

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
        a { text-decoration: none; color: #FFF; }
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
			//var url="http://localhost/jsp_prj/manager/menu/selectCoffeeList.jsp?currentPage=${ param.currentPage }"
			var url="http://localhost/jsp_prj/manager/menu/selectCoffeeList.jsp?currentPage=${ param.currentPage }"
					
			// param.currentPage: input type hidden 사용해 넘긴다.
			if(${ not empty param.keyword }){ // 키워드가 있을 경우
				url += "&keyword=${ param.keyword }"			
			}// end if
			location.href = url;
     	});//click
     	
    	$("#answer").click(function(){
 			movePage('u');
		});//click
     	
    	$("#cancel").click(function(){
			movePage('d');
    	});//click
    });//ready

    function movePage(flag){
		var action="updateCoffeeDrink.jsp";
		var msg="메뉴를 수정하시겠습니까?";
		
		if(flag == 'd'){
			action = "deleteCoffee.jsp";
			msg = "정말 메뉴를 삭제하시겠습니까?"
		}// end if
		
		// 사용자에게 확인을 거친다
		if(confirm(msg)){
			//폼태그 객체의 action 속성 변경
			document.readFrm.action = action;
			
			$("#readFrm").submit();//form 전송
		}// end if
    }//movePage
    
    function chkNull(){
		// 이름 체크
		if($("#nameKor").val().trim() == ""){
			alert("이름은 필수 입력입니다!");
			$("#nameKor").focus();
			return;
		}
		
		if($("#nameEng").val().trim() == ""){
			alert("이름은 필수 입력입니다!");
			$("#nameEng").focus();
			return;
		}//end if
		
		// 가격 체크
		if($("#price").val().trim() == ""){
			alert("가격은 필수 입력입니다!");
			$("#price").focus();
			return;
		}//end if
		
		// 설명 체크
		if($("#description").val().trim() == ""){
			alert("설명은 필수 입력입니다!");
			$("#description").focus();
			return;
		}//end if
		
		// 이미지 첨부 체크
/* 		if(!$("#image").val()){
			alert("이미지 첨부는 필수입니다!");
			return;
		}//end if */
		
		// 카테고리 설정 체크
		if(!$('input:radio[name="categoriesNum"]').is(':checked')){
			alert("카테고리 설정은 필수입니다!");
			return;
		}//end if
		
		// 기옵 옵션 설정 체크
		// 샷 설정
		if($("#shot").val() == ""){
			alert("기본 샷 설정은 필수입니다!");
			return;
		}//end if
		
		// 시럽 설정
		if($("#syrup").val() == ""){
			alert("기본 시럽 설정은 필수입니다!");
			return;
		}//end if
		
		// 영양 성분표 제공 여부
		if(!$('input:radio[name="ingredientFlag"]').is(':checked')){
			alert("영양 성분표 제공 여부 설정은 필수입니다!");
			return;
		}//end if
		
		// 영양 성분표 제공시
		if(('input:radio[name="ingredientFlag"]:checked').val == "Y"){
			// 카페인
			if($("#caffeine").val() == ""){
				alert("카페인 성분량을 입력해 주세요!");
				$("#caffeine").focus();
				return;
			}//end if
			// 칼로리
			if($("#calorie").val() == ""){
				alert("칼로리를 입력해주세요!");
				$("#calorie").focus();
				return;
			}//end if
			// 나트륨
			if($("#natrium").val() == ""){
				alert("나트륨 성분량을 입력해주세요!");
				$("#natrium").focus();
				return;
			}//end if
			// 당류
			if($("#sugar").val() == ""){
				alert("당류 성분량을 입력해주세요!");
				$("#sugar").focus();
				return;
			}//end if
			// 포화지방
			if($("#fattyAcid").val() == ""){
				alert("포화지방 성분량을 입력해주세요!");
				$("#fattyAcid").focus();
				return;
			}//end if
			// 단백질
			if($("#protein").val() == ""){
				alert("성분을 입력해주세요!");
				$("#protein").focus();
				return;
			}//end if
			
		}//end if
	
    }//chkNull
    
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
                            <a class="nav-link d-flex align-items-center gap-2" aria-current="page" href="http://localhost/jsp_prj/manager/dashboard/dashboard.jsp">
                                <i class="bi bi-house"></i>
                                관리자 대시보드
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex align-items-center gap-2 active" href="http://localhost/jsp_prj/manager/menu/getListDrink.jsp">
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
                            <a class="nav-link d-flex align-items-center gap-2" href="http://localhost/jsp_prj/manager/order/getListOrder.jsp">
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
                <h1 class="h2"><strong>커피 상세 보기</strong></h1>
            </div>

		<div class="form-container">

        <form action="selectCoffeeList.jsp" name="readFrm" id="readFrm" method="post">
            <!-- 음료 이름 -->
            <label for="drink-name">이름</label>
            <input type="text" id="nameKor" name="iNameK" value="${ pVO.iNameK }">
            <label for="drink-name">영어 이름</label>
            <input type="text" id="nameEng" name="iNameE" value="${ pVO.iNameE }">
            <input type="hidden" id="itemNum" name="itemNum" value="${ pVO.itemNum }">
            <input type="hidden" id="currentPage" name="currentPage" value="${ param.currentPage }">

            <!-- 가격 -->
            <label for="drink-price">가격</label>
            <input type="text" id="price" name="price" value="${ pVO.price }">

            <!-- 설명 -->
            <label for="drink-description">설명</label>
            <textarea id="description" name="description" rows="4"> 
            ${ pVO.description }
            </textarea>

            <!-- 이미지 추가 -->
            <label for="drink-image">이미지</label>
            <div class="image-upload">
                <img id="preview" src="http://localhost/jsp_prj/manager/common/image/${ pVO.image }" alt="이미지 미리보기" style="">
                <input type="file" id="image" name="image" accept="image/*" onchange="previewImage(event)">
            </div>

			<!-- 카테고리 구분 -->
			<fieldset>
			    <legend>카테고리</legend>
			    <label>커피<input type="radio" name="categoriesNum" value="0" <c:if test="${ pVO.categoriesNum eq 0 }">checked="checked"</c:if> /></label>
			    <label>음료<input type="radio" name="categoriesNum" value="1" <c:if test="${ pVO.categoriesNum eq 1 }">checked="checked"</c:if> /></label>
			</fieldset>
			
			<!-- 구매시 기본 옵션 -->
		    <fieldset>
		    <legend>기본 옵션 설정:</legend>
		    <div id="options-container">
		        <div class="option">
		            <label for="extra-shot">샷 추가</label>
		            <select size="1" id="shot" name="shot" class="inputBox">
		               	<option value="">--선택--</option>
		              	<option value="0" <c:if test="${ oVO.shot eq 0 }">selected="selected"</c:if>>0</option>
		               	<option value="1" <c:if test="${ oVO.shot eq 1 }">selected="selected"</c:if>>1</option>
		               	<option value="2" <c:if test="${ oVO.shot eq 2 }">selected="selected"</c:if>>2</option>
		               	<option value="3" <c:if test="${ oVO.shot eq 3 }">selected="selected"</c:if>>3</option>
		               	<option value="4" <c:if test="${ oVO.shot eq 4 }">selected="selected"</c:if>>4</option>
		               	<option value="5" <c:if test="${ oVO.shot eq 5 }">selected="selected"</c:if>>5</option>
		               	<option value="6" <c:if test="${ oVO.shot eq 6 }">selected="selected"</c:if>>6</option>
		               	<option value="7" <c:if test="${ oVO.shot eq 7 }">selected="selected"</c:if>>7</option>
		               	<option value="8" <c:if test="${ oVO.shot eq 8 }">selected="selected"</c:if>>8</option>
		               	<option value="9" <c:if test="${ oVO.shot eq 9 }">selected="selected"</c:if>>9</option>
		            </select>
		        </div>
		        <div class="option">
		            <label for="size-option">사이즈 선택(S)</label>
		            <div class="option">
		            <input type="radio" name="sizeS" value="Y" style="margin-right: 5px;" <c:if test="${ oVO.sizeS eq 'Y' }">checked="checked"</c:if>> 예
		            </div>
		            <div class="option">
		            <input type="radio" name="sizeS" value="N" style="margin-right: 5px;" <c:if test="${ oVO.sizeS eq 'N' }">checked="checked"</c:if>> 아니오
		            </div>
		        </div>
		        <div class="option">
		            <label for="size-option">사이즈 선택(M)</label>
		            <div class="option">
		            <input type="radio" name="sizeM" value="Y" style="margin-right: 5px;" <c:if test="${ oVO.sizeM eq 'Y' }">checked="checked"</c:if>> 예
		            </div>
		            <div class="option">
		            <input type="radio" name="sizeM" value="N" style="margin-right: 5px;" <c:if test="${ oVO.sizeM eq 'N' }">checked="checked"</c:if>> 아니오
		            </div>
		        </div>
		        <div class="option">
		            <label for="size-option">사이즈 선택(L)</label>
					<div class="option">
		            <input type="radio" name="sizeL" value="Y" style="margin-right: 5px;" <c:if test="${ oVO.sizeL eq 'Y' }">checked="checked"</c:if>> 예
		            </div>
		            <div class="option">
		            <input type="radio" name="sizeL" value="N" style="margin-right: 5px;" <c:if test="${ oVO.sizeL eq 'N' }">checked="checked"</c:if>> 아니오
		            </div>
		        </div>
		        <div class="option">
		            <label for="syrup-option">시럽 추가</label>
		            	<select size="1" id="syrup" name="syrup" class="inputBox">
		                   	<option value="">--선택--</option>
		                   	<option value="0" <c:if test="${ oVO.syrup eq 0 }">selected="selected"</c:if>>0</option>
		                   	<option value="1" <c:if test="${ oVO.syrup eq 1 }">selected="selected"</c:if>>1</option>
		                   	<option value="2" <c:if test="${ oVO.syrup eq 2 }">selected="selected"</c:if>>2</option>
		                   	<option value="3" <c:if test="${ oVO.syrup eq 3 }">selected="selected"</c:if>>3</option>
		                   	<option value="4" <c:if test="${ oVO.syrup eq 4 }">selected="selected"</c:if>>4</option>
		                   	<option value="5" <c:if test="${ oVO.syrup eq 5 }">selected="selected"</c:if>>5</option>
		                   	<option value="6" <c:if test="${ oVO.syrup eq 6 }">selected="selected"</c:if>>6</option>
		                   	<option value="7" <c:if test="${ oVO.syrup eq 7 }">selected="selected"</c:if>>7</option>
		                   	<option value="8" <c:if test="${ oVO.syrup eq 8 }">selected="selected"</c:if>>8</option>
		                   	<option value="9" <c:if test="${ oVO.syrup eq 9 }">selected="selected"</c:if>>9</option>
		        	    </select>
		           	</div>
		        <div class="option">
		            <label for="reusable-cup">다회용 컵 사용</label>
		            <div class="option">
		           	<input type="radio" name="multiCup" value="Y" style="margin-right: 5px;" <c:if test="${ oVO.multiCup eq 'Y' }">checked="checked"</c:if>>사용
		           	</div>
		           	<div class="option">
		            <input type="radio" name="multiCup" value="N" style="margin-right: 5px;" <c:if test="${ oVO.multiCup eq 'N' }">checked="checked"</c:if>>사용하지 않음
		            </div>
		        </div>
		    </div>
		    </fieldset>
			
			<!-- 영양 성분표 제공 여부 -->
			<fieldset>
			    <legend>영양 성분표 제공 여부:</legend>
			    <label><input type="radio" name="ingredientFlag" value="Y" <c:if test="${ pVO.ingredientFlag eq 'Y' }">checked="checked"</c:if>> 제공</label>
			    <label><input type="radio" name="ingredientFlag" value="N" <c:if test="${ pVO.ingredientFlag eq 'N' }">checked="checked"</c:if>> 미제공</label>
			
			    <table id="ingredientTable">
			        <tr>
			            <th>성분</th>
			            <th>함량</th>
			        </tr>
			        <tr>
			            <td>카페인</td>
			            <td><input type="text" id="caffeine" name="caffeine" value="${ iVO.caffeine }"></td>
			        </tr>
			        <tr>
			            <td>칼로리</td>
			            <td><input type="text" id="calorie" name="calorie" value="${ iVO.calorie }"></td>
			        </tr>
			        <tr>
			            <td>나트륨</td>
			            <td><input type="text" id="natrium" name="natrium" value="${ iVO.natrium }"></td>
			        </tr>
			        <tr>
			            <td>당류</td>
			            <td><input type="text" id="sugar" name="sugar" value="${ iVO.sugar }"></td>
			        </tr>
			        <tr>
			            <td>포화지방</td>
			            <td><input type="text" id="fattyAcid" name="fattyAcid" value="${ iVO.fattyAcid }"></td>
			        </tr>
			        <tr>
			            <td>단백질</td>
			            <td><input type="text" id="protein" name="protein" value="${ iVO.protein }"></td>
			        </tr>
			    </table>
			</fieldset>
			
			            <!-- 제출 버튼 -->
			            <!-- <button type="submit">수정 내용 저장</button> -->
				        <div style="text-align: center;">
				        <button type="button" class="confirm" id="confirm">확인</button>
				        <button type="button" class="answer" id="answer">수정</button>
				        <button type="button" class="cancel" id="cancel">삭제</button>
				        </div>
			        </form>
			    </div>
			<canvas class="my-4 w-100" id="myChart" width="900" height="100"></canvas>
        </main>
    </div>
</div>
<script src="bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<script src="chart.umd.js" integrity="sha384-eI7PSr3L1XLISH8JdDII5YN/njoSsxfbrkCTnJrzXt+ENP5MOVBxD+l6sEG4zoLp" crossorigin="anonymous"></script><script src="dashboard.js"></script></body>
</body>
</html>