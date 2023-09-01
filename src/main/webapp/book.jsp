<%@ page import="com.example.javaweb.Trains" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: saiki
  Date: 02-09-2023
  Time: 00:35
  To change this template use File | Settings | File Templates.
--%>
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

<div class='tab'>
    <p class='menu'> Please book only if you are sure !
    </p>
</div>

<div class="main">
    <p class="menu">Book trains</p>
</div>
<div class="tab">
    <p class="menu red">
        Please Check The <a href='Availability.html'>Seat availability</a>
        before Booking !
    </p>
</div>

<%
    String train = request.getParameter("trainNo");
    String email = request.getParameter("name");
%>

<form action="" class="tab red" method="post">
<%--    Email: <p><%=email%></p><br /> <br />--%>
    TrainNumber: <p><%=train%></p><br /> <br />
    No of seats:
    <label>
        <input type='int' name='seats' value="1">
    </label><br /> <br /> <input
        type="submit" value=" Book Now "><br />
</form>
<%
    int seats=1;
    boolean flag=false;
    if(request.getParameter("seats")!=null) {
        seats = Integer.parseInt(request.getParameter("seats"));
        try {
            flag = Trains.book_train(train, email, seats);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    if(flag) {
        response.sendRedirect("history.jsp?name="+email);
    }
%>
<%--<p class='menu red'>Booking Failed</p>--%>
<br />

</body>
</html>
