<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<!-- Font Awesome Icons -->
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

    /* Stats Cards */
    .cards {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 20px;
        margin-bottom: 30px;
    }

    .card {
        background: #fff;
        padding: 20px;
        border-radius: 14px;
    }

    .card p {
        font-size: 14px;
        color: #777;
    }

    .card h3 {
        margin: 10px 0;
        font-size: 22px;
    }

    .growth {
        color: #22c55e;
        font-size: 13px;
    }

    /* Earnings Section */
    .earnings {
        background: #fff;
        padding: 25px;
        border-radius: 14px;
        margin-bottom: 30px;
    }

    .earnings h3 {
        margin-bottom: 10px;
    }

    .chart {
        margin-top: 20px;
        height: 180px;
        background: linear-gradient(180deg, #ecebfd, #ffffff);
        border-radius: 10px;
        display: flex;
        align-items: flex-end;
        padding: 15px;
        gap: 10px;
    }

    .bar {
        width: 100%;
        background: #6c63ff;
        border-radius: 6px;
    }

    /* Recent Activity */
    .activity {
        background: #fff;
        padding: 25px;
        border-radius: 14px;
    }

    .activity h3 {
        margin-bottom: 15px;
    }

    .activity-item {
        display: flex;
        justify-content: space-between;
        padding: 12px 0;
        border-bottom: 1px solid #eee;
        font-size: 14px;
    }

    .status.completed {
        color: #22c55e;
    }

    .status.pending {
        color: #f59e0b;
    }
</style>
</head>

<body>

<!-- Sidebar -->
<div class="sidebar">
    <h2>Admin Panel</h2>
    <div class="menu">
        <a href="adminDashboard" class="active">
            <i class="fa-solid fa-chart-line"></i> Dashboard
        </a>

        <a href="adminUsers">
            <i class="fa-solid fa-users"></i> Users
        </a>

        <a href="adminJobs">
            <i class="fa-solid fa-briefcase"></i> Jobs
        </a>

        <a href="adminCompany">
            <i class="fa-solid fa-building"></i> Company Verification
        </a>

        <a href="adminInvoice">
            <i class="fa-solid fa-file-invoice"></i> Invoice
        </a>

        <a href="adminInsights">
            <i class="fa-solid fa-chart-pie"></i> Insights
        </a>

        <a href="adminPayment">
            <i class="fa-solid fa-credit-card"></i> Payments
        </a>

        <a href="adminSettings">
            <i class="fa-solid fa-gear"></i> Settings
        </a>
    </div>
</div>

<!-- Main Content -->
<div class="main">
    <div class="header">Dashboard</div>

    <!-- Stats -->
    <div class="cards">
        <div class="card">
            <p>Total Users</p>
            <h3>12,345</h3>
            <span class="growth">+12%</span>
        </div>

        <div class="card">
            <p>Active Jobs</p>
            <h3>567</h3>
            <span class="growth">+5%</span>
        </div>

        <div class="card">
            <p>Total Payments</p>
            <h3>$89,012</h3>
            <span class="growth">+8%</span>
        </div>
    </div>

    <!-- Earnings -->
    <div class="earnings">
        <h3>Earnings Overview</h3>
        <p><strong>$89,012</strong> — Last 30 Days <span class="growth">+8%</span></p>

        <div class="chart">
            <div class="bar" style="height:60%"></div>
            <div class="bar" style="height:45%"></div>
            <div class="bar" style="height:70%"></div>
            <div class="bar" style="height:50%"></div>
            <div class="bar" style="height:85%"></div>
            <div class="bar" style="height:55%"></div>
        </div>
    </div>

    <!-- Recent Activity -->
    <div class="activity">
        <h3>Recent Activity</h3>

        <div class="activity-item">
            <span>Project: Website Redesign</span>
            <span class="status completed">Completed</span>
        </div>

        <div class="activity-item">
            <span>Project: Mobile App Development</span>
            <span class="status pending">Pending</span>
        </div>

        <div class="activity-item">
            <span>Project: Marketing Campaign</span>
            <span class="status completed">Completed</span>
        </div>
    </div>
</div>

</body>
</html>