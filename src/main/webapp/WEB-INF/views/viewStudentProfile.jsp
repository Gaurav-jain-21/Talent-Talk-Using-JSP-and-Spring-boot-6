<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Applicant Profile - ${student.firstName}</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(90deg, #1f7a82, #2a9aa3);
            color: #111;
        }

        /* Navbar */
        .navbar {
            background-color: #1b6f75;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 30px;
            color: #fff;
        }

        .nav-links {
            display: flex;
            gap: 25px;
        }

        .nav-links a {
            text-decoration: none;
            color: #fff;
            font-size: 14px;
        }

        .main {
            padding: 30px 60px 60px;
        }

        h1 {
            margin: 10px 0 5px;
        }

        .subtitle {
            color: #0d2d2f;
            margin-bottom: 20px;
        }

        /* Profile Layout */
        .profile-container {
            display: flex;
            gap: 30px;
            align-items: flex-start;
        }

        .student-sidebar {
            flex: 1;
            min-width: 300px;
        }

        .resume-viewer {
            flex: 2;
            background: #fff;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        /* Sidebar Card */
        .profile-card {
            background: #fff;
            padding: 25px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .avatar {
            width: 80px;
            height: 80px;
            background: #1f7a82;
            color: white;
            font-size: 24px;
            line-height: 80px;
            border-radius: 50%;
            margin: 0 auto 15px;
            text-transform: uppercase;
        }

        .info-group {
            text-align: left;
            margin-bottom: 15px;
        }

        .info-group label {
            display: block;
            font-size: 12px;
            color: #666;
            font-weight: bold;
            margin-bottom: 4px;
        }

        .info-group span {
            font-size: 14px;
            color: #333;
        }

        /* Buttons and Tags */
        .action-buttons {
            margin-top: 20px;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .btn-primary {
            background-color: #1f7a82;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 8px;
            width: 100%;
            cursor: pointer;
            font-weight: bold;
        }

        .btn-danger {
            background-color: #d9534f;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 8px;
            width: 100%;
            cursor: pointer;
            font-weight: bold;
        }

        .btn-danger:hover { background-color: #c9302c; }
        .btn-primary:hover { background-color: #165b61; }

        .tag {
            background: #e0f2f1;
            color: #00796b;
            padding: 4px 10px;
            border-radius: 15px;
            font-size: 12px;
            margin: 0 5px 5px 0;
            display: inline-block;
        }

        .viewer-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
            border-bottom: 1px solid #eee;
            padding-bottom: 10px;
        }

        .download-link {
            color: #1f7a82;
            text-decoration: none;
            font-weight: bold;
            font-size: 14px;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <div>Logo</div>
    <div class="nav-links">
        <a href="companyDashboard">Dashboard</a>
        <a href="companyClient">Clients</a>
        <a href="companyJobs">Post Jobs</a>
        <a href="companyManageJobs">Manage Jobs</a>
        <a href="companyApplication">Application</a>
        <a href="companyMessage">Messages</a>
        <a href="companyPayment">Payments</a>
        <a href="companySettings">Settings</a>
    </div>
</div>

<div class="main">
    <h1>Applicant Profile</h1>
    <h2>
        <p class="subtitle">
            Reviewing candidate for: <strong style="color: #1f7a82;">${jobTitle}</strong>
        </p>
    </h2>
    <div class="profile-container">
        <div class="student-sidebar">
            <div class="avatar">
                <c:out value="${student.firstName.substring(0,1)}${student.lastName.substring(0,1)}"/>
            </div>
            <h2>${student.firstName} ${student.lastName}</h2>
            <hr>
            <div class="info-group">
                <label>Email Address</label>
                <span>${student.email}</span>
            </div>

            <div class="action-buttons">
                <form action="shortlist" method="post">
                    <input type="hidden" name="appId" value="${appId}">
                    <button type="submit" class="btn-primary">Shortlist Candidate</button>
                </form>
                <form action="reject" method="post" style="flex:1;">
                    <input type="hidden" name="appId" value="${appId}">
                    <button type="submit" class="btn btn-danger"
                            onclick="return confirm('Are you sure you want to reject this applicant?')">
                        Reject
                    </button>
                </form>
            </div>
        </div>

        <div class="resume-viewer">
            <div class="viewer-header">
                <h3>Resume Preview</h3>
                <a href="displayResume?id=${student.id}" download class="download-link">Download PDF</a>
            </div>
            <c:choose>
                <c:when test="${not empty student.resume}">
                    <iframe src="displayResume?id=${student.id}" width="100%" height="700px" style="border: 1px solid #ddd;"></iframe>
                </c:when>
                <c:otherwise>
                    <p style="text-align: center; padding: 50px;">No resume uploaded.</p>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>