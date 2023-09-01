<%@ page import="com.example.javaweb.user_reg" %>
<%@ page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  User: saiki
  Date: 28-08-2023
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Login</title>
</head>
<body>
<%
    boolean flag;
    String uname = request.getParameter("uname");
    try {
        flag = user_reg.login(uname,request.getParameter("pword"));
    } catch (SQLException | ClassNotFoundException e) {
        throw new RuntimeException(e);
    }
%>
<% if (flag) { %>
<h1> Welcome <%= uname%> </h1>
<% } else { %>
<h1> Invalid Username or Password </h1>
<% } %>


</body>
</html>
