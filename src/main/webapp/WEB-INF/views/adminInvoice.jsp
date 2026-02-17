<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Invoice</title>
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

/* ===== NEW CSS FOR INVOICE GRID ===== */
.top-bar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 25px;
}

.create-btn {
    background: #e9e7ef;
    border: none;
    padding: 10px 16px;
    border-radius: 12px;
    cursor: pointer;
    font-size: 14px;
}

.invoice-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(160px, 1fr));
    gap: 20px;
}

.invoice-card {
    height: 140px;
    border-radius: 16px;
    background: linear-gradient(135deg, #0b1a2f, #123d6b);
    box-shadow: 0 8px 18px rgba(0,0,0,0.08);
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
        <a href="adminInvoice" class="active"><i class="fa-solid fa-file-invoice"></i> Invoice</a>
        <a href="adminInsights"><i class="fa-solid fa-chart-pie"></i> Insights</a>
        <a href="adminPayment"><i class="fa-solid fa-credit-card"></i> Payments</a>
        <a href="adminSettings"><i class="fa-solid fa-gear"></i> Settings</a>
    </div>
</div>

<!-- Main Content -->
<div class="main">

    <div class="top-bar">
        <div class="header">Invoices</div>
        <button class="create-btn">Create Invoice</button>
    </div>

    <%
    List<Map<String, String>> invoices = Arrays.asList(
        Map.of("id", "INV001"),
        Map.of("id", "INV002"),
        Map.of("id", "INV003"),
        Map.of("id", "INV004"),
        Map.of("id", "INV005"),
        Map.of("id", "INV006")
    );
    %>

    <div class="invoice-grid">
        <% for (Map<String, String> inv : invoices) { %>
            <div class="invoice-card"></div>
        <% } %>
    </div>

</div>

</body>
</html>