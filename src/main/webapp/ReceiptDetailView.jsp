<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.text.*, Garaman.model.SparePartReceiptDetailStat, Garaman.model.SparePartReceiptStat, Garaman.model.Supplier, Garaman.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
    
    NumberFormat nf = NumberFormat.getInstance(new Locale("vi", "VN"));
    nf.setMaximumFractionDigits(0);
    
    SparePartReceiptStat receipt = (SparePartReceiptStat) request.getAttribute("receipt");
    List<SparePartReceiptDetailStat> details = (List<SparePartReceiptDetailStat>) request.getAttribute("details");
    Double total = (Double) request.getAttribute("total");
    Supplier supplier = (Supplier) request.getAttribute("supplier");
    String supplierId = (String) request.getAttribute("supplierId");
    
    SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Receipt Details - GaraMan</title>
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
    <h2 class="revenue-title">Receipt Details</h2>
    
    <!-- Supplier Info -->
    <% if (supplier != null) { %>
    <div class="supplier-info" style="margin-bottom: 30px;">
        <h3 class="revenue-subtitle">Supplier Information</h3>
        <table class="revenue-table">
            <tr>
                <td style="width: 200px;"><strong>Supplier Name:</strong></td>
                <td><%= supplier.getName() %></td>
            </tr>
            <tr>
                <td><strong>Address:</strong></td>
                <td><%= supplier.getAddress() != null ? supplier.getAddress() : "N/A" %></td>
            </tr>
            <tr>
                <td><strong>Phone Number:</strong></td>
                <td><%= supplier.getPhoneNumber() != null ? supplier.getPhoneNumber() : "N/A" %></td>
            </tr>
            <tr>
                <td><strong>Email:</strong></td>
                <td><%= supplier.getEmail() != null ? supplier.getEmail() : "N/A" %></td>
            </tr>
        </table>
    </div>
    <% } %>
    
    <!-- Receipt Info -->
    <div class="supplier-info" style="margin-bottom: 30px;">
        <h3 class="revenue-subtitle">Receipt Information</h3>
        <table class="revenue-table">
            <tr>
                <td style="width: 200px;"><strong>Receipt ID:</strong></td>
                <td>#<%= receipt != null ? receipt.getId() : "" %></td>
            </tr>
            <tr>
                <td><strong>Receipt Date:</strong></td>
                <td><%= receipt != null ? outputFormat.format(receipt.getDate()) : "" %></td>
            </tr>
            <tr>
                <td><strong>Warehouse Staff:</strong></td>
                <td><%= receipt != null && receipt.getWarehouseStaff() != null && receipt.getWarehouseStaff().getName() != null ? receipt.getWarehouseStaff().getName() : "N/A" %></td>
            </tr>
            <tr>
                <td><strong>Total Value:</strong></td>
                <td><strong><%= receipt != null ? nf.format(receipt.getTotalAmount()) : "0" %> VND</strong></td>
            </tr>
        </table>
    </div>
    
    <!-- Receipt Details Table -->
    <h3 class="revenue-subtitle">Spare Parts Details</h3>
    
    <% if (details == null || details.isEmpty()) { %>
        <p class="revenue-error">No spare parts details in this receipt.</p>
    <% } else { %>
        <table class="revenue-table">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Spare Part Name</th>
                    <th style="text-align: right;">Quantity</th>
                    <th style="text-align: center;">Unit Price (VND)</th>
                    <th style="text-align: center;">Total (VND)</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    int index = 1;
                    for (SparePartReceiptDetailStat detail : details) { 
                %>
                    <tr>
                        <td><%= index++ %></td>
                        <td><%= detail.getSparePart() != null ? detail.getSparePart().getName() : "N/A" %></td>
                        <td style="text-align: right;"><%= detail.getQuantity() %></td>
                        <td style="text-align: center;"><%= nf.format(detail.getUnitPrice()) %></td>
                        <td style="text-align: center;"><%= nf.format(detail.getTotalAmount()) %></td>
                    </tr>
                <% } %>
                <tr style="background-color: #f0f0f0; font-weight: bold;">
                    <td colspan="4"><strong>TOTAL</strong></td>
                    <td style="text-align: center;"><strong><%= nf.format(total != null ? total : 0) %> VND</strong></td>
                </tr>
            </tbody>
        </table>
    <% } %>
    
    <!-- Back Button -->
    <a href="supplierDetail?supplierId=<%= supplierId != null ? supplierId : "" %>" class="revenue-btn">← Back to Receipt List</a>
</div>

</body>
</html>
