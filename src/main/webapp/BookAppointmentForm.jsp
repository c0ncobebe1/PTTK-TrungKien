<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="Garaman.model.Customer, Garaman.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
    
    Customer customer = (Customer) user;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Book Appointment - GaraMan</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="appointment-page">

<div class="navbar">
    <div class="navbar-left">
        <h1>GaraMan</h1>
        <span class="navbar-user">Welcome, <strong><%= user.getName() %></strong></span>
        <a href="logout" class="logout-btn">Logout</a>
    </div>
</div>

<%

    String success = (String) session.getAttribute("success");
    if (success != null) { session.removeAttribute("success"); }
    String error = (String) request.getAttribute("error");
%>

<div class="appointment-box">
    <h2 class="appointment-title">Book Online Appointment</h2>

    <form action="appointment" method="post">
        <div class="appointment-row">
            <div style="flex:1;">
                <label class="appointment-label">Select Date <span style="color:#d32f2f">*</span></label>
                <input type="date" name="appointmentDate" required>
            </div>
            <div style="flex:1;">
                <label class="appointment-label">Select Time <span style="color:#d32f2f">*</span></label>
                <input type="time" name="appointmentTime" required>
            </div>
        </div>

        <div class="appointment-row">
            <div style="flex:1;">
                <label class="appointment-label">Full Name</label>
                <input type="text" name="name" value="<%= customer != null ? customer.getName() : "" %>" required>
            </div>
            <div style="flex:1;">
                <label class="appointment-label">Phone Number</label>
                <input type="text" name="phoneNumber"  required>
            </div>
        </div>

        <div class="appointment-row">
            <div style="flex:1;">
                <label class="appointment-label">Email</label>
                <input type="email" name="email" >
            </div>
            <div style="flex:1;">
                <label class="appointment-label">Address</label>
                <input type="text" name="address" >
            </div>
        </div>

        <input type="submit" value="Book Appointment" class="appointment-btn">
    </form>

    <% if (error != null) { %>
    <p class="appointment-message appointment-error"><%= error %></p>
    <% } else if (success != null) { %>
    <p class="appointment-message appointment-success"><%= success %></p>
    <% } %>

    <a href="CustomerHome.jsp" class="appointment-back">← Back to Home</a>
</div>

</body>
</html>
