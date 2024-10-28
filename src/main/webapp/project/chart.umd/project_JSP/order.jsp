<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.Order" %>  <%-- 이 부분이 문제의 원인 --%>
<%
    // 세션에서 주문 리스트 관리
    List<Order> orders = (List<Order>) session.getAttribute("orders");
    if (orders == null) {
        orders = new ArrayList<>();
        session.setAttribute("orders", orders);
    }

    // 주문 추가 처리
    String action = request.getParameter("action");
    if ("add".equals(action)) {
        orders.add(new Order());
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>주문 상태 리스트</title>
    <style>
        body { font-family: Arial, sans-serif; }
        table { width: 50%; margin: auto; border-collapse: collapse; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: center; }
    </style>
</head>
<body>
    <h1>주문 상태 리스트</h1>
    <form method="post" action="order.jsp">
        <input type="hidden" name="action" value="add">
        <button type="submit">주문하기</button>
    </form>

    <table>
        <thead>
            <tr>
                <th>주문 번호</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (Order order : orders) {
            %>
                <tr>
                    <td><%= order.getOrderNumber() %></td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>
