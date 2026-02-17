<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Jobs</title>
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Segoe UI", sans-serif;
}

body {
    background: #f6f7fb;
    display: flex;
    min-height: 100vh;
}

/* Sidebar */
.sidebar {
    width: 240px;
    background: #ffffff;
    padding: 20px;
    border-right: 1px solid #e6e6e6;
}

.sidebar h2 {
    margin-bottom: 30px;
    font-size: 18px;
}

.menu a {
    display: flex;
    align-items: center;
    padding: 10px 12px;
    margin-bottom: 8px;
    text-decoration: none;
    color: #333;
    border-radius: 8px;
    font-size: 14px;
}

.menu a i {
    width: 20px;
    margin-right: 10px;
    color: #6c63ff;
}

.menu a.active,
.menu a:hover {
    background: #f0f1f7;
}

/* Main Content */
.main {
    flex: 1;
    padding: 30px;
}

.header {
    font-size: 24px;
    font-weight: 600;
    margin-bottom: 25px;
}

/* Job Cards */
.job-card {
    background: #ffffff;
    border-radius: 16px;
    padding: 18px 20px;
    margin-bottom: 18px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 4px 14px rgba(0,0,0,0.05);
    transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.job-card:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 20px rgba(0,0,0,0.08);
}

/* Text Section */
.status {
    font-size: 12px;
    color: #6c63ff;
    font-weight: 600;
    margin-bottom: 6px;
}

.title {
    font-size: 18px;
    font-weight: 600;
    margin-bottom: 8px;
    color: #222;
}

.description {
    font-size: 13px;
    color: #666;
    max-width: 520px;
    line-height: 1.5;
    margin-bottom: 12px;
}

/* Approve Button */
.approve-btn {
    background: #f0f1f7;
    border: none;
    padding: 8px 14px;
    border-radius: 8px;
    font-size: 13px;
    cursor: pointer;
    transition: all 0.2s ease;
}

.approve-btn:hover {
    background: #6c63ff;
    color: #fff;
}

/* Image */
.job-image img {
    width: 180px;
    height: 120px;
    object-fit: cover;
    border-radius: 14px;
}
</style>
</head>

<body>

<!-- Sidebar -->
<div class="sidebar">
    <h2>Admin Panel</h2>
    <div class="menu">
        <a href="adminDashboard.jsp"><i class="fa-solid fa-chart-line"></i> Dashboard</a>
        <a href="adminUsers.jsp"><i class="fa-solid fa-users"></i> Users</a>
        <a href="adminJobs.jsp" class="active">
            <i class="fa-solid fa-briefcase"></i> Jobs
        </a>
        <a href="adminCompany.jsp"><i class="fa-solid fa-building"></i> Company Verification</a>
        <a href="adminInvoice.jsp"><i class="fa-solid fa-file-invoice"></i> Invoice</a>
        <a href="adminInsights.jsp"><i class="fa-solid fa-chart-pie"></i> Insights</a>
        <a href="adminPayment.jsp"><i class="fa-solid fa-credit-card"></i> Payments</a>
        <a href="adminSettings.jsp"><i class="fa-solid fa-gear"></i> Settings</a>
    </div>
</div>

<!-- Main Content -->
<div class="main">
    <div class="header">Job Post Approval</div>

    <%
        List<Map<String, String>> jobs = Arrays.asList(
            Map.of(
                "status", "Pending",
                "title", "Senior UX/UI Designer",
                "description", "Design intuitive user interfaces for web and mobile applications. Collaborate with product managers and engineers to define and implement innovative solutions. Conduct user research and usability testing to ensure designs meet user needs.",
                "action", "Approve Job",
                "image", "https://via.placeholder.com/300x200"
            ),
            Map.of(
                "status", "Pending",
                "title", "Mobile App Developer",
                "description", "Develop high-quality mobile applications for iOS and Android platforms. Work closely with the design team to translate designs and wireframes into clean, efficient, and maintainable code. Ensure the performance, quality, and responsiveness of applications.",
                "action", "Approve Job",
                "image", "https://via.placeholder.com/300x200"
            ),
            Map.of(
                "status", "Pending",
                "title", "Content Marketing Specialist",
                "description", "Create and execute content marketing strategies to drive brand awareness and generate leads. Develop engaging content for various channels, including blog posts, social media, email campaigns, and website copy. Analyze content performance and optimize strategies to achieve marketing goals.",
                "action", "Approve Job",
                "image", "https://via.placeholder.com/300x200"
            ),
            Map.of(
                "status", "Pending",
                "title", "Data Analyst",
                "description", "Analyze large datasets to identify trends, patterns, and insights that inform business decisions. Develop and maintain dashboards and reports to track key performance indicators (KPIs). Collaborate with stakeholders to understand their data needs and provide actionable recommendations.",
                "action", "Approve Job",
                "image", "https://via.placeholder.com/300x200"
            )
        );

        for (Map<String, String> job : jobs) {
    %>

    <div class="job-card">
        <div>
            <div class="status"><%= job.get("status") %></div>
            <div class="title"><%= job.get("title") %></div>
            <div class="description"><%= job.get("description") %></div>
            <button class="approve-btn"><%= job.get("action") %></button>
            <button class="approve-btn">Delete</button>
        </div>

        <div class="job-image">
            <img src="<%= job.get("image") %>" alt="<%= job.get("title") %>" />
        </div>
    </div>

    <%
        }
    %>

</div>

</body>
</html>