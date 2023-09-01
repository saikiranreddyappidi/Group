<%@ page import="java.sql.SQLException" %>
<%@ page import="com.example.javaweb.user_reg" %><%--
  Created by IntelliJ IDEA.
  User: saiki
  Date: 01-09-2023
  Time: 09:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>LOGIN</title>
    <link rel="stylesheet" href="UserHome_Css.css">
</head>
<body>
<header>
    <h1 class="hd">Indian Railway Reservation System</h1>
    <div class="main">
			<span class="menu"> <a href="user_login.jsp">Login as User</a>
			</span> <span class="menu"> <a href="new_user.jsp">New User
					Register</a>
			</span> <span class="menu"> <a href="AdminLogin.html">Login as
					Admin</a>
			</span>
    </div>
</header>
<table class="tab brown hd">
    <tr>
        <td>New User Registration</td>
    </tr>
</table>

<table class="tab green">

    <tr>
        <td>
            <form action="new_user.jsp" method="post">
                Email Id : <input type="email" name="mailid"
                                  placeholder="Enter your emailId" required><br /> <br />
                Password : <input type="password" name="pword" required><br />
                <br /> FirstName: <input type="text" name="firstname" required><br />
                <br /> Last Name: <input type="text" name="lastname" required><br />
                <br /> Address : <input type="text" name="address" required><br />
                <br /> Phone No : <input type="number" name="phoneno" required><br />
<%--                <br /> Photo : <input type="file" name="userphoto"><br />--%>
                <br /> <input type="submit"
                              value=" I AGREE FOR ALL TERMS & CONDITIONS ! REGISTER ME "
                              style="text-align: center">
            </form>
        </td>

    </tr>
</table>

<%
    boolean flag;
    String mailid = request.getParameter("mailid");
    String pass = request.getParameter("pword");
    String fname = request.getParameter("firstname");
    String lname = request.getParameter("lastname");
    String addr = request.getParameter("address");
    String phno = request.getParameter("phoneno");
    try {
        flag = user_reg.create(mailid,pass,fname,lname,addr,phno);
    } catch (SQLException | ClassNotFoundException e) {
        throw new RuntimeException(e);
    }
%>
<% if (flag) { %>
<h1 class="hd" style="color: green"> Welcome <%= fname%> </h1>
<%--redirect to home page--%>
<%
    String redirectURL = "http://localhost:8080/JavaWeb_war_exploded/user_login.jsp?name="+mailid+"";
    response.sendRedirect(redirectURL);
%>
<%}%>

</body>
</html>
