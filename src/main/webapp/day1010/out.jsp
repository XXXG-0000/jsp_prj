<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="out 내장 객체의 사용"
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
		String msg="오늘은 목요일 입니다.";
		out.print("<strong>");
		out.print(msg);
		out.print("</strong>");
		// 소스 보기 시에 줄 변경 안 됨
		
		out.println("<strong>");
		out.println(msg);
		out.println("</strong>");
		// 소스 보기 시에 줄 변경됨
		
		for(int i = 1; i < 7; i++){
			out.print("<h");
			out.print(i);
			out.print(">");
			out.print("msg");
			out.print("</h");
			out.print(i);
			out.println(">");
		}// end for
		
		String[] url={"http://google.com", "http://naver.com", "http://daum.net"};
		String[] urlText={"구글", "네이버", "다음"};
		StringBuilder sb = new StringBuilder();
		
/* 		for(int i = 0; i < url.length; i++){
			// out 또는 StringBuilder 사용
			out.print("<a href='");
			out.print(url[i]);
			out.print("'>");
			out.print(urlText[i]);
			out.println("</a>");
		} */
		
		for(int i = 0; i < url.length; i++){
			sb.append("<a href='").append(url[i]).append("'>").append(urlText[i]).append("</a>\n");
		}
		out.println(sb);
	%>
</div>
</body>
</html>