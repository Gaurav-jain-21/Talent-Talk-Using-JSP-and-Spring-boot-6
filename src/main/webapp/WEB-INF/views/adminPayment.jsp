<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Payment</title>

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
/* ===== YOUR ORIGINAL CSS (UNCHANGED) ===== */
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

/* ===== NEW CSS (ADDED ONLY) ===== */

.search-box {
    background: #eceaf3;
    border-radius: 12px;
    padding: 12px 16px;
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 16px;
}

.search-box input {
    border: none;
    outline: none;
    background: transparent;
    width: 100%;
}

.date-filter {
    background: #eceaf3;
    border: none;
    padding: 8px 14px;
    border-radius: 10px;
    margin-bottom: 20px;
    cursor: pointer;
}

.stats {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 20px;
    margin-bottom: 20px;
}

.stat-card {
    background: #eceaf3;
    padding: 20px;
    border-radius: 14px;
}

.stat-title {
    color: #666;
    margin-bottom: 6px;
}

.stat-value {
    font-size: 24px;
    font-weight: 700;
}

.table-container {
    background: #fff;
    border-radius: 14px;
    overflow: hidden;
    border: 1px solid #eee;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    padding: 14px 16px;
    text-align: left;
}

th {
    background: #fafafa;
    color: #777;
    font-weight: 600;
    font-size: 14px;
}

tr:not(:last-child) td {
    border-bottom: 1px solid #f0f0f0;
}

.amount {
    color: #6c63ff;
    font-weight: 600;
}

.status {
    padding: 6px 14px;
    border-radius: 999px;
    font-size: 13px;
    display: inline-block;
    background: #eee;
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
        <a href="adminInsights"><i class="fa-solid fa-chart-pie"></i> Insights</a>
        <a href="adminPayment" class="active"><i class="fa-solid fa-credit-card"></i> Payments</a>
        <a href="adminSettings"><i class="fa-solid fa-gear"></i> Settings</a>
    </div>
</div>

<!-- Main Content -->
<div class="main">
    <div class="header">Payment Management</div>

    <!-- Search -->
    <div class="search-box">
        <i class="fa fa-search"></i>
        <input type="text" placeholder="Search transactions">
    </div>

    <button class="date-filter">Date Range ▾</button>

    <!-- Stats -->
    <div class="stats">
        <div class="stat-card">
            <div class="stat-title">Total Revenue</div>
            <div class="stat-value">$1,250,000</div>
        </div>
        <div class="stat-card">
            <div class="stat-title">Pending Payouts</div>
            <div class="stat-value">$25,000</div>
        </div>
    </div>

    <%
    List<Map<String, String>> payments = Arrays.asList(
        Map.of("id","TXN12345","client","Ava Harper","freelancer","Ethan Bennett","amount","$5,000","date","2023-08-15","status","Completed"),
        Map.of("id","TXN67890","client","Liam Carter","freelancer","Olivia Hayes","amount","$2,500","date","2023-08-16","status","Pending"),
        Map.of("id","TXN11223","client","Sophia Clark","freelancer","Noah Foster","amount","$7,500","date","2023-08-17","status","Completed"),
        Map.of("id","TXN33445","client","Jackson Reed","freelancer","Isabella Wright","amount","$1,000","date","2023-08-18","status","Refunded"),
        Map.of("id","TXN55667","client","Chloe Evans","freelancer","Lucas Morgan","amount","$3,000","date","2023-08-19","status","Completed"),
        Map.of("id","TXN77889","client","Aiden Cooper","freelancer","Mia Turner","amount","$4,500","date","2023-08-20","status","Pending")
    );
    %>

    <!-- Table -->
    <div class="table-container">
        <table>
            <tr>
                <th>Transaction ID</th>
                <th>Client</th>
                <th>Freelancer</th>
                <th>Amount</th>
                <th>Date</th>
                <th>Status</th>
            </tr>

            <% for(Map<String,String> p : payments){ %>
            <tr>
                <td><%= p.get("id") %></td>
                <td><%= p.get("client") %></td>
                <td><%= p.get("freelancer") %></td>
                <td class="amount"><%= p.get("amount") %></td>
                <td><%= p.get("date") %></td>
                <td><span class="status"><%= p.get("status") %></span></td>
            </tr>
            <% } %>

        </table>
    </div>

</div>
</body>
</html>