<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.example.javaweb.Trains" %>
<%@ page import="java.sql.SQLException" %>
<%--
  Created by IntelliJ IDEA.
  User: saiki
  Date: 01-09-2023
  Time: 23:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>View Trains</title>
    <link rel="stylesheet" href="UserHome_Css.css">
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
<%--create table to view trains--%>
<div class="view">
    <table border="1" width="100%" style="margin-left: 20%">
        <tr>
            <th>Sl.No</th>
            <th>Train Name</th>
            <th>Train No</th>
            <th>Source</th>
            <th>Destination</th>
            <th>Arrival Time</th>
            <th>Reach Time</th>
            <th>Reserve</th>
<%--            <th>Travel Time</th>--%>
<%--            <th>Class</th>--%>
<%--            <th>Book</th>--%>
        </tr>
        <%
            ResultSet rs;
            try {
                rs = Trains.view();
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
            while (rs.next()){
                try{
        %>
        <tr>
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getString(4)%></td>
            <td><%=rs.getString(5)%></td>
            <td><%=rs.getString(6)%></td>
            <td><%=rs.getString(7)%></td>
<%--            <td><%=train.getDistance()%></td>--%>
<%--            <td><%=train.getTravelTime()%></td>--%>
<%--            <td><%=train.getClasses()%></td>--%>
            <% String url="book.jsp?name="+request.getParameter("name")+"&"+"trainNo="+rs.getString(3);%>
            <td><a href=<%=url%>>Book</a></td>
        </tr>
        <%
            }catch (Exception e){
                e.printStackTrace();
            }
            }
        %>
    </table>
</div>
</body>
</html>
