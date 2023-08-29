<%--
  Created by IntelliJ IDEA.
  User: saiki
  Date: 24-08-2023
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
</head>
<body>
<p>You reached home page</p>
<%! int size;%>
<% for(size=10; size<20;size++){%>
<p style="font-size: <%= size %>px">Java Server Page</p>
<br>
<% } %>
</body>
</html>
