<%@page import="java.util.Date"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="day1031.EmpVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="day1031.DeptDAO"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
<%
String paramDeptno = request.getParameter("deptno");

DeptDAO dDAO = DeptDAO.getInstance();
JSONObject jsonObj = new JSONObject();
//부가적인 정보 설정
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd a HH:mm:ss");
jsonObj.put("pubDate", sdf.format(new Date()));
jsonObj.put("dataSize",0);
jsonObj.put("searchFlag", false);
try {
	List<EmpVO> list = dDAO.selectDeptEmp(Integer.parseInt(paramDeptno));
	jsonObj.put("dataSize",list.size());
	jsonObj.put("searchFlag",true);
	
	JSONArray jsonArr = new JSONArray();
	JSONObject jsonTemp = null;
	
	SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
	for(EmpVO eVO : list){
		jsonTemp = new JSONObject();
		jsonTemp.put("empno", eVO.getEmpno());
		jsonTemp.put("mgr", eVO.getMgr());
		jsonTemp.put("sal", eVO.getSal());
		jsonTemp.put("ename", eVO.getEname());
		jsonTemp.put("job", eVO.getJob());
		jsonTemp.put("hiredate", sdf2.format(eVO.getHiredate())); // 에러 발생 // 날짜 들어간 건 simpleDateFormat 사용
		
		jsonArr.add(jsonTemp);
	}
	
	jsonObj.put("data",jsonArr);
	
} catch(SQLException se) {
	se.printStackTrace();
}// end catch

out.println(jsonObj.toJSONString());

%>