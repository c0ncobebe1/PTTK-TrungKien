<%--
  Created by IntelliJ IDEA.
  User: c0ncobebe1
  Date: 10/22/2025
  Time: 2:14 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Garaman.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Home - GaraMan</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body class="manager-page">

<div class="navbar">
    <div class="navbar-left">
        <h1>GaraMan</h1>
        <span class="navbar-user">Welcome, <strong><%= user.getName() %></strong></span>
        <a href="logout" class="logout-btn">Logout</a>
    </div>
</div>
<div class="manager-container">
    <h1 class="manager-title">Customer Menu</h1>

    <a href="BookAppointmentForm.jsp" class="manager-button">Book Online Appointment</a>
</div>
</body>
</html>

