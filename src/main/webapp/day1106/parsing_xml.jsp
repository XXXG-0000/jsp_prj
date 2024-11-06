<%@page import="org.jdom2.output.Format"%>
<%@page import="org.jdom2.output.XMLOutputter"%>
<%@page import="org.jdom2.Element"%>
<%@page import="org.jdom2.Document"%>
<%@ page language="java" contentType="application/xml; charset=UTF-8"
    pageEncoding="UTF-8"
    info="파싱 - 2"
    trimDirectiveWhitespaces="true"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
//1. 문서 객체 생성
Document doc = new Document();
//2. 최상위 노드 생성
Element rootNode = new Element("names");
//3. 자식 노드 생성
Element nameNode = new Element("name");
nameNode.setText("정동진");
//4. 자식 노드 부모 노드에 배치
rootNode.addContent(nameNode);
//5. 부모 노드를 문서 객체에 배치
doc.addContent(rootNode);
//6. 문서 객체 출력
XMLOutputter xOut = new XMLOutputter(Format.getPrettyFormat());
xOut.output(doc,out);
%>