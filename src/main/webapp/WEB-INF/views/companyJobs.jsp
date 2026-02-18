<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Post a New Job</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(90deg, #1f7a82, #2a9aa3);
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

        .nav-left {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .profile-img {
            width: 35px;
            height: 35px;
            border-radius: 50%;
            background-color: #fff;
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

        .nav-links a:hover {
            text-decoration: underline;
        }

        /* Main Layout */
        .main-wrapper {
            display: flex;
            justify-content: center;
            padding: 40px 0;
        }

        .container {
            width: 700px;
            background: rgba(255, 255, 255, 0.05);
            padding: 30px 40px 40px;
            border-radius: 12px;
            color: #000;
        }

        h1 {
            text-align: center;
            margin-bottom: 25px;
        }

        .header-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }

        .save-draft {
            display: flex;
            align-items: center;
            gap: 6px;
            font-size: 14px;
            cursor: pointer;
        }

        .section-title {
            font-weight: bold;
            margin: 20px 0 10px;
        }

        label {
            font-size: 14px;
            display: block;
            margin-bottom: 6px;
        }

        input, textarea, select {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            border: none;
            background: #d9d9d9;
            font-size: 14px;
        }

        .row {
            display: flex;
            gap: 15px;
            margin-top: 10px;
        }

        .row > div {
            flex: 1;
        }

        textarea {
            height: 120px;
            resize: none;
        }

        .post-btn {
            margin-top: 25px;
            width: 180px;
            padding: 12px;
            border: none;
            border-radius: 20px;
            background: linear-gradient(90deg, #2a2aff, #5f2bff);
            color: #fff;
            font-size: 20px;
            cursor: pointer;
            float: right;
        }

        .post-btn:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <div class="nav-left">
        <div class="profile-img"></div>
    </div>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/companyDashboard">Dashboard</a>
        <a href="${pageContext.request.contextPath}/companyClient">Clients</a>
        <a href="${pageContext.request.contextPath}/companyJobs">Post Jobs</a>
        <a href="${pageContext.request.contextPath}/companyManageJobs">Manage Jobs</a>
        <a href="${pageContext.request.contextPath}/companyApplication">Application</a>
        <a href="${pageContext.request.contextPath}/companyMessage">Messages</a>
        <a href="${pageContext.request.contextPath}/companyPayment">Payments</a>
        <a href="#">Settings</a>
    </div>
</div>

<div class="main-wrapper">
    <div class="container">
        <h1>Post a New Jobs</h1>

        <div class="header-row">
            <div class="section-title">Project Details</div>
            <div class="save-draft">💾 Save Draft</div>
        </div>

        <label>Job Title</label>
        <input type="text" placeholder="Enter job title" />

        <label style="margin-top:15px;">Project Category</label>
        <select>
            <option>Select category</option>
            <option>Web Development</option>
            <option>Mobile App</option>
            <option>Design</option>
        </select>

        <div class="row">
            <div>
                <label>Payment</label>
                <input type="text" placeholder="$" />
            </div>
            <div>
                <label>Time Line</label>
                <input type="date" />
            </div>
        </div>

        <label style="margin-top:15px;">Job Description</label>
        <textarea placeholder="Write job details..."></textarea>

        <button class="post-btn">Post</button>
    </div>
</div>

</body>
</html>