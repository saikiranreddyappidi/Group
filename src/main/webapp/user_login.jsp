        <%@ page import="com.example.javaweb.user_reg" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDateTime" %><%--
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
    boolean flag = false;
    String uname = "";
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/railway", "root", "database@9440672439");
        uname = request.getParameter("uname");
        String pword = request.getParameter("pword");
        String insertQuery = "INSERT INTO railway.user_login (username, paswd,datetime) VALUES (?, ?, ?)";
        PreparedStatement preparedStatement = con.prepareStatement(insertQuery);
        preparedStatement.setString(1, uname);
        preparedStatement.setString(2, pword);
        preparedStatement.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));
        preparedStatement.executeUpdate();
        preparedStatement.close();
        con.close();
        flag = true;
    } catch (Exception e) {
        e.printStackTrace();
    }

%>
<% if (flag) { %>
<h1> Welcome <%= uname%> </h1>
<% } else { %>
<h1> Invalid Username or Password </h1>
<% } %>


</body>
</html>
