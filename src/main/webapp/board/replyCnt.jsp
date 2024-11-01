<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.board.ReplyDAO"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
<jsp:useBean id="rVO" class="kr.co.sist.user.board.ReplyVO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="rVO"/>
<%
JSONObject jsonObj = new JSONObject();
int cnt = 0;
try{
	int ref_num = Integer.parseInt(request.getParameter("ref_num"));
	ReplyDAO rDAO = ReplyDAO.getInstance();
	cnt = rDAO.selectReplyCnt(ref_num);
} catch(SQLException se){
	se.printStackTrace();
}// end catch

jsonObj.put("rowCnt",cnt);
out.print(jsonObj.toJSONString());
%>