<%--
  Created by IntelliJ IDEA.
  User: Khanh
  Date: 10/22/2025
  Time: 10:39 AM
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
    <title>Manager Menu - GaraMan</title>
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
<div class="manager-container" style="display: flex; flex-direction: column; align-items: center; justify-content: center; min-height: 70vh;">
    <h1 class="manager-title">Manager Home</h1>

    <a href="supplierStatistic" class="manager-button">View Supplier Statistics</a>
</div>

</body>
</html>
