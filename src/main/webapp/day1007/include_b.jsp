<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    info="�׽�Ʈ"
    %>
<!-- ���ڵ�, info ���� �ٸ� ��� error -->
	<%
		// ��� JSP���� ����ϰ� �� ���� �ڵ带 �ַ� �ۼ�
		// ��) �α��� ���� ������ �����ȴ�. �α����� �Ǿ����� üũ�ϴ� �ڵ带 �ۼ��� �� �ʿ��� JSP����
		// include�Ͽ� ����Ѵ�.
		String msg = "������ usecase�� confirm �մϴ�";
	%>
	<div id="in">����JSP</div>
	<div id="in"><%= msg %></div>
