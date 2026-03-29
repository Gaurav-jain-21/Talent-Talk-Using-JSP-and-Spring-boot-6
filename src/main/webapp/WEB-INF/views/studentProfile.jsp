<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Account Settings</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        /* === YOUR INITIAL CSS (DO NOT CHANGE) === */
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

        /* === NECESSARY FORM STYLING (ADD THIS) === */
        .main-container {
            width: 70%;
            margin: 40px auto;
            background: white;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }

        .header-section { margin-bottom: 30px; }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
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
            outline: none;
        }

        input:focus { border-color: #1f7f82; }

        .btn-save {
            background: #1f7f82;
            color: white;
            border: none;
            padding: 15px 30px;
            border-radius: 10px;
            cursor: pointer;
            font-weight: bold;
            font-size: 16px;
            margin-top: 20px;
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
    </style>
</head>
<body>

<div class="navbar">
    <div>👤</div>
    <div class="nav-right">
        <a href="studentDashboard">Dashboard</a>
        <a href="studentProject">Projects</a>
        <a href="studentJobs">Find Jobs</a>
        <a href="studentMessage">Message</a>
        <a href="studentPayments">Payments</a>
        <a href="studentSettings">Settings</a>
    </div>
</div>

<div class="main-container">
    <div class="header-section">
        <h2>Account Settings</h2>
        <p style="color: #777;">Update your profile information</p>
    </div>

    <%-- Using a proper attribute check instead of just param --%>
    <c:if test="${not empty successMsg}">
        <div class="alert-success">
            <i class="fa fa-check-circle"></i> ${successMsg}
        </div>
    </c:if>

    <div class="settings-card">
        <form action="updateStudentDetails" method="post">
            <%-- Hidden ID is crucial for the update query --%>
            <input type="hidden" name="id" value="${student.id}">

            <div class="form-grid">
                <div class="form-group">
                    <label>First Name</label>
                    <input type="text" name="firstName" value="${student.firstName}" required>
                </div>

                <div class="form-group">
                    <label>Last Name</label>
                    <input type="text" name="lastName" value="${student.lastName}" required>
                </div>

                <div class="form-group full-width">
                    <label>Email Address</label>
                    <input type="email" name="email" value="${student.email}" required>
                </div>

                <div class="form-group">
                    <label>Profession</label>
                    <input type="text" name="profession" value="${student.profession}" placeholder="e.g. Student">
                </div>

                <div class="form-group">
                    <label>Address</label>
                    <input type="text" name="address" value="${student.address}" placeholder="City, Country">
                </div>

                <%-- Password should usually be in a separate section for security --%>
                <div class="form-group full-width">
                    <label>New Password (Leave blank to keep current)</label>
                    <input type="password" name="password" value="${student.password}">
                </div>
            </div>

            <button type="submit" class="btn-save">
                <i class="fa fa-save"></i> Update Profile
            </button>
        </form>
    </div>
</div>

</body>
</html>