<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.example.javaweb.Trains" %>
<%@ page import="java.sql.SQLException" %>

<%--
  Created by IntelliJ IDEA.
  User: saikiran
  Date: 02-09-2023
  Time: 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Status</title>
</head>
<body>
<%
    try {
        Trains.status(request.getParameter("name"),request.getParameter("train"),request.getParameter("status"));
//        redirect to status page
        response.sendRedirect("AdminHome.jsp");
    } catch (SQLException | ClassNotFoundException e) {
        throw new RuntimeException(e);
    }
%>
</body>
</html>
