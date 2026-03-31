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
.btn-danger {
    background-color: #d9534f; /* A standard red color */
    color: #ffffff;            /* White text */
    border: none;
    border-radius: 14px;       /* Matches your other buttons */
    padding: 8px;
    cursor: pointer;
    flex: 1;                   /* Allows it to sit evenly next to other buttons */
    font-size: 14px;
    transition: background 0.3s ease;
}

.btn-danger:hover {
    background-color: #c9302c; /* Darker red when hovering */
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
        <a href="companyDashboard">Dashboard</a>
        <a href="companyClient">Clients</a>
        <a href="companyJobs">Post Jobs</a>
        <a href="companyManageJobs">Manage Jobs</a>
        <a href="companyApplication">Application</a>
        <a href="companyMessage">Messages</a>
        <a href="companyPayment">Payments</a>
        <a href="companySettings">Settings</a>
    </div>
</div>

<div class="main">


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

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <p style="color: white;">Debug: Total candidates found: ${candidates.size()}</p>
    <div class="grid">
        <c:forEach var="app" items="${candidates}">
            <div class="card">
                <div class="profile">
                    <div class="avatar">
<%--                        <img src="${app.student.}" style="width:100%; border-radius:50%;">--%>
                    </div>
                    <div class="score">95%</div>
                </div>

                <div class="name">${app.student.firstName}</div>
                <div class="role">${app.job.jobtitle}</div>

                <div class="actions">
                    <a href="viewStudentProfile?id=${app.student.id}&appId=${app.id}" class="btn view">View Profile</a>

                    <form action="shortlist" method="post" style="flex:1;">
                        <input type="hidden" name="appId" value="${app.id}">
                        <button type="submit" class="btn shortlist">Shortlist</button>
                    </form>

                    <form action="reject" method="post" style="flex:1;">
                        <input type="hidden" name="appId" value="${app.id}">
                        <button type="submit" class="btn btn-danger"
                                onclick="return confirm('Are you sure you want to reject this applicant?')">
                            Reject
                        </button>
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>

</div>
<jsp:include page="footer.jsp" />

</body>
</html>