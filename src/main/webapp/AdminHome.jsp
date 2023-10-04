<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.example.javaweb.Trains" %>
<%@ page import="java.sql.SQLException" %>
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
				<a href="AdminHome.html">Home</a>
			</p>
		</div>
		<div class="home">
			<p class="menu">
				<a href="adminviewtrainfwd">View Trains</a>
			</p>
		</div>
		<div class="home">
			<p class="menu">
				<a href="adminsearchtrainfwd">Search By TrainNo</a>
			</p>
		</div>

		<div class="home">
			<p class="menu">
				<a href="addtrainfwd">Add Train</a>
			</p>
		</div>
		<div class="home">
			<p class="menu">
				<a href="cancletrainfwd">Delete Train </a>
			</p>
		</div>
		<div class="home">
			<p class="menu">
				<a href="updatetrain">Update Train Details</a>
			</p>
		</div>
		<div class="home">
			<p class="menu">
				<a href="adminlogout">Logout</a>
			</p>
		</div>
	</header>
	
	<div class='tab'>
		<p class='menu'> Hey, Admin ! Welcome to our new NITRTC Website
		</p>
	</div>
	<div class="view">
		<table border="1" width="100%" style="margin-left: 20%">
			<tr>
				<%--      <th>Sl.No</th>--%>
				<th>User</th>
				<th>Train No</th>
				<th>Seats Required</th>
				<th>Status</th>
				<th>Confirm</th>
				<th>Cancel</th>
			</tr>
			<%
				ResultSet rs;
				try {
					rs = Trains.admin_ticket();
				} catch (SQLException | ClassNotFoundException e) {
					throw new RuntimeException(e);
				}
				while (rs.next()){
					try{
			%>
			<tr>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(2)%></td>

				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><a href="http://localhost:8080/JavaWeb_war_exploded/status.jsp?name=<%=rs.getString(3)%>&train=<%=rs.getString(2)%>&status=<%=true%>" >Confirm</a></td>
				<td><a href="http://localhost:8080/JavaWeb_war_exploded	/status.jsp?name=<%=rs.getString(3)%>&train=<%=rs.getString(2)%>&status=<%=false%>" >Cancel</a></td>
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