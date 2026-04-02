<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Profile Settings</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        /* === YOUR INITIAL CSS === */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: #1f7f82;
            color: #000;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 30px;
            background: #1f7f82;
            color: white;
        }

        .nav-right a {
            margin-left: 20px;
            text-decoration: none;
            color: white;
            font-size: 14px;
        }

        /* === PROFILE FORM STYLING === */
        .main-container {
            width: 70%;
            margin: 40px auto;
            background: white;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }

        .header-section {
            margin-bottom: 30px;
            border-bottom: 1px solid #eee;
            padding-bottom: 15px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 25px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 15px;
        }

        .full-width { grid-column: span 2; }

        label {
            font-weight: 600;
            margin-bottom: 8px;
            font-size: 14px;
            color: #333;
        }

        input {
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
            transition: 0.3s;
        }

        input:focus {
            border-color: #1f7f82;
            outline: none;
            box-shadow: 0 0 5px rgba(31, 127, 130, 0.2);
        }

        /* Resume Display Box */
        .resume-display-box {
            margin-top: 10px;
            padding: 15px;
            background: #f4fbfc;
            border: 2px dashed #1f7f82;
            border-radius: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .btn-save {
            background: #1f7f82;
            color: white;
            border: none;
            padding: 15px 35px;
            border-radius: 10px;
            cursor: pointer;
            font-weight: bold;
            font-size: 16px;
            margin-top: 20px;
            width: 100%;
            transition: 0.3s;
        }

        .btn-save:hover { background: #166466; }

        .alert-success {
            background: #d4edda;
            color: #155724;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 25px;
            border-left: 5px solid #28a745;
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

<div class="navbar">
    <div>👤</div>
    <div class="nav-right">
        <a href="studentDashboard">Dashboard</a>
        <a href="studentProject">Projects</a>
        <a href="studentJobs">Work and Jobs</a>
        <a href="studentMessage">Message</a>
        <a href="studentPayments">Payments</a>
        <a href="studentSettings">Settings</a>
    </div>
</div>

<div class="main-container">
    <div class="header-section">
        <h2><i class="fa fa-user-circle"></i> Profile Settings</h2>
        <p style="color: #666;">Manage your personal information and documents</p>
    </div>

    <c:if test="${not empty successMsg}">
        <div class="alert-success">
            <i class="fa fa-check-circle"></i> ${successMsg}
        </div>
    </c:if>

    <div class="settings-card">
        <form id="studentProfileForm" action="updateStudentDetails" method="post" enctype="multipart/form-data">

            <input type="hidden" name="id" value="${student.id}">

            <div class="form-grid">
                <div class="form-group">
                    <label>First Name</label>
                    <input type="text" id="firstName" name="firstName" value="${student.firstName}" required>
                    <div class="error-message" id="firstNameError">First name is required and must be 2+ characters</div>
                </div>

                <div class="form-group">
                    <label>Last Name</label>
                    <input type="text" id="lastName" name="lastName" value="${student.lastName}" required>
                    <div class="error-message" id="lastNameError">Last name is required and must be 2+ characters</div>
                </div>

                <div class="form-group full-width">
                    <label>Email Address</label>
                    <input type="email" id="profileEmail" name="email" value="${student.email}" required>
                    <div class="error-message" id="profileEmailError">Please enter a valid email address</div>
                </div>

                <div class="form-group">
                    <label>Profession</label>
                    <input type="text" id="profession" name="profession" value="${student.profession}" placeholder="e.g. Full Stack Developer">
                    <div class="error-message" id="professionError">Profession must be 3+ characters</div>
                </div>

                <div class="form-group">
                    <label>Location / Address</label>
                    <input type="text" id="address" name="address" value="${student.address}" placeholder="City, Country">
                    <div class="error-message" id="addressError">Address must be 5+ characters</div>
                </div>

                <div class="form-group full-width">
                    <label>Update Resume (PDF/JPG)</label>
                    <input type="file" name="resumeFile" accept=".pdf,.jpg,.jpeg">

                    <c:if test="${not empty student.resume}">
                        <div class="resume-display-box">
                            <div>
                                <i class="fa fa-file-pdf" style="color: #e74c3c;"></i>
                                <span style="margin-left: 10px; font-weight: 500;">Resume Uploaded</span>
                            </div>
                            <a href="viewResume?id=${student.id}" target="_blank"
                               style="color: #1f7f82; text-decoration: none; font-weight: bold;">
                                <i class="fa fa-eye"></i> View Current Resume
                            </a>
                        </div>
                    </c:if>
                </div>

                <div class="form-group full-width">
                    <label>Account Password</label>
                    <input type="password" id="password" name="password" value="${student.password}" required>
                    <div class="error-message" id="passwordError">Password must be 6+ characters</div>
                </div>
            </div>

            <button type="submit" class="btn-save">
                <i class="fa fa-save"></i> Save Changes
            </button>
        </form>
    </div>
</div>

<script>
$(document).ready(function() {
    // Real-time validation
    $("#firstName").on("blur", function() {
        var value = $(this).val().trim();
        if (value.length < 2) {
            $(this).addClass("input-error");
            $("#firstNameError").addClass("show");
        } else {
            $(this).removeClass("input-error").addClass("input-success");
            $("#firstNameError").removeClass("show");
        }
    });

    $("#lastName").on("blur", function() {
        var value = $(this).val().trim();
        if (value.length < 2) {
            $(this).addClass("input-error");
            $("#lastNameError").addClass("show");
        } else {
            $(this).removeClass("input-error").addClass("input-success");
            $("#lastNameError").removeClass("show");
        }
    });

    $("#profileEmail").on("blur", function() {
        var email = $(this).val().trim();
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            $(this).addClass("input-error");
            $("#profileEmailError").addClass("show");
        } else {
            $(this).removeClass("input-error").addClass("input-success");
            $("#profileEmailError").removeClass("show");
        }
    });

    $("#profession").on("blur", function() {
        var value = $(this).val().trim();
        if (value && value.length < 3) {
            $(this).addClass("input-error");
            $("#professionError").addClass("show");
        } else if (value) {
            $(this).removeClass("input-error").addClass("input-success");
            $("#professionError").removeClass("show");
        } else {
            $(this).removeClass("input-error").removeClass("input-success");
        }
    });

    $("#address").on("blur", function() {
        var value = $(this).val().trim();
        if (value && value.length < 5) {
            $(this).addClass("input-error");
            $("#addressError").addClass("show");
        } else if (value) {
            $(this).removeClass("input-error").addClass("input-success");
            $("#addressError").removeClass("show");
        } else {
            $(this).removeClass("input-error").removeClass("input-success");
        }
    });

    $("#password").on("blur", function() {
        var value = $(this).val().trim();
        if (value.length < 6) {
            $(this).addClass("input-error");
            $("#passwordError").addClass("show");
        } else {
            $(this).removeClass("input-error").addClass("input-success");
            $("#passwordError").removeClass("show");
        }
    });

    // Form submission validation
    $("#studentProfileForm").on("submit", function(e) {
        var isValid = true;

        // Validate First Name
        if ($("#firstName").val().trim().length < 2) {
            $("#firstName").addClass("input-error");
            $("#firstNameError").addClass("show");
            isValid = false;
        }

        // Validate Last Name
        if ($("#lastName").val().trim().length < 2) {
            $("#lastName").addClass("input-error");
            $("#lastNameError").addClass("show");
            isValid = false;
        }

        // Validate Email
        var email = $("#profileEmail").val().trim();
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            $("#profileEmail").addClass("input-error");
            $("#profileEmailError").addClass("show");
            isValid = false;
        }

        // Validate Password
        if ($("#password").val().trim().length < 6) {
            $("#password").addClass("input-error");
            $("#passwordError").addClass("show");
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