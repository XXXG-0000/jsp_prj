<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    trimDirectiveWhitespaces="true"
    %>
<%
//1. JSONObject 생성 - Map기반
JSONObject jsonObj = new JSONObject();

//2. 값 할당
//generic 사용하지 않아 warning(jsonobject는 generic 사용 불가)
jsonObj.put("name","김현우");
jsonObj.put("age",20);

//3. JSONObject을 문자열로 얻기
//String jsonStr = jsonObj.toString();
String jsonStr = jsonObj.toJSONString();
%>
<%= jsonStr %>