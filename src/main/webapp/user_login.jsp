<%@ page import="com.example.javaweb.user_reg" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>E-Trains</title>
    <link rel="stylesheet" href="UserHome_Css.css">
    <style>
    </style>
</head>
<body>
<header>
    <h1 class="hd">Indian Railway Reservation System</h1>
    <h1 class="hd" style="color: green"> Welcome <%= request.getParameter("name")%> </h1>--%>
    <div class="home">
        <p class="menu">
            <a href="user_login.jsp?name=<%= request.getParameter("name")%>">Home</a>
        </p>
    </div>
    <div class="home">
        <p class="menu">
            <a href="viewTrains.jsp?name=<%= request.getParameter("name")%>">View Trains</a>
        </p>
    </div>
    <div class="home">
        <p class="menu">
            <a href="viewTrains.jsp?name=<%= request.getParameter("name")%>">Trains Between Stations</a>
        </p>
    </div>
    <div class="home">
        <p class="menu">
            <a href="history.jsp?name=<%= request.getParameter("name")%>">Ticket Booking History</a>
        </p>
    </div>
    <div class="home">
        <p class="menu">
            <a href="fareenqfwd">Fare Enquiry</a>
        </p>
    </div>
    <div class="home">
        <p class="menu">
            <a href="useravailfwd">Seat Availability</a>
        </p>
    </div>
    <div class="home">
        <p class="menu">
            <a href="usersearchtrain">Search By TrainNo</a>
        </p>
    </div>
    <div class="home">
        <p class="menu">
            <a href="userprofile">Profile</a>
        </p>
    </div>
    <div class="home">
        <p class="menu">
            <a href="logout.jsp?name=<%= request.getParameter("name") %>">Logout</a>
        </p>
    </div>
</header>

</body>
</html>
