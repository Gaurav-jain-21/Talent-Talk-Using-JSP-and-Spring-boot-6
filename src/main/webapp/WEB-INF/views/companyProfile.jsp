<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Company Settings | Talent Talk</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            display: flex;
            background: #f5f6f8;
            min-height: 100vh;
        }

        /* SIDEBAR */
        .sidebar {
            width: 240px;
            background: #1f7f86;
            color: white;
            position: fixed;
            height: 100vh;
            padding: 20px;
        }

        .profile {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }

        .profile img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
        }

        .menu a {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 12px;
            margin-bottom: 8px;
            color: rgba(255,255,255,0.8);
            text-decoration: none;
            border-radius: 8px;
            font-size: 14px;
            transition: 0.3s;
        }

        .menu a:hover, .menu a.active {
            background: #166a70;
            color: white;
        }

        /* MAIN CONTENT AREA */
        .main-container {
            margin-left: 240px; /* Offset for fixed sidebar */
            flex: 1;
            padding: 40px;
        }

        .header-section {
            margin-bottom: 30px;
        }

        .header-section h2 {
            color: #333;
            font-size: 24px;
        }

        /* SETTINGS FORM CARD */
        .settings-card {
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.05);
            max-width: 800px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .full-width {
            grid-column: span 2;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #555;
            font-size: 14px;
        }

        input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 14px;
            outline: none;
            transition: border-color 0.3s;
        }

        input:focus {
            border-color: #1f7f86;
        }

        .btn-save {
            background: #1f7f86;
            color: white;
            padding: 12px 30px;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 15px;
            margin-top: 10px;
        }

        .btn-save:hover {
            background: #166a70;
        }

        /* SUCCESS MESSAGE */
        .alert-success {
            background: #d4edda;
            color: #155724;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            border: 1px solid #c3e6cb;
        }

        /* Form Validation Styles */
        .input-error {
            border-color: #e74c3c !important;
            background: #fadbd8;
        }

        .error-message {
            color: #e74c3c;
            font-size: 12px;
            margin-top: 4px;
            display: none;
        }

        .error-message.show {
            display: block;
        }

        .input-success {
            border-color: #28a745 !important;
            background: #d4edda;
        }
    </style>
</head>
<body>

<div class="sidebar">
    <div class="profile">
        <img src="https://i.pravatar.cc/40" alt="Profile">
        <div>
            <div style="font-weight: bold;">${company.name}</div>
            <div style="font-size: 12px; opacity: 0.8;">Company Admin</div>
        </div>
    </div>

    <div class="menu">
        <a href="companyDashboard"><i class="fa fa-home"></i> Dashboard</a>
        <a href="companyClient"><i class="fa fa-users"></i> Client</a>
        <a href="companyJobs"><i class="fa fa-briefcase"></i> Post Jobs</a>
        <a href="companyManageJobs"><i class="fa fa-list"></i> Manage Jobs</a>
        <a href="companyApplication"><i class="fa fa-file"></i> Application</a>
        <a href="companyMessage"><i class="fa fa-envelope"></i> Message</a>
        <a href="companyPayment"><i class="fa fa-dollar-sign"></i> Payments</a>
        <a href="companySettings" class="active"><i class="fa fa-gear"></i> Settings</a>
    </div>
</div>

<div class="main-container">
    <div class="header-section">
        <h2>Account Settings</h2>
        <p style="color: #777;">Update your company profile information</p>
    </div>

    <c:if test="${param.success == 'true'}">
        <div class="alert-success">
            <i class="fa fa-check-circle"></i> Changes saved successfully!
        </div>
    </c:if>

    <div class="settings-card">
        <form id="companyProfileForm" action="updateCompanyDetails" method="post">
            <input type="hidden" name="id" value="${company.id}">

            <div class="form-grid">
                <div class="form-group full-width">
                    <label>Company Name</label>
                    <input type="text" id="companyName" name="name" value="${company.name}" required>
                    <div class="error-message" id="companyNameError">Company name is required and must be 3+ characters</div>
                </div>

                <div class="form-group">
                    <label>Email Address</label>
                    <input type="email" id="companyEmail" name="email" value="${company.email}" required>
                    <div class="error-message" id="companyEmailError">Please enter a valid email address</div>
                </div>

                <div class="form-group">
                    <label>Password</label>
                    <input type="password" id="companyPassword" name="password" value="${company.password}" required>
                    <div class="error-message" id="companyPasswordError">Password must be 6+ characters</div>
                </div>

                <div class="form-group">
                    <label>Industry</label>
                    <input type="text" id="industry" name="industry" value="${company.industry}" placeholder="e.g. Technology">
                    <div class="error-message" id="industryError">Industry must be 2+ characters</div>
                </div>

                <div class="form-group">
                    <label>Headquarters</label>
                    <input type="text" id="headQuarter" name="headQuarter" value="${company.headQuarter}" placeholder="City, Country">
                    <div class="error-message" id="headQuarterError">Headquarters must be 5+ characters</div>
                </div>
            </div>

            <button type="submit" class="btn-save">
                <i class="fa fa-save"></i> Update Profile
            </button>
        </form>
    </div>
</div>

<script>
$(document).ready(function() {
    // Real-time validation
    $("#companyName").on("blur", function() {
        var value = $(this).val().trim();
        if (value.length < 3) {
            $(this).addClass("input-error");
            $("#companyNameError").addClass("show");
        } else {
            $(this).removeClass("input-error").addClass("input-success");
            $("#companyNameError").removeClass("show");
        }
    });

    $("#companyEmail").on("blur", function() {
        var email = $(this).val().trim();
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            $(this).addClass("input-error");
            $("#companyEmailError").addClass("show");
        } else {
            $(this).removeClass("input-error").addClass("input-success");
            $("#companyEmailError").removeClass("show");
        }
    });

    $("#companyPassword").on("blur", function() {
        var value = $(this).val().trim();
        if (value.length < 6) {
            $(this).addClass("input-error");
            $("#companyPasswordError").addClass("show");
        } else {
            $(this).removeClass("input-error").addClass("input-success");
            $("#companyPasswordError").removeClass("show");
        }
    });

    $("#industry").on("blur", function() {
        var value = $(this).val().trim();
        if (value && value.length < 2) {
            $(this).addClass("input-error");
            $("#industryError").addClass("show");
        } else if (value) {
            $(this).removeClass("input-error").addClass("input-success");
            $("#industryError").removeClass("show");
        } else {
            $(this).removeClass("input-error").removeClass("input-success");
        }
    });

    $("#headQuarter").on("blur", function() {
        var value = $(this).val().trim();
        if (value && value.length < 5) {
            $(this).addClass("input-error");
            $("#headQuarterError").addClass("show");
        } else if (value) {
            $(this).removeClass("input-error").addClass("input-success");
            $("#headQuarterError").removeClass("show");
        } else {
            $(this).removeClass("input-error").removeClass("input-success");
        }
    });

    // Form submission validation
    $("#companyProfileForm").on("submit", function(e) {
        var isValid = true;

        // Validate Company Name
        if ($("#companyName").val().trim().length < 3) {
            $("#companyName").addClass("input-error");
            $("#companyNameError").addClass("show");
            isValid = false;
        }

        // Validate Email
        var email = $("#companyEmail").val().trim();
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            $("#companyEmail").addClass("input-error");
            $("#companyEmailError").addClass("show");
            isValid = false;
        }

        // Validate Password
        if ($("#companyPassword").val().trim().length < 6) {
            $("#companyPassword").addClass("input-error");
            $("#companyPasswordError").addClass("show");
            isValid = false;
        }

        if (!isValid) {
            e.preventDefault();
        }
    });
});
</script>

</body>
</html>