<%@page import="day1001.ImgVO"%>
<%@page import="java.util.List"%>
<%@page import="day1001.DataProcess"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="표현식과 scriptlet의 연습"%>
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
.card-text { text-overflow: ellipsis;}
</style>
<script type="text/javascript">
/* JS 영역 => JS 코드 작성 */
$(function(){
	$("#btn").click(function(){
		printDate();
	});// end click
}); // ready

function printDate(){
	var year = $("#year").val();
	var month = $("#month").val();
	var day = $("#day").val();
	
	$("#output").html(year + "년 " + month +"월 " + day + "일");
}

</script>
</head>
<body>
<div id="wrap">
<!-- HTML 영역 => HTML 태그 작성, CSS 정의한 디자인 적용, JS에서 동적인 디자인 생성 보여주는 일, JS에서 HTML Form Control에 입력된 값을 
	유효성 검증 수행 => onxxx속성 사용 -->
	
		<%
		LocalDate ld = LocalDate.now();
		int nowYear = ld.getYear();
		int nowYear2 = Calendar.getInstance().get(Calendar.YEAR);
		int nowMonth = ld.getMonthValue();
		int lastDay = Calendar.getInstance().getActualMaximum(Calendar.DATE);
		int nowDay = Calendar.getInstance().get(Calendar.DAY_OF_MONTH);
		log("마지막 날------"+lastDay);

		
		%>
		<select name="year" id="year">
		<% for(int year = nowYear; year > 1949; year--){ %>
			<option value="<%= year %>"><%= year %></option>
		<% }// end for %>
		</select>년 
		
 		<select name="month" id="month">
		<% for(int month = 1; month < 13; month++){ %>
			<option value="<%= month %>"<%= month == nowMonth?" selected='selected'":"" %>><%= month %></option>
		<% }// end for %>
		</select>월 
		
		<select name="day" id="day">
		<% for(int day = 1; day < lastDay+1; day++){ %>
			<option value="<%= day %>"<%= day == nowDay?" selected='selected'":"" %>><%= day %></option>
		<% }// end for %>
		</select>일 
		
		<input type="button" value="날짜얻기" class="btn btn-primary btn-sm" id="btn" />
		<div id="output" style="height: 40px"></div>
		
		<div>
			<% for(int dice = 1; dice < 7; dice++){ %>
				<img src="http://localhost/jsp_prj/day1001/images/dice_<%= dice %>.png"/>
			<% }// end for %>
		</div>
		
		<%
		String[] names={"김지훈","김현우","이일환","이인혁","황찬욱"};
		%>
		<div style="width: 700px"></div>
		<table class="table table-hover">
		<thead>
		<tr>
			<th style="width:90px">이름</th><th style="width:610px">점수</th>
		</tr>
		</thead>
		<tbody>
		<% int chk = 0; %>
		<% for(int i = 0; i < names.length; i++){ %>
		<tr>
			<td><%= names[i] %></td>
			<td>
			<% for(int j = 0; j < 11; j++){ %>
			<input type="radio" value="<%= j %>" name="score_<%= i %>" id="num_<%= j %>"<%= 
			j == chk? "checked='checked'":"" %> /><%= j %>	
			<% }// end for %>
			</td>
		</tr>
		<% }// end for %>
		</tbody>
		</table>

		<%
			//List에 저장된 이미지와 설명을 Card로 출력
			DataProcess dp = new DataProcess();
			List<ImgVO> list = dp.searchDate();
			
			if(list.isEmpty()){
		%>
		<marquee>로딩된 이미지가 없습니다.</marquee>				
		<%
			}// end if
			
			String info = "";
			for( ImgVO iVO : list){
			info = iVO.getInfo();%>
			<div class="card" style="width: 18rem; float: left" >
  			<img src="http://192.168.10.212/jsp_prj/day1001/images/<%= iVO.getImg() %>" style="width:260px; height:200px;" class="card-img-top" alt="...">
  			<div class="card-body">
  			<!-- 50자까지 보여주고 나머지는 ...으로 -->
    			<p class="card-text"><%= info.length() > 50? info.substring(0,49)+"...":"" %></p>
  			</div>
			</div>				
<% }// end for  %>

<%
	// scriptlet에서는 method를 작성할 수 없다
/* 	public void test() {
	
	} */
%>
		
</div>
</body>
</html>