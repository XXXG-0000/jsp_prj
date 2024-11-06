<%@page import="org.jdom2.output.Format"%>
<%@page import="org.jdom2.output.XMLOutputter"%>
<%@page import="org.jdom2.Element"%>
<%@page import="org.jdom2.Document"%>
<%@ page language="java" contentType="application/xml; charset=UTF-8"
    pageEncoding="UTF-8"
    info="파싱2 - 4"
    trimDirectiveWhitespaces="true"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String[] msgArr={"오늘은 수요일 입니다","쌀쌀한 날씨","화창한 하늘","미국 대선","감기 조심하세요"};
//1. 문서 객체 생성
Document doc = new Document();
//2. 최상위 노드 생성
Element rootNode = new Element("msgs");
//3. 자식 노드 생성
Element msgNode = null;
for(String msg : msgArr){
	msgNode = new Element("msg");
	msgNode.setText(msg);
	//4. 자식 노드 부모 노드에 배치
	rootNode.addContent(msgNode);
}//end for
//5. 부모 노드를 문서 객체에 배치
doc.addContent(rootNode);
//6. 문서 객체 출력
XMLOutputter xOut = new XMLOutputter(Format.getPrettyFormat());
xOut.output(doc,out);
%>