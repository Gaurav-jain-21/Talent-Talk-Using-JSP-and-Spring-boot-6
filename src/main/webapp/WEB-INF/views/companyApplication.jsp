<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Job Applications</title>

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

h1 {
    margin: 10px 0 5px;
}

.subtitle {
    color: #0d2d2f;
    margin-bottom: 20px;
}

/* Tabs */
.tabs {
    display: flex;
    gap: 30px;
    border-bottom: 1px solid rgba(255,255,255,0.4);
    padding-bottom: 10px;
    margin-bottom: 25px;
    font-size: 14px;
}

/* Cards Grid */
.grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 25px;
}

.card {
    background: #e6e6e6;
    border-radius: 18px;
    padding: 18px;
}

.profile {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.avatar {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    background: #bbb;
}

.score {
    border: 3px solid #2d6cff;
    border-radius: 50%;
    width: 55px;
    height: 55px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
    color: #2d6cff;
}

.name {
    font-weight: bold;
    margin-top: 10px;
}

.role {
    color: #2d6cff;
    font-size: 14px;
    margin-bottom: 10px;
}

.tags {
    display: flex;
    gap: 6px;
    margin-bottom: 12px;
}

.tag {
    background: #d1c4e9;
    padding: 4px 10px;
    border-radius: 10px;
    font-size: 12px;
}

.actions {
    display: flex;
    gap: 10px;
}

.btn {
    flex: 1;
    border: none;
    border-radius: 14px;
    padding: 8px;
    cursor: pointer;
}

.view { background: #d9d9ff; }
.shortlist { background: #2d6cff; color: #fff; }

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
List<Map<String, Object>> candidates = new ArrayList<>();

for (int i = 95; i >= 90; i--) {
    Map<String, Object> c = new HashMap<>();
    c.put("name", "Jackson Reed");
    c.put("role", "Mobile App Developer");
    c.put("score", i);
    c.put("skills", Arrays.asList("Figma", "UI/UX", "Mobile App"));
    candidates.add(c);
}
%>

<div style="display:flex; justify-content:space-between; align-items:center;">
    <div>
        <div style="font-size:12px;">OPEN POSITION: SENIOR PRODUCT DESIGNER</div>
        <h1>Job Applications</h1>
        <div class="subtitle">Reviewing 24 top-tier candidates curated for your team</div>
    </div>
    <input type="text" placeholder="Search for job title, keywords..." style="padding:10px; border-radius:10px; border:none; width:260px;">
</div>

<div class="tabs">
    <div>All Applications (24)</div>
    <div>Shortlisted (8)</div>
    <div>Interviewing (3)</div>
    <div>Rejected</div>
</div>

<div class="grid">

<%
for (Map<String, Object> c : candidates) {
%>

    <div class="card">
        <div class="profile">
            <div class="avatar"></div>
            <div class="score"><%= c.get("score") %>%</div>
        </div>

        <div class="name"><%= c.get("name") %></div>
        <div class="role"><%= c.get("role") %></div>

        <div class="tags">
        <%
            List<String> skills = (List<String>) c.get("skills");
            for (String s : skills) {
        %>
            <div class="tag"><%= s %></div>
        <% } %>
        </div>

        <div class="actions">
            <button class="btn view">View Profile</button>
            <button class="btn shortlist">Shortlist</button>
        </div>
    </div>

<% } %>

</div>

</div>

</body>
</html>