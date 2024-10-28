<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="회원가입 폼"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>work0909</title>
<link  rel ="shorcut icon" href="http://192.168.10.211/jsp_prj/common/images/favicon.ico"/>
<link rel="stylesheet" type="text/css" href="http://192.168.10.211/jsp_prj/common/css/main_20240911.css"/>
<!-- bootstrap CDN 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!-- bootstrap CDN 끝-->


<style type="text/css">
td{ height: 42px}
#agree{
	width: 1400px;height: 180px; border: 1px solid #333;
	overflow: auto;
}
</style>
<!-- 다음우편번호 API 시작 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 다음우편번호 API 끝 -->
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
	$("#btnMy").click(function(){
		$("#frmPost").submit();
		
	});//click
});//ready
</script>

<script type="text/javascript">
	window.onload=function(){
		document.getElementById("idbtn2").addEventListener("click",idDup2);
		document.getElementById("findZipcode").addEventListener("click",searchZipcode);
	}//onload
	
	
	//부모창에서 자식창으로 값 전달 : Query String 만들어서 팝업창 띄우기
	function idDup2(){
		var left=window.screenX+350;
		var top=window.screenY+200;
		//1.현재창에 아이디를 가져와서 
		var id=document.frmGet.id.value;
		
		//2. query string 만들어서 팝업을 띄운다.
		window.open("id_dup.jsp?id="+id,"idDup",
				"width=460,height=380,left="+left+",top="+top);
	}//idDup
	
</script>
<script type="text/javascript">
function searchZipcode(){
	 new daum.Postcode({
         oncomplete: function(data) {
             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

             // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
             var roadAddr = data.roadAddress; // 도로명 주소 변수
             var extraRoadAddr = ''; // 참고 항목 변수

             // 법정동명이 있을 경우 추가한다. (법정리는 제외)
             // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
             if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                 extraRoadAddr += data.bname;
             }
             // 건물명이 있고, 공동주택일 경우 추가한다.
             if(data.buildingName !== '' && data.apartment === 'Y'){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
             }
             // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
             if(extraRoadAddr !== ''){
                 extraRoadAddr = ' (' + extraRoadAddr + ')';
             }

             // 우편번호와 주소 정보를 해당 필드에 넣는다.
             document.getElementById('zipcode').value = data.zonecode;
             document.getElementById("addr1").value = roadAddr;
             document.getElementById("addr2").focus();
         }
     }).open();
	
}//searchZipcode

</script>
</head>
<body>
<div id="wrap">
<form name="frmPost" id="frmPost" method="POST"
	action="bean_customer_frm_process.jsp" >
	<div align="center">
	<h1>회원가입</h1>
		<table>
			<!-- id 입력 -->
			<tr>
				<td><span class="required">*</span><label>아이디</label></td>
				<td>
					<input type="text" name="cus_id" id="cus_id" class="inputBox" style="width: 200px"> 
				</td>
			</tr>

			<tr>
				<td><span class="required">*</span>비밀번호</td>
				<td>
					<input type="password" name="cus_pass" id="cus_pass" class="inputBox" style="width: 200px"> 
				</td>
			</tr>
			<tr>	
				<td><span class="required">*</span>비밀번호 확인</td>
				<td>	
					<input type="password" name="chk_pass" id="chk_pass" class="inputBox" style="width: 200px">
				</td>
			</tr>

			<tr>
				<td><span class="required">*</span>이름</td>
				<td><input type="text" name="nickname" id="nickname" class="inputBox" style="width: 200px"></td>
			</tr>

			<tr>
				<td><span class="required">*</span>휴대폰</td>
				<td>
					<input type="tel" name="phone" id="phone" class="inputBox"  maxlength="13" style="width: 130px"> 
				</td>
			</tr>
			
			<tr>
				<td><span class="required">*</span>이메일</td>
				<td>
					<input type="email" name="email" id="email" class="inputBox" style="width: 200px"> 
				</td>
			</tr>

		</table>
		
	</div>
	<div align="center" style="margin-top: 30px">
		<input type="button" value="제출" id="btnMy" class="btnMySubmit"> 
		
		<input type="reset" value="취소" id="btnReset" class="btnMyReset">
	</div>
	</form>
</body>
</html>
