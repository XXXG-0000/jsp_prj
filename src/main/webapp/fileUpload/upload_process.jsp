<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="multipart/form-data인 경우 web parameter가 전달되지 않는다."
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%-- 
web parameter가 전달되지 않는다.
업로더: <%= request.getParameter("uploader") %><br>
EL: ${ param.uploader }<br> --%>
요청방식: <%= request.getMethod() %><br>
<%
//1. 파일 경로 설정
File saveDir = new File("C:/dev/workspace/jsp_prj/src/main/webapp/upload");

//2. 업로드 최대 크기 설정
int maxSize = 1024*1024*10;//업로드 최대 크기, 초과 예외 발생(예외 처리 없음)
int uploadSize = 1024*1024*600;//업로드 최대 크기, 초과 예외 발생(예외 처리 없음)

//3. FileUpload Component 생성, 생성과 동시에 업로드 진행
try{
	MultipartRequest mr = new MultipartRequest(request, saveDir.getAbsolutePath(),uploadSize,"UTF-8",new DefaultFileRenamePolicy());
	// 웹 파라메터 받기(request 아닌 파일 컴포넌트를 사용하여 파라메터를 받는다.)
	String uploader = mr.getParameter("uploader");	// 이름 같을 경우 getParameterValues	
	String[] extArr = mr.getParameterValues("ext");
	
	//파일명 처리
	//원본 파일명
	String originName = mr.getOriginalFileName("upfile");
	//변경된 파일명
	String fileSysName = mr.getFilesystemName("upfile");
	
	//업로드 된 파일이 최대 크기를 초과하는지 체크
	File uploadFile = new File(saveDir.getAbsoluteFile() + "/" + fileSysName);
	//out.println(uploadFile);
	if( uploadFile.length() > maxSize ){ // 업로드 최대 크기를 초과
		uploadFile.delete(); // 업로드 된 파일 삭제
	%>
	<%= originName %>은 10Mbyte( <%= maxSize %> byte)를 초과합니다.<br>
	업로드 파일의 크기 내의 파일로 변환하여 업로드 해주세요.<br>
	<a href="upload_frm.jsp">뒤로</a>	
	<%
	} else {// 최대 크기에 맞을 경우	
	%>
	<h2>파일업로드 성공</h2>
	<div>
	업로더: <%= uploader %><br>
	확장자: <%
			if(extArr == null){
				out.print("선택 확장자 없음");
			} else {
				for(String tempExt : extArr){
					out.print(tempExt);
					out.print("&nbsp;");
				}//end for
			}//end else
			%>
	<br>
	원본 파일명: <%= originName %><br>
	변경 파일명: <%= fileSysName %><br>
	<%-- <img src="http://localhost/jsp_prj/upload/<%= fileSysName %>"/> --%>
	<a href="file_list.jsp">파일 리스트 보기</a>
	</div>
	<%
	}// end else
} catch(Exception e){// 파일 크기가 클 때 예외 처리 되지 않는다.(브라우저 내에서 자체로 에러)
	e.printStackTrace();
	%>
	파일 업로드 실패!
	<%
}//end catch


%>
</div>
</body>
</html>