<%@page import="project.manager.menu.DrinkDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="음료 추가 폼의 입력 정보 받기"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="/docs/5.3/assets/js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.122.0">
    <link rel="stylesheet" href="http://localhost/jsp_prj/project/chart.umd/css/orderStateList.css">
    <link rel="stylesheet" href="http://localhost/jsp_prj/project/chart.umd/css/orderDetails.css">
    <title>음료 추가 프로세스</title>
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
   
    <link rel="stylesheet" href="css@3.css">
    <meta name="theme-color" content="#712cf9"> 

	<script type="text/javascript">
    $(function(){

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
	</script>

</head>
<body>
<jsp:include page="../common/svg.jsp"/> <!-- svg -->
<jsp:include page="../common/headbar.jsp"/> <!-- headbar -->


<script src="bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<script src="chart.umd.js" integrity="sha384-eI7PSr3L1XLISH8JdDII5YN/njoSsxfbrkCTnJrzXt+ENP5MOVBxD+l6sEG4zoLp" crossorigin="anonymous"></script><script src="dashboard.js"></script></body>
</html>