<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - GaraMan</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="login-page">
<div class="login-container">
    <h2 class="login-title">GaraMan - Hệ thống quản lý Gara</h2>

    <form action="login" method="post" class="login-form">
        <label class="login-label">Username</label>
        <input type="text" name="username" class="login-input" required>

        <label class="login-label">Password</label>
        <input type="password" name="password" class="login-input" required>

        <button type="submit" class="login-btn">Login</button>
    </form>

    <% 
        String error = request.getParameter("error");
        if (error != null) { 
            String errorMsg = "❌ Login error occurred.";
            if ("invalid".equals(error)) {
                errorMsg = "❌ Invalid username or password";
            } else if ("noPosition".equals(error)) {
                errorMsg = "❌ Staff account has no position assigned. Please contact administrator.";
            } else if ("unknownPosition".equals(error)) {
                errorMsg = "❌ Your position is not authorized to access this system.";
            } else if ("role".equals(error)) {
                errorMsg = "❌ Account role is not recognized.";
            }
    %>
    <p class="login-error"><%= errorMsg %></p>
    <% } %>
</div>

</body>
</html>
