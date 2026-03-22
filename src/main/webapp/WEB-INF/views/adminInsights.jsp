<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Insights</title>
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
/* ===== ORIGINAL CSS (UNCHANGED) ===== */
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

/* ===== NEW INSIGHTS CSS ===== */
.stats-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
    gap: 16px;
    margin-bottom: 25px;
}

.stat-card {
    background: #eceaf1;
    border-radius: 14px;
    padding: 18px;
}

.stat-title {
    font-size: 14px;
    color: #666;
}

.stat-value {
    font-size: 22px;
    font-weight: 700;
    margin: 6px 0;
}

.stat-change {
    font-size: 13px;
    color: #16a34a;
}

.growth-section {
    display: grid;
    grid-template-columns: 1.5fr 1fr;
    gap: 20px;
    margin-bottom: 30px;
}

.growth-chart {
    background: linear-gradient(135deg, #1aa6a6, #0f766e);
    border-radius: 16px;
    height: 200px;
    position: relative;
}

.growth-info h3 {
    font-size: 18px;
    margin-bottom: 8px;
}

.growth-info p {
    font-size: 14px;
    color: #666;
}

.section-title {
    font-size: 16px;
    margin: 20px 0 10px;
    font-weight: 600;
}

.bar-row {
    display: flex;
    align-items: flex-end;
    gap: 18px;
    height: 120px;
    margin-bottom: 10px;
}

.bar {
    width: 26px;
    background: #dcd9e6;
    border-radius: 6px 6px 0 0;
}

.labels {
    display: flex;
    gap: 14px;
    font-size: 12px;
    color: #666;
}
</style>
</head>

<body>

<!-- Sidebar -->
<div class="sidebar">
    <h2>Admin Panel</h2>
    <div class="menu">
        <a href="adminDashboard"><i class="fa-solid fa-chart-line"></i> Dashboard</a>
        <a href="adminUsers"><i class="fa-solid fa-users"></i> Users</a>
        <a href="adminJobs"><i class="fa-solid fa-briefcase"></i> Jobs</a>
        <a href="adminCompany"><i class="fa-solid fa-building"></i> Company Verification</a>
        <a href="adminInvoice"><i class="fa-solid fa-file-invoice"></i> Invoice</a>
        <a href="adminInsights" class="active"><i class="fa-solid fa-chart-pie"></i> Insights</a>
        <a href="adminPayment"><i class="fa-solid fa-credit-card"></i> Payments</a>
        <a href="adminSettings"><i class="fa-solid fa-gear"></i> Settings</a>
    </div>
</div>

<!-- Main Content -->
<div class="main">

    <div class="header">Admin Insights</div>

    <%
    List<Map<String, String>> stats = Arrays.asList(
        Map.of("title","Revenue","value","$2.5M","change","+10%"),
        Map.of("title","User Growth","value","+15%","change","+5%"),
        Map.of("title","Project Completion","value","92%","change","+2%"),
        Map.of("title","Active Bids","value","1200","change","+8%")
    );
    %>

    <div class="stats-grid">
        <% for(Map<String,String> s : stats){ %>
            <div class="stat-card">
                <div class="stat-title"><%= s.get("title") %></div>
                <div class="stat-value"><%= s.get("value") %></div>
                <div class="stat-change"><%= s.get("change") %></div>
            </div>
        <% } %>
    </div>

    <div class="growth-section">
        <div class="growth-chart"></div>
        <div class="growth-info">
            <h3>Platform Growth</h3>
            <p>Track the overall growth of the platform over time.</p>
        </div>
    </div>

    <div class="section-title">Monthly Payouts</div>

    <%
    List<Integer> payoutBars = Arrays.asList(100,110,105,115,120,118,122);
    List<String> months = Arrays.asList("Jan","Feb","Mar","Apr","May","Jun","Jul");
    %>

    <div class="bar-row">
        <% for(int h : payoutBars){ %>
            <div class="bar" style="height:<%= h %>px"></div>
        <% } %>
    </div>

    <div class="labels">
        <% for(String m : months){ %>
            <div style="width:26px;text-align:center;"><%= m %></div>
        <% } %>
    </div>

</div>

</body>
</html>