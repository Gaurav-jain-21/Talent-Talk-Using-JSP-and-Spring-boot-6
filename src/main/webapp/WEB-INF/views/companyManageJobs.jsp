<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    </style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <div>Logo</div>
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

<div class="main">

<%
    List<Map<String, String>> jobs = new ArrayList<>();

    Map<String, String> j1 = new HashMap<>();
    j1.put("title", "Mobile App Developer");
    j1.put("date", "Oct 16, 2026");
    j1.put("applications", "42 Applications");
    j1.put("status", "Active");
    jobs.add(j1);

    Map<String, String> j2 = new HashMap<>();
    j2.put("title", "Brand Identity Designer");
    j2.put("date", "Oct 16, 2026");
    j2.put("applications", "0 Applications");
    j2.put("status", "Pending");
    jobs.add(j2);

    Map<String, String> j3 = new HashMap<>();
    j3.put("title", "Fullstack Node.js Dev.");
    j3.put("date", "Oct 16, 2026");
    j3.put("applications", "Hired: Alex River");
    j3.put("status", "Completed");
    jobs.add(j3);

    Map<String, String> j4 = new HashMap<>();
    j4.put("title", "Data Science (ML)");
    j4.put("date", "Oct 16, 2026");
    j4.put("applications", "18 Applications");
    j4.put("status", "Active");
    jobs.add(j4);
%>

    <div class="top-bar">
        <div>
            <h1>Manage Job Postings</h1>
            <div>Oversee your active listings and track applicant progress.</div>
        </div>
        <button class="post-btn">+ Post New Jobs</button>
    </div>

<%
    for (Map<String, String> job : jobs) {
%>

    <div class="job-card">
        <div class="actions">
            <span class="btn-icon">✏️</span>
            <span class="btn-icon">⏸️</span>
            <span class="btn-icon">🗑️</span>
        </div>

        <div class="job-title"><%= job.get("title") %></div>

        <div class="meta">
            <span>📅 <%= job.get("date") %></span>
            <span>👥 <%= job.get("applications") %></span>
            <span class="status <%= job.get("status") %>"><%= job.get("status") %></span>
        </div>
    </div>

<%
    }
%>

</div>

</body>
</html>
