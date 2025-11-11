<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.text.*, Garaman.model.SparePartReceiptStat, Garaman.model.Supplier, Garaman.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
    
    NumberFormat nf = NumberFormat.getInstance(new Locale("vi", "VN"));
    nf.setMaximumFractionDigits(0);
    
    Supplier supplier = (Supplier) request.getAttribute("supplier");
    List<SparePartReceiptStat> receipts = (List<SparePartReceiptStat>) request.getAttribute("receipts");
    Double totalValue = (Double) request.getAttribute("totalValue");
    
    SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Supplier Import Details - GaraMan</title>
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

<%
%>

<div class="revenue-container">
    <h2 class="revenue-title">Supplier Import Details</h2>
    
    <!-- Supplier Info -->
    <div class="supplier-info" style="margin-bottom: 30px;">
        <h3 class="revenue-subtitle">Supplier Information</h3>
        <table class="revenue-table">
            <tr>
                <td style="width: 200px;"><strong>Supplier Name:</strong></td>
                <td><%= supplier != null ? supplier.getName() : "" %></td>
            </tr>
            <tr>
                <td><strong>Phone Number:</strong></td>
                <td><%= supplier != null ? supplier.getPhoneNumber() : "" %></td>
            </tr>
            <tr>
                <td><strong>Email:</strong></td>
                <td><%= supplier != null ? supplier.getEmail() : "" %></td>
            </tr>
            <tr>
                <td><strong>Address:</strong></td>
                <td><%= supplier != null ? supplier.getAddress() : "" %></td>
            </tr>
        </table>
    </div>
    
    <!-- Receipts Table -->
    <h3 class="revenue-subtitle">Receipt List</h3>
    
    <% if (receipts == null || receipts.isEmpty()) { %>
        <p class="revenue-error">This supplier has no import receipts yet.</p>
    <% } else { %>
        <table class="revenue-table">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Receipt Date</th>
                    <th style="text-align: center;">Total Amount (VND)</th>
                    <th>Warehouse Staff</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    int index = 1;
                    for (SparePartReceiptStat receipt : receipts) { 
                %>
                    <tr>
                        <td><%= index++ %></td>
                        <td>
                            <a href="receiptDetail?receiptId=<%= receipt.getId() %>&supplierId=<%= supplier.getId() %>" class="usage-link">
                                <%= outputFormat.format(receipt.getDate()) %>
                            </a>
                        </td>
                        <td style="text-align: center;"><%= nf.format(receipt.getTotalAmount()) %></td>
                        <td><%= receipt.getWarehouseStaff() != null && receipt.getWarehouseStaff().getName() != null ? receipt.getWarehouseStaff().getName() : "N/A" %></td>
                    </tr>
                <% } %>
                <tr style="background-color: #f0f0f0; font-weight: bold;">
                    <td colspan="2"><strong>TOTAL IMPORT VALUE</strong></td>
                    <td style="text-align: center;"><strong><%= nf.format(totalValue != null ? totalValue : 0) %> VND</strong></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    <% } %>
    
    <!-- Back Button -->
    <a href="supplierStatistic" class="revenue-btn">← Back to List</a>
</div>

</body>
</html>
