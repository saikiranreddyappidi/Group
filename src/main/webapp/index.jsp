<%@ page import="com.example.javaweb.user_reg" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>E-Trains</title>
    <link rel="stylesheet" href="UserHome_Css.css">
</head>
<body>
<header>
    <h1 class="hd">Indian Railway Reservation System</h1>
    <div class="home">
        <p class="menu">
            <a href="#userhome">Home</a>
        </p>
    </div>
    <div class="home">
        <p class="menu">
            <a href="#userviewtrainfwd">View Trains</a>
        </p>
    </div>
    <div class="home">
        <p class="menu">
            <a href="#trainbwstnfwd">Trains Between Stations</a>
        </p>
    </div>
    <div class="home">
        <p class="menu">
            <a href="#bookingdetails">Ticket Booking History</a>
        </p>
    </div>
    <div class="home">
        <p class="menu">
            <a href="#fareenqfwd">Fare Enquiry</a>
        </p>
    </div>
    <div class="home">
        <p class="menu">
            <a href="#useravailfwd">Seat Availability</a>
        </p>
    </div>
    <div class="home">
        <p class="menu">
            <a href="#usersearchtrain">Search By TrainNo</a>
        </p>
    </div>
    <div class="home">
        <p class="menu">
            <a href="#userprofile">Profile</a>
        </p>
    </div>
    <div class="home">
        <p class="menu">
            <a href="#userlogout">Logout</a>
        </p>
    </div>
</header>
<div class="tab green">User Login</div>
<form action="index.jsp" class="tab brown" method="post">
    <br /> UserName: <input type="text" name="uname"
                            placeholder="Enter Your EmailId"> <br /> <br /> Password: <input
        type="password" name="pword"> <br /> <br />
    <input type="submit" value=" LOGIN "><br />

    <%
        int flag;
        String uname = request.getParameter("uname");
        try {
            flag = user_reg.login(uname,request.getParameter("pword"));
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    %>
    <% if (flag==1) { %>
    <%--redirect to home page--%>
    <%
        String redirectURL = "http://localhost:8080/JavaWeb_war_exploded/user_login.jsp?name="+uname+"";
        response.sendRedirect(redirectURL);
    %>
    <% } else if(uname != null && flag==0) { %>
    <p style="color: red"> Invalid Username or Password </p>
    <% } else if (flag==-1) { %>
    <%
        String redirectURL = "http://localhost:8080/JavaWeb_war_exploded/new_user.jsp";
        response.sendRedirect(redirectURL);
    %>
    <% } %>
</form>
<br />
<footer>

</footer>

</body>
</html>