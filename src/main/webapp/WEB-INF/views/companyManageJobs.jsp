<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Job Postings</title>
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
            padding: 40px 60px;
        }

        h1 {
            margin-bottom: 5px;
        }

        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 20px 0;
        }

        .post-btn {
            background: linear-gradient(90deg, #2a2aff, #5f2bff);
            border: none;
            color: white;
            padding: 12px 20px;
            border-radius: 20px;
            cursor: pointer;
        }

        .job-card {
            background: #e5e5e5;
            border-radius: 14px;
            padding: 20px;
            margin-bottom: 18px;
        }

        .job-title {
            font-size: 22px;
            font-weight: bold;
        }

        .meta {
            margin-top: 8px;
            font-size: 14px;
            display: flex;
            gap: 20px;
        }

        .status {
            padding: 6px 14px;
            border-radius: 14px;
            font-size: 13px;
        }

        .Active { background: #b8e0c2; }
        .Pending { background: #f2e7a1; }
        .Completed { background: #c9c9f5; }

        .actions {
            float: right;
            display: flex;
            gap: 12px;
        }

        .btn-icon {
            cursor: pointer;
            font-size: 18px;
        }

        form {
            background: #ffffff;
            padding: 30px 25px;
            border-radius: 16px;
            width: 380px;
            margin: 50px auto;
            box-shadow: 0 8px 25px rgba(0,0,0,0.2);
            text-align: center;
        }

        form::before {
            content: "Edit Job Posting";
            display: block;
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #1b6f75;
        }

        form input {
            width: 80%;
            padding: 12px 14px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 10px;
            font-size: 14px;
            outline: none;
            transition: 0.3s;
            background: #f9f9f9;
        }

        form input:focus {
            border-color: #2a9aa3;
            background: #fff;
            box-shadow: 0 0 6px rgba(42,154,163,0.4);
        }

        form input::placeholder {
            color: #888;
        }

        form button {
            width: 100%;
            padding: 13px;
            background: linear-gradient(90deg, #2a2aff, #5f2bff);
            color: #fff;
            border: none;
            border-radius: 25px;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        form button:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>

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

    <div class="top-bar">
        <div>
            <h1>Manage Job Postings</h1>
            <div>Oversee your active listings and track applicant progress.</div>
        </div>
    </div>

    <form method='post' action="EditCompanyPost">
        <input type="hidden" name="id" id="form-job-id">
        <input type="text" name="jobtitle" id="form-job-title" placeholder="Enter the title of the job" required><br>
        <input type="text" name="payment" id="form-job-payment" placeholder ="Enter the amount you want to pay" required><br>
        <input type="text" name="projectdescription" id="form-job-desc" placeholder="Enter the new Description about the project" required><br>
        <button type="submit" class="btn-btn-primary">Update Job</button>
    </form>

    <c:forEach var="job" items="${jobs}">
        <div class="job-card">
            <div class="actions">
                <span class="btn-icon" onclick="populateForm('${job.id}', '${job.jobtitle}', '${job.payment}', '${job.projectdescription}')">✏️</span>
                <span class="btn-icon">⏸️</span>
                <a href="deleteJob?id=${job.id}" style="text-decoration:none;"><span class="btn-icon">🗑️</span></a>
            </div>

            <div class="job-title">${job.jobtitle}</div>

            <div class="meta">
                <fmt:parseDate value="${job.timeline}" pattern="yyyy-MM-dd" var="parsedDate" />

                <span>📅 <fmt:formatDate value="${parsedDate}" pattern="MMM dd, yyyy" /></span>

                <span>💰 $${job.payment}</span>
                <span class="status Active">Active</span>
            </div>
        </div>
    </c:forEach>

</div>

<script>
    // This function puts the job data into the form at the top of the page
    function populateForm(id, title, payment, desc) {
        document.getElementById('form-job-id').value = id;
        document.getElementById('form-job-title').value = title;
        document.getElementById('form-job-payment').value = payment;
        document.getElementById('form-job-desc').value = desc;

        // Smooth scroll to the form so the user sees it's ready
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }
</script>

<jsp:include page="footer.jsp" />

</body>
</html>