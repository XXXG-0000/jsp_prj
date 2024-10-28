<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="사용자 로그인화면"
    %>
<!DOCTYPE html>
<html lang="ko-KR">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">

<link rel="shortcut icon" type="image/x-icon" href="http://localhost/paik_prj/common/images/favicon.png">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<title>빽다방 | 로그인</title>

<style type="text/css">
	.headHTxt{
		text-align: center;
		margin-top: 20px;
		margin-bottom: 20px;
	}
	table{
		border-spacing: 0 15px;
	}
	.txt{
		color: #C9C9C9;
	}
	#loginContainer{
		margin-bottom: 30px;
	}
	.inputBox {
	    width: calc(100% - 20px);
	    padding: 10px;
	    border: 1px solid #ccc;
	    font-size: 16px;
	    margin-top: 15px;
	    padding: 10px;
	}
	#loginBtn{
		cursor: pointer;
		background-color: #FFE800;
		color: #FFFFFF;
		border: 0px;
		height: 50px;
		width: 97.5%;
		margin-top: 30px;
		margin-bottom: 20px;
	}
	#memberContainer{
		border: 1px solid #E6E7E8;
		padding: 30px;
	}
	#joinMemberBtn{
		margin-top: 40px;
		padding: 10px 20px 10px 20px;
		cursor: pointer;
		background-color: #FFFFFF;
		border: 1px solid #C9C9C9;
	}
	body {
    font-family: 'Arial', sans-serif;
    margin: 20px;
    background-color: #f9f9f9;
}
h1 {
    text-align: center;
    color: #333;
    font-size: 30px; /* 헤더 크기 증가 */
}
.modify-container {
    max-width: 500px; /* 컨테이너 너비 증가 */
    margin: auto;
    background: #fff;
    padding: 30px; /* 패딩 증가 */
    border-radius: 8px; /* 모서리 둥글게 */
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}
label {
    margin: 15px 0 5px;
    display: block;
    font-size: 16px; /* 라벨 폰트 크기 증가 */
}
input[type="text"], input[type="email"], input[type="password"] {
    width: 100%;
    padding: 12px; /* 패딩 증가 */
    margin-bottom: 20px; /* 마진 증가 */
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 1em; /* 입력 필드 폰트 크기 증가 */
}
button {
    width: 100%;
    padding: 12px; /* 패딩 증가 */
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
    font-size: 16px; /* 버튼 폰트 크기 증가 */
}
button:hover {
    background-color: #45a049;
}
.zipcode-container {
    display: flex;
    align-items: center;
}
.zipcode-container input {
    flex: 1;
}
.zipcode-container button {
    width: auto;
    margin-left: 10px;
    padding: 10px 15px; /* 패딩 증가 */
}
</style>

<link rel="stylesheet" type="text/css" href="http://localhost/paik_prj/common/css/paik_kl.css">
<link rel="stylesheet" type="text/css" href="http://localhost/paik_prj/common/css/paik_normal.css">
<link rel="stylesheet" type="text/css" href="http://localhost/paik_prj/common/css/paik_extend.css">

<link rel='stylesheet' id='theme-css-style-css'  href='https://paikdabang.com/wp-content/themes/paikdabang/assets/css/style.css?ver=4.9.4' type='text/css' media='all' />

<link rel="icon" href="http://localhost/paik_prj/common/images/favicon32x32.png" sizes="32x32" />
<link rel="icon" href="http://localhost/paik_prj/common/images/favicon192x192.png" sizes="192x192" />
<link rel="apple-touch-icon-precomposed" href="http://localhost/paik_prj/common/images/favicon180x180.png" />
<meta name="msapplication-TileImage" content="http://localhost/paik_prj/common/images/favicon270x270.png" />

<%-- bootstrap CDN --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<%-- jQuery CDN --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
	$("#loginBtn").click(function(){
		var id = $("#id").val().trim();
		var pass = $("#pass").val().trim();
		
		if(id === ""){
			alert("아이디를 입력해주세요.")
			$("#id").focus();
			return;
		}//if
		
		if(pass === ""){
			alert("비밀번호를 입력해주세요.");
			$("#pass").focus();
			return;
		}
		
		$("#loginFrm").submit();
	});
	
	$("#joinMemberBtn").click(function() {
		window.location.href = "membershipPage.jsp";
	});
});//ready()
</script>

</head>

<body>
<div id="wrap">
<div id="header">
<jsp:include page="header.jsp"/>
</div>

<div id="content-wrap">
<div class="sub_visual bg-paik">
    <div class="txt">
        <h1>마이페이지</h1>
    </div>
</div>

<div class="sub_section cmnt_wrap">
    <div class="container" style="max-width: 600px; margin: 0 auto; text-align: center;">
            <h1>개인정보 수정</h1>
    <div class="modify-container">
        <form id="updateForm">
            <label for="email">이메일</label>
            <input type="email" id="email" name="email">

            <label for="password">비밀번호</label>
            <input type="password" id="password" name="password">

            <label for="confirmPassword">비밀번호 확인</label>
            <input type="password" id="confirmPassword" name="confirmPassword">
            <button type="button" onclick="checkPasswords()">비밀번호 확인</button>

<label for="name">이름</label>
<input type="text" id="name" name="name">

<label for="zipcode">우편번호</label>
<div class="zipcode-container">
    <input type="text" id="zipcode" name="zipcode">
    <button type="button" onclick="searchZipcode()">우편번호 조회</button>
        </div>

        <label for="address">상세주소</label>
        <input type="text" id="address" name="address">

        <button type="submit">수정하기</button>
    </form>
</div>

<script>
//비밀번호 확인
function checkPasswords() {
    const password = document.getElementById('password').value;
    const confirmPassword = document.getElementById('confirmPassword').value;

    if (password === confirmPassword) {
        alert('비밀번호가 일치합니다.');
    } else {
        alert('비밀번호가 일치하지 않습니다.');
    }//end if
}//checkPasswords

document.getElementById('updateForm').onsubmit = function(event) {
    event.preventDefault();

    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;
    const confirmPassword = document.getElementById('confirmPassword').value;
    const name = document.getElementById('name').value;
    const username = document.getElementById('username').value;
    const zipcode = document.getElementById('zipcode').value;
    const address = document.getElementById('address').value;

    //전부가 입력 되었는지 확인
    if (!email) {
        alert('이메일을 입력하세요.');
        return;
    }
    if (!password) {
        alert('비밀번호를 입력하세요.');
        return;
    }
    if (password !== confirmPassword) {
        alert('비밀번호가 일치하지 않습니다.');
        return;
    }
    if (!name) {
        alert('이름을 입력하세요.');
        return;
    }
    if (!username) {
        alert('회원명을 입력하세요.');
        return;
    }
    if (!zipcode) {
        alert('우편번호를 입력하세요.');
        return;
    }
    if (!address) {
        alert('상세주소를 입력하세요.');
        return;
    }

    
    alert('개인정보가 수정되었습니다!');
    
};

function searchZipcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            document.getElementById('zipcode').value = data.zonecode; //우편번호 입력
            document.getElementById('address').value = data.address; //주소 입력
        }
    }).open();
}//searchZipcode
</script>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        
    </div>
</div>
</div>

<div id="footer">
<jsp:include page="footer.jsp"/>
</div>
</div>

</body>
</html>