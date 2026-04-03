<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reset Password - Talent Talk</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        /* Reuse your previous styles for background and container */
        body { height:100vh; background: linear-gradient(135deg, #1fa2a6, #2c7da0); display:flex; justify-content:center; align-items:center; font-family: 'Segoe UI', sans-serif; }
        .container { background: white; padding: 40px; border-radius: 15px; box-shadow: 0 10px 30px rgba(0,0,0,0.2); text-align:center; width: 450px; }
        input { width: 100%; padding: 12px; margin: 10px 0; border-radius: 8px; border: 1px solid #ddd; }
        .btn { background: #1e3cfa; color: white; border: none; cursor: pointer; font-weight: bold; }
        .error { color: red; font-size: 12px; }
    </style>
</head>
<body>

<div class="container">
    <h2>Set New Password</h2>
    <p style="font-size: 14px; color: #666; margin-bottom: 20px;">Please enter a secure password.</p>

    <% if (request.getAttribute("errorMsg") != null) { %>
    <div style="color: #d32f2f; background: #ffebee; padding: 10px; border-radius: 8px; margin-bottom: 16px;">
        <%= request.getAttribute("errorMsg") %>
    </div>
    <% } %>

    <% if (request.getAttribute("successMsg") != null) { %>
    <div style="color: #2e7d32; background: #e8f5e9; padding: 10px; border-radius: 8px; margin-bottom: 16px;">
        <%= request.getAttribute("successMsg") %>
    </div>
    <% } %>

    <form action="${pageContext.request.contextPath}/updateCompanyPassword" method="post" id="resetForm">
        <input type="hidden" name="token" value="${token}">

        <input type="password" name="password" id="pass" placeholder="New Password" required>
        <input type="password" id="confirmPass" placeholder="Confirm New Password" required>
        <div id="matchError" class="error"></div>

        <input type="submit" value="Update Password" class="btn">
    </form>
</div>

<script>
    $('#resetForm').submit(function(e) {
        if ($('#pass').val() !== $('#confirmPass').val()) {
            $('#matchError').text("Passwords do not match!");
            e.preventDefault();
        }
    });
</script>

</body>
</html>