<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Profile Settings</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

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
        <form action="updateStudentDetails" method="post" enctype="multipart/form-data">

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
                    <input type="text" name="profession" value="${student.profession}" placeholder="e.g. Full Stack Developer">
                </div>

                <div class="form-group">
                    <label>Location / Address</label>
                    <input type="text" name="address" value="${student.address}" placeholder="City, Country">
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
                    <input type="password" name="password" value="${student.password}" required>
                </div>
            </div>

            <button type="submit" class="btn-save">
                <i class="fa fa-save"></i> Save Changes
            </button>
        </form>
    </div>
</div>

</body>
</html>