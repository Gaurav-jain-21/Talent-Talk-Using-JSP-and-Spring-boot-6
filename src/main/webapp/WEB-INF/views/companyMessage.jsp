<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Messages</title>

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

.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 25px;
}

.search {
    padding: 10px 14px;
    border-radius: 12px;
    border: none;
    width: 260px;
}

/* Message Card */
.message {
    background: #e6e6e6;
    border-radius: 25px;
    padding: 15px 20px;
    margin-bottom: 18px;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.left {
    display: flex;
    align-items: center;
    gap: 15px;
}

.avatar {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    background: #bbb;
}

.name {
    font-weight: bold;
    font-size: 18px;
}

.time {
    font-size: 13px;
    color: #333;
}

.subject {
    flex: 1;
    text-align: center;
    font-size: 15px;
}

.actions {
    display: flex;
    gap: 18px;
    font-size: 18px;
    cursor: pointer;
}

.delete { color: red; }
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
List<Map<String, String>> messages = new ArrayList<>();

String[][] data = {
    {"Jackson Reed", "2 mins ago", "Mobile application Project Requirement"},
    {"Jackson Reed", "2 hours ago", "UI/UX Designer Project Requirement"},
    {"Jackson Reed", "3 hours ago", ".net C# Project Requirement"},
    {"Jackson Reed", "1 days ago", "Project design requirement"}
};

for (String[] d : data) {
    Map<String, String> m = new HashMap<>();
    m.put("name", d[0]);
    m.put("time", d[1]);
    m.put("subject", d[2]);
    messages.add(m);
}
%>

<div class="header">
    <h1>Messages</h1>
    <input class="search" type="text" placeholder="Search">
</div>

<%
for (Map<String, String> m : messages) {
%>

<div class="message">
    <div class="left">
        <div class="avatar"></div>
        <div>
            <div class="name"><%= m.get("name") %></div>
            <div class="time"><%= m.get("time") %></div>
        </div>
    </div>

    <div class="subject"><%= m.get("subject") %></div>

    <div class="actions">
        <span>👁️</span>
        <span>✏️</span>
        <span class="delete">🗑️</span>
    </div>
</div>

<% } %>

</div>

</body>
</html>