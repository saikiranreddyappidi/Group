<%@ page import="com.example.javaweb.user_reg" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: saiki
  Date: 01-09-2023
  Time: 23:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>logout</title>
</head>
<body>
<h1>logout</h1>
<%
    try {
        user_reg.logout(request.getParameter("name"));
    } catch (SQLException | ClassNotFoundException e) {
        throw new RuntimeException(e);
    }
    response.sendRedirect("index.jsp");
%>
</body>
</html>
