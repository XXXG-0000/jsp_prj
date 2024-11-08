<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.rest.RestaurantVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.user.rest.RestaurantDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../common/jsp/session_chk.jsp" %>
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

<!-- daum map -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=39fa8c92ea40801bc0fa281c3e25f843"></script>

<style type="text/css">
/* CSS영역 => CSS 디자인 코드 작성 */
	a { font-size: 15px; color: #212529; text-decoration: none;}
	a:hover { font-size: 15px; color: #aaa; }
</style>
<%
	RestaurantDAO rDAO = RestaurantDAO.getInstance();
	List<RestaurantVO> list = null;
	try {
		list = rDAO.selectAllRest(sessionId);		
	} catch(SQLException se) {
		se.printStackTrace();
	}//end catch
	
	pageContext.setAttribute("restList", list);
	
%>

<script type="text/javascript">
/* JS 영역 => JS 코드 작성 */
$(function(){
	
}); // ready

var map;
window.onload = function(){
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.499294, 127.0331883), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

	map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [
		<c:forEach var="rVO" items="${ restList }">
	    {
	        title: '${ rVO.restaurant }-${ rVO.menu }',
	        latlng: new kakao.maps.LatLng(${ rVO.lat }, ${ rVO.lng })//3d37.498189!4d127.0315992
	    },
	    </c:forEach>
	];

	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	    
	for (var i = 0; i < positions.length; i ++) {
	    
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	    });
	}
}//onload

function panTo(lat, lng) {
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(lat, lng);
    
    // 지도 중심을 부드럽게 이동시킵니다
    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
    map.panTo(moveLatLon);            
}        

</script>
</head>
<body>
<div id="wrap">
<!-- HTML 영역 => HTML 태그 작성, CSS 정의한 디자인 적용, JS에서 동적인 디자인 생성 보여주는 일, JS에서 HTML Form Control에 입력된 값을 
	유효성 검증 수행 => onxxx속성 사용 -->
	<div id="header">
	<c:import url="../common/jsp/header.jsp"/>
	</div>
	<div id="container">
	<div>
	<strong>식당-즐겨찾기</strong>
	</div>
	<div id="mapDiv">
		<div id="map" style="width:100%; height:500px;"></div>
	</div>
	<div id="restListDiv">
	
	<strong>즐겨찾기 식당목록</strong>
	<a href="rest_frm.jsp">식당추가</a><br>
	
	<table class="table table-hover">
	<thead>
	<tr>
		<th style="width:80px">번호</th>
		<th style="width:200px">식당명</th>
		<th style="width:120px">대표메뉴</th>
		<th style="width:400px">식당설명</th>
		<th style="width:150px">입력일</th>
	</tr>
	<c:if test="${ empty restList }">
	<tr>
		<td colspan="5" style="text-align: center;">
		즐겨찾기 한 식당이 없습니다
		</td>
	</tr>
	</c:if>
	<c:forEach var="rVO" items="${ restList }" varStatus="i">
	<tr>
		<td><c:out value="${ i.count }"/></td>
		<td><a href="javascript:panTo(${rVO.lat},${rVO.lng})"><c:out value="${ rVO.restaurant }"/></a></td>
		<td><c:out value="${ rVO.menu }"/></td>
		<td><c:out value="${ rVO.info }"/></td>
		<td><fmt:formatDate value="${ rVO.input_date }" pattern="yyyy-MM-dd"/></td>
	</tr>
	</c:forEach>
	</table>
	
	
	</div>
	
	</div>
	<div id="footer">
	<c:import url="../common/jsp/footer.jsp"/>	
	</div>
</div>
</body>
</html>