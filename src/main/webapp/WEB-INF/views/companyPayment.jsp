<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Management</title>

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

/* MAIN CENTER LAYOUT */
.main {
    padding: 40px 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
}

/* Search */
.search {
    width: 50%;
    padding: 12px;
    border-radius: 12px;
    border: none;
    margin: 20px 0;
}

/* Summary cards */
.summary {
    display: flex;
    justify-content: center;
    gap: 30px;
    margin: 30px 0;
    flex-wrap: wrap;
}

.card {
    background: #e6e6e6;
    padding: 25px;
    border-radius: 15px;
    width: 280px;
}

.card h3 {
    margin: 0 0 10px;
    font-weight: normal;
}

.card p {
    font-size: 22px;
    font-weight: bold;
    margin: 0;
}

/* Center Table */
.table-wrapper {
    display: flex;
    justify-content: center;
    width: 100%;
    margin-top: 40px;
}

table {
    width: 70%;
    border-collapse: collapse;
    background: #ffffff;
    border-radius: 12px;
    overflow: hidden;
}

th, td {
    padding: 14px;
    text-align: left;
}

th {
    background: #f2f2f2;
}

tr:nth-child(even) {
    background: #fafafa;
}

.status {
    padding: 6px 12px;
    border-radius: 12px;
    font-size: 13px;
    display: inline-block;
}

.completed { background: #9be3b1; }
.pending { background: #f4e6a2; }
.refunded { background: #f5a3b7; }
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
        <a href="${pageContext.request.contextPath}/companySettings">Settings</a>
    </div>
</div>

<div class="main">

<h1>Payment Management</h1>
<input class="search" type="text" placeholder="Search payments...">

<div class="summary">
    <div class="card">
        <h3>Total Payment</h3>
        <p>$1,250,000</p>
    </div>
    <div class="card">
        <h3>Pending Payment</h3>
        <p>$25,000</p>
    </div>
</div>

<%
List<Map<String, String>> payments = new ArrayList<>();

String[][] data = {
    {"TXN12345", "Ava Harper", "Data Science", "$5,000", "2023-08-15", "Completed"},
    {"TXN67890", "Liam Carter", "UI/UX", "$2,500", "2023-08-16", "Pending"},
    {"TXN11223", "Sophia Clark", "Mobile Application", "$7,500", "2023-08-17", "Completed"},
    {"TXN33445", "Jackson Reed", "Bloggers", "$1,000", "2023-08-18", "Refunded"}
};

for (String[] d : data) {
    Map<String, String> p = new HashMap<>();
    p.put("id", d[0]);
    p.put("client", d[1]);
    p.put("role", d[2]);
    p.put("amount", d[3]);
    p.put("date", d[4]);
    p.put("status", d[5]);
    payments.add(p);
}
%>

<div class="table-wrapper">
<table>
    <tr>
        <th>Transaction ID</th>
        <th>Client</th>
        <th>Role</th>
        <th>Amount</th>
        <th>Date</th>
        <th>Status</th>
    </tr>

<%
for (Map<String, String> p : payments) {
    String statusClass = p.get("status").toLowerCase();
%>
    <tr>
        <td><%= p.get("id") %></td>
        <td><%= p.get("client") %></td>
        <td><%= p.get("role") %></td>
        <td><%= p.get("amount") %></td>
        <td><%= p.get("date") %></td>
        <td><span class="status <%= statusClass %>"><%= p.get("status") %></span></td>
    </tr>
<% } %>

</table>
</div>

</div>

</body>
</html>
