<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
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


<style>
#tb1 { position:absolute; left:100px; top:100px; }
#tb2 { position:absolute; left:100px; top:100px; display:none; }
</style>
<script language="javascript">
function view(arg)
{
var t1 = document.getElementById("tb1");
var t2 = document.getElementById("tb2");

if(arg == 1)
{
t1.style.display="block";
t2.style.display="none";
}
else
{
t2.style.display="block";
t1.style.display="none";
}
}
</script>
</head>
<body>
<table id="tb1" border="1px" cellpadding="10px">
<tr><td>1</td></tr>
<tr><td>2</td></tr>
<tr><td>3</td></tr>
</table>

<table id="tb2" border="2px" cellpadding="10px">
<tr><td>ㄱ</td></tr>
<tr><td>ㄴ</td></tr>
<tr><td>ㄷ</td></tr>
<tr><td>ㄹ</td></tr>
<tr><td>ㅁ</td></tr>
</table>

<input type="button" value="테이블1 보기" onClick="view(1)">
<input type="button" value="테이블2 보기" onClick="view(2)">
</body>
[출처] 버튼을 클릭하면 해당 테이블로 변경되는 자바스크립트입니다. |작성자 효글


</html>