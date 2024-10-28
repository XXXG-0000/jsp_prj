<%@page import="kr.co.sist.chipher.DataEncryption"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.member.MemberDAO"%>
<%@page import="project.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="회원 가입 폼의 입력 정보 받기"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../common/jsp/post_chk.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://192.168.10.212/jsp_prj/common/css/main_20240911.css">

<!-- bootstrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>


<style type="text/css">
/* CSS영역 => CSS 디자인 코드 작성 */
.id { color: #0000FF }
</style>
<script type="text/javascript">
/* JS 영역 => JS 코드 작성 */
$(function(){
	
}); // ready

</script>
</head>
<body>
<div id="wrap">
<div id="header">
<c:import url="http://localhost/jsp_prj/common/jsp/header.jsp"/>
</div>
<!-- HTML 영역 => HTML 태그 작성, CSS 정의한 디자인 적용, JS에서 동적인 디자인 생성 보여주는 일, JS에서 HTML Form Control에 입력된 값을 
	유효성 검증 수행 => onxxx속성 사용 -->
	<jsp:useBean id="wmVO" class="kr.co.sist.user.member.WebMemberVO" scope="page"></jsp:useBean>
	<jsp:setProperty property="*" name="wmVO"/>
	<%
	//접속자의 ip주소를 저장(부인방지용)
	wmVO.setIp(request.getRemoteAddr());
	if(wmVO.getSave() == null){
		wmVO.setSave("N");
	} else {
		wmVO.setSave("Y");
	}
	
	MemberDAO mDAO = MemberDAO.getInstance();
	try {
		// 비연결성의 문제(한정적인 자원의 사용 문제)
		boolean flag = mDAO.selectId(wmVO.getId());
		if( flag ){
			%>
			<h2>아이디가 사융 중입니다.</h2>
			<strong><c:out value="${ param.id }"/></strong>는 이미 사용 중입니다.
			<a href="javascript:history.back()">뒤로</a> 이동 <!-- input type password 빼고 유지 -->
			<%
		} else {
			// 저장할 데이터의 중요도에 따라 일방향 Hash, 양방향 암호화 수행
			// 비번: 일방향 Hash
			wmVO.setPass(DataEncryption.messageDigest("SHA-1", wmVO.getPass()));
			
			DataEncryption de = new DataEncryption("abcdef0123456789");
			// 이름, 이메일 양방향 암호화처리
			wmVO.setName(de.encrypt(wmVO.getName()));
			wmVO.setCellphone(de.encrypt(wmVO.getCellphone()));
			wmVO.setEmail(de.encrypt(wmVO.getEmail()));
			
			// 입력된 회원 정보를 DB에 추가
			mDAO.insertWebMember(wmVO);			
		%>
		<h2>${ param.name }님! 회원 가입해주셔서 감사합니다!</h2>
		<a href="../login/login_frm.jsp">로그인 페이지</a>로 이동
		<%
		}//end else
	} catch(SQLException se){
		se.printStackTrace();
		%>
		회원 가입 중 문제가 발생했습니다.<br>
		잡시 후 다시 시도해주세요. <br>
		<a href="join_frm.jsp">메인화면으로 이동</a>
		<%
	}// end catch
	%>
	
	<%-- <%= wmVO %> --%>
	
<%-- <% 	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String tel = request.getParameter("tel");
	String cell = request.getParameter("cellphone");
	String email = request.getParameter("email");
	String email2 = request.getParameter("email2");
	String gender = request.getParameter("gender");
	String[] lang = request.getParameterValues("lang");
	String location = request.getParameter("location");
	String zip = request.getParameter("zipcode");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	
	if(tel.equals("")){ 
		tel = "입력하신 연락처가 없습니다.";	
	}// end if
	
	if(email2.equals("none")){
		email2="";
	}
	
	if(gender == null){
		gender="";
	}
%>
<h2><strong><span class="id"><%= id %></span></strong> 회원님 가입을 축하드립니다.</h2>
<hr>
<h3>입력정보</h3>
비밀번호: <%= pass %><br>
이름: <%= name %><br>
생일: <%= birth %><br>
연락처: <%

 %>
 <%= tel %><br>
휴대폰: <%= cell %><br>
이메일: <%= email %><br>
성별: <%= gender %><br>
관심언어:
<ul>
<% 
	if(lang == null){ %>
		<li>관심 언어가 없습니다.</li>
	<% } else { 
	for(String selLang : lang) { %>
		<li><%= selLang %></li>
<% 	} // end for
}// end else %>
</ul>
소재지: <%= location %><br>
우편번호: <%= zip %><br>
주소: <%= addr1 %> <%= addr2 %><br> --%>
</div>
</body>
</html>