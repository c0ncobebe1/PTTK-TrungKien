<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, Garaman.model.SupplierStat, Garaman.model.User, java.text.NumberFormat, java.util.Locale" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
    
    NumberFormat nf = NumberFormat.getInstance(new Locale("vi", "VN"));
    nf.setMaximumFractionDigits(0);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Supplier Statistics - GaraMan</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body class="revenue-page">
<div class="navbar">
    <div class="navbar-left">
        <h1>GaraMan</h1>
        <span class="navbar-user">Welcome, <strong><%= user.getName() %></strong></span>
        <a href="logout" class="logout-btn">Logout</a>
    </div>
</div>

<div class="revenue-container">

    <h2 class="revenue-title">Supplier Import Statistics</h2>

    <!-- Date Filter -->
    <form action="supplierStatistic" method="get" class="revenue-form">
        <label class="revenue-label">Date from:</label>
        <input type="date" name="startDate" class="revenue-input"
               value="<%= request.getAttribute("startDate") != null ? request.getAttribute("startDate") : "" %>">

        <label class="revenue-label">Date to:</label>
        <input type="date" name="endDate" class="revenue-input"
               value="<%= request.getAttribute("endDate") != null ? request.getAttribute("endDate") : "" %>">

        <input type="submit" class="revenue-btn" value="View">
    </form>

    <% String errorMsg = (String) request.getAttribute("errorMsg"); %>
    <% if (errorMsg != null) { %>
    <div class="revenue-error"><%= errorMsg %></div>
    <% } %>

    <!-- Supplier Statistics Table -->
    <%
        List<SupplierStat> supplierStats = (List<SupplierStat>) request.getAttribute("supplierStats");
        Integer totalImports = (Integer) request.getAttribute("totalImports");
        Double totalValue = (Double) request.getAttribute("totalValue");
    %>

    <% if (supplierStats != null) { %>
    <h3 class="revenue-subtitle">Supplier Import Details</h3>
    <table class="revenue-table">
        <tr>
            <th>No.</th>
            <th>Supplier Name</th>
            <th style="text-align: center;">Phone Number</th>
            <th>Email</th>
            <th style="text-align: right;">Total Imports (Quantity)</th>
            <th style="text-align: center;">Total Value (VND)</th>
        </tr>
        <%
            if (supplierStats != null && !supplierStats.isEmpty()) {
                int index = 1;
                for (SupplierStat s : supplierStats) {
        %>
        <tr>
            <td><%= index++ %></td>
            <td>
                <a href="supplierDetail?supplierId=<%= s.getId() %>" class="usage-link">
                    <%= s.getName() %>
                </a>
            </td>
            <td style="text-align: center;"><%= s.getPhoneNumber() %></td>
            <td><%= s.getEmail() %></td>
            <td style="text-align: right;"><%= s.getTotalImports() %></td>
            <td style="text-align: center;"><%= nf.format(s.getTotalValue()) %></td>
        </tr>
        <% } } else { %>
        <tr><td colspan="6">No supplier statistics available.</td></tr>
        <% } %>
    </table>

    <p class="revenue-total">Total quantity imported: <%= totalImports != null ? totalImports : 0 %></p>
    <p class="revenue-total">
        <strong>Total import value: <%= nf.format(totalValue != null ? totalValue : 0) %> VND</strong>
    </p>
    <% } %>

    <a href="ManagerHome.jsp" class="revenue-btn">Back to Home</a>

</div>
</body>
</html>
