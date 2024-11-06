<%@page import="java.util.List"%>
<%@page import="org.jdom2.Element"%>
<%@page import="org.jdom2.Document"%>
<%@page import="java.net.URL"%>
<%@page import="org.jdom2.input.SAXBuilder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="외부에서 제공되는 XML(RSS)을 ajax로 파싱2 - 6"
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
	a { font-size: 15px; color: #212529; text-decoration: none;}
	a:hover { font-size: 15px; color: #aaa; text-decoration: underline;}
</style>
<script type="text/javascript">
/* JS 영역 => JS 코드 작성 */
$(function(){
	
}); // ready

function jtbcParsing(url){
	//최초 요청한 URL에서 요청하는 URL이 변경될 경우 보안상의 문제 발생할 수 있다.
	//CORS 에러 발생 우려 있음(서버에서 인증해주지 않는다 => 서버 세팅 변경, proxy server를 통해서 우회)
	alert(url);
	$.ajax({
		url: url,
		type:"get",
		dataType:"xml",
		error:function(xhr){
			alert(url);
			alert(xhr.status);
		},
		success:function(xmlDoc){
			alert(xmlDoc);
		}
	});//ajax
}

</script>
</head>
<body>
<div id="wrap">
<!-- HTML 영역 => HTML 태그 작성, CSS 정의한 디자인 적용, JS에서 동적인 디자인 생성 보여주는 일, JS에서 HTML Form Control에 입력된 값을 
	유효성 검증 수행 => onxxx속성 사용 -->
	<%
		String[] titleArr = {"이슈 Top10","정치","경제","사회","국제","문화","연예","스포츠","날씨"};
		String[] urlArr = {"issue","section/10","section/20","section/30","section/40",
				"section/50","section/60","section/70","section/80"};
	%>
	<div>
	<table class="table">
	<tr>
	<% for(int i=0; i < titleArr.length; i++){ %>
	<td><a href="#void" onclick="jtbcParsing('https://news-ex.jtbc.co.kr/v1/get/rss/<%= urlArr[i] %>')"><%= titleArr[i] %></a>
	<% }//end for %>
	</tr>
	</table>
	</div>
	<div>
	<c:if test="${ not empty param.url }">
	<%
	String preFixurl="https://news-ex.jtbc.co.kr/v1/get/rss/";
	String paramUrl = request.getParameter("url");
	//out.println(preFixurl + paramUrl);
	
	//1. Parser 생성
	SAXBuilder builder = new SAXBuilder();
	//2. 최상위 문서 객체 얻기
	Document doc = builder.build(new URL(preFixurl + paramUrl));
	//System.out.println(doc);
	//3. root 노드 얻기
	Element rootNode = doc.getRootElement();
	//System.out.println(rootNode);
	//4. 반복대상(getChildren("반복할 노드")), 단순 정보(getChild("찾아낼 노드"))
	Element channelNode = rootNode.getChild("channel");	
	//System.out.println(channelNode);
	Element pubDateNode = channelNode.getChild("pubDate");	
	//System.out.println(pubDateNode);
	Element titleNode = channelNode.getChild("title");	
	//System.out.println(titleNode);
	
	//반복 대상
	List<Element> itemNodes = channelNode.getChildren("item");
	
	%>
	<ul>
	<li><strong>발행일:</strong> <%= pubDateNode.getValue() %></li>
	<li><strong>제공자:</strong> <%= titleNode.getValue() %></li>
	<li><strong>뉴스의 수:</strong> <%= itemNodes.size() %></li>
	</ul>
	
	<% if(itemNodes.isEmpty()){ %>
		<div>작성된 뉴스가 없습니다.</div>
	<% }//end if %>
	
	<% 
	Element itemTitleNode = null;
	Element itemLinkNode = null;
	Element itemDescriptionNode = null;
	Element itemPubDateNode = null;
	
	int ind = 0;
	for( Element itemNode : itemNodes ) {
	itemTitleNode = itemNode.getChild("title");	
	itemLinkNode = itemNode.getChild("link");	
	itemDescriptionNode = itemNode.getChild("description");	
	itemPubDateNode = itemNode.getChild("pubDate");	
	%>
	<div>
	<ul>
	<li><%= ++ind %>. <strong>기사명</strong>: <a href="<%= itemLinkNode.getValue() %>"><%= itemTitleNode.getValue() %></a>,
		<strong>작성일</strong>: <%= itemPubDateNode.getValue() %></li>
	<li>&nbsp;&nbsp;<strong>기사내용</strong>: <%= itemDescriptionNode.getValue() %></li>
	</ul>
	</div>
	<% }//end for %>
	
	
	</c:if>
	</div>
</div>
</body>
</html>