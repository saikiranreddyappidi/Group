<%@ page import="java.sql.SQLException" %>
<%@ page import="com.example.javaweb.user_reg" %>
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
                Password : <input type="password" name="pword" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required><br />
                <br /> FirstName: <input type="text" name="firstname" required><br />
                <br /> Last Name: <input type="text" name="lastname" required><br />
                <br /> Address : <input type="text" name="address" required><br />
                <br /> Phone No : <input type="text" name="phoneno" required><br />
<%--                <br /> Photo : <input type="file" name="userphoto"><br />--%>
                <br /> <input type="submit"
                              value=" I AGREE FOR ALL TERMS & CONDITIONS ! REGISTER ME "
                              style="text-align: center">
                <p id="message"></p>
            </form>
        </td>

    </tr>
</table>
<script>
    var myInput = document.getElementById("psw");
    var letter = document.getElementById("letter");
    var capital = document.getElementById("capital");
    var number = document.getElementById("number");
    var length = document.getElementById("length");

    // When the user clicks on the password field, show the message box
    myInput.onfocus = function() {
        document.getElementById("message").style.display = "block";
    }

    // When the user clicks outside of the password field, hide the message box
    myInput.onblur = function() {
        document.getElementById("message").style.display = "none";
    }

    // When the user starts to type something inside the password field
    myInput.onkeyup = function() {
        // Validate lowercase letters
        var lowerCaseLetters = /[a-z]/g;
        if(myInput.value.match(lowerCaseLetters)) {
            letter.classList.remove("invalid");
            letter.classList.add("valid");
        } else {
            letter.classList.remove("valid");
            letter.classList.add("invalid");
        }

        // Validate capital letters
        var upperCaseLetters = /[A-Z]/g;
        if(myInput.value.match(upperCaseLetters)) {
            capital.classList.remove("invalid");
            capital.classList.add("valid");
        } else {
            capital.classList.remove("valid");
            capital.classList.add("invalid");
        }

        // Validate numbers
        var numbers = /[0-9]/g;
        if(myInput.value.match(numbers)) {
            number.classList.remove("invalid");
            number.classList.add("valid");
        } else {
            number.classList.remove("valid");
            number.classList.add("invalid");
        }

        // Validate length
        if(myInput.value.length >= 8) {
            length.classList.remove("invalid");
            length.classList.add("valid");
        } else {
            length.classList.remove("valid");
            length.classList.add("invalid");
        }
    }


    function isValidPhoneNumber(phoneNumber) {
        // Check the format of the phone number.
        if (!/\d{3}-\d{3}-\d{4}/.test(phoneNumber)) {
            return false;
        }

        // Check if the phone number is valid for the country it is associated with.
        const countryCode = phoneNumber.slice(0, 3);
        if (!countryCode in validPhoneNumbers) {
            return false;
        }

        // Check if the phone number is valid for the area code.
        const areaCode = phoneNumber.slice(4, 7);
        if (!areaCode in validPhoneNumbers[countryCode]) {
            return false;
        }

        // Check if the phone number is valid for the local number.
        const localNumber = phoneNumber.slice(8);
        if (!localNumber in validPhoneNumbers[countryCode][areaCode]) {
            return false;
        }

        return true;
    }
</script>

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
