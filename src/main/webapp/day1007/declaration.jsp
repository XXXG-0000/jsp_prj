<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSP에서 class field로 코드를 생성"
    %>
    
    <!-- method는 위에서 만들어서 아래에서 호출하는 것이 깔끔함 -->
<%!
	// class field
	String name;  // instance variable  
%>

<!-- 선언 -->
<%!
	public String getName(){
	
		return name;
	}

	
%>

<!-- 선언 -->
<%!
/** 
	라디오 버튼의 개수, 라디오 버튼의 이름, check할 라디오 버튼의 번호
*/

public String createRadioCheck(String type, String radioName, int radioCnt, int checkedNum){
	StringBuilder tempRadio = new StringBuilder();
	
	for(int j = 0; j < 11; j++){ 

	
		tempRadio.append("<input type='").append(type).append("'name'")
		.append(radioName).append("' value='").append(j).append("'")
		.append(j==checkedNum?" checked='checked'":"").append("/>")
		.append(j).append("점 ");
	}// end for
	
	return tempRadio.toString();
}// createRadio
%>
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

</style>
<script type="text/javascript">
/* JS 영역 => JS 코드 작성 */
$(function(){
	
}); // ready

</script>
</head>
<body>
<div id="wrap">
<!-- HTML 영역 => HTML 태그 작성, CSS 정의한 디자인 적용, JS에서 동적인 디자인 생성 보여주는 일, JS에서 HTML Form Control에 입력된 값을 
	유효성 검증 수행 => onxxx속성 사용 -->
	<%
		name = "테스트";
	%>
	이름은: <%= getName() %>입니다.
	
<div>
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
			<%= createRadioCheck("radio", "score_" + i, 10, 0) %>
			</td>
		</tr>
		<% }// end for %>

		</tbody>
		</table>
		
		<div>
		<%= createRadioCheck("checkbox", "temp", 5, 0) %>
		</div>
</div>
</div>
</body>
</html>