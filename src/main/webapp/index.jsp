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
    <h1 class="hd">National Ticket Booking Spot</h1>
    <div class="home">
        <p class="menu">
            <a href="userhome">Home</a>
        </p>
    </div>
    <div class="home">
        <p class="menu">
            <a href="userviewtrainfwd">View Trains</a>
        </p>
    </div>
    <div class="home">
        <p class="menu">
            <a href="trainbwstnfwd">Trains Between Stations</a>
        </p>
    </div>
    <div class="home">
        <p class="menu">
            <a href="bookingdetails">Ticket Booking History</a>
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
            <a href="userlogout">Logout</a>
        </p>
    </div>
</header>
<div class="tab green">User Login</div>
<form action="user_login.jsp" class="tab brown" method="post">
    <br /> UserName: <input type="text" name="uname"
                            placeholder="Enter Your EmailId"> <br /> <br /> Password: <input
        type="password" name="pword"> <br /> <br /> <input
        type="submit" value=" LOGIN "><br />
</form>
#call the class from the package


<br />
<footer>
<%--    <address id="cent">--%>
<%--        Contact: Mr. Shashi Raj<br />Email:<a href="mailto">Shashi@alumni.com</a><br />PhoneNo:--%>
<%--        9547462319--%>
<%--    </address>--%>
</footer>

</body>
</html>