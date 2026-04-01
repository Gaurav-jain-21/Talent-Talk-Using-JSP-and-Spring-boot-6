<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Company Client</title>

<link rel="stylesheet"
 href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:"Segoe UI", sans-serif;
}

body{
    background:#1f7f86;
    color:white;
}

/* ===== NAVBAR ===== */
.nav{
    display:flex;
    align-items:center;
    justify-content:space-between;
    padding:12px 30px;
    border-bottom:1px solid rgba(255,255,255,0.2);
}

/* left profile */
.nav-left{
    display:flex;
    align-items:center;
    gap:12px;
}

.nav-left img{
    width:38px;
    height:38px;
    border-radius:50%;
}

/* right menu */
.nav-links{
    display:flex;
    align-items:center;
    gap:28px;
}

.nav-links a{
    color:white;
    text-decoration:none;
    font-size:14px;
    opacity:0.85;
    transition:0.2s;
}

.nav-links a:hover{
    opacity:1;
}

.nav-links a.active{
    font-weight:600;
    border-bottom:2px solid white;
    padding-bottom:4px;
}

/* ===== MAIN ===== */
.container{
    width:900px;
    margin:40px auto;
}

.title{
    font-size:28px;
    font-weight:700;
    margin-bottom:20px;
}

/* SEARCH */
.search{
    background:white;
    border-radius:10px;
    padding:10px 15px;
    display:flex;
    align-items:center;
    gap:10px;
    color:#777;
}

.search input{
    border:none;
    outline:none;
    width:100%;
}
.row {
    display: grid;
    grid-template-columns: 1.5fr 1.2fr 1fr 1.8fr; /* Adjusted for Progress Column */
    align-items: center;
    padding: 15px 0;
    border-bottom: 1px solid rgba(255,255,255,0.1);
}

/* Progress Tracker Styling */
.mini-progress {
    display: flex;
    align-items: center;
    gap: 8px;
}

.dot-container {
    display: flex;
    align-items: center;
    gap: 4px;
}

.dot {
    width: 10px;
    height: 10px;
    border-radius: 50%;
    background: rgba(255,255,255,0.2);
}

.dot.fill { background: #00ff88; box-shadow: 0 0 8px #00ff88; }

.status-text {
    font-size: 12px;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    font-weight: 600;
}

/* Avatar Circle */
.avatar-circle {
    width: 35px;
    height: 35px;
    background: #0f5e61;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
    border: 1px solid rgba(255,255,255,0.3);
}
/* FILTER */
.filter{
    margin:15px 0;
}

.filter button{
    background:#e0e0e0;
    border:none;
    padding:6px 12px;
    border-radius:8px;
}

/* TABLE */
.table{
    border:1px solid rgba(255,255,255,0.3);
    border-radius:10px;
    padding:20px;
}

.row{
    display:grid;
    grid-template-columns: 1.5fr 1.5fr 1fr 1fr;
    align-items:center;
    padding:12px 0;
}

.user{
    display:flex;
    align-items:center;
    gap:10px;
}

.user img{
    width:35px;
    height:35px;
    border-radius:50%;
}

.status{
    font-weight:600;
}

.green{ color:#00ff88; }
.yellow{ color:#ffe600; }
.red{ color:#ff2e2e; }
</style>
</head>

<body>

<!-- ===== NAVBAR ===== -->
<div class="nav">

    <!-- Left -->
    <div class="nav-left">
        <img src="https://i.pravatar.cc/40">
    </div>

    <!-- Right -->
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

<!-- ===== MAIN ===== -->
<div class="container">
    <div class="title">Active Talent Progress</div>

    <div class="search">
        <i class="fa fa-search"></i>
        <input type="text" placeholder="Search by student name or role...">
    </div>

    <div class="table" style="margin-top: 25px;">
        <div class="row" style="opacity:0.7; font-size:13px; font-weight: 600; text-transform: uppercase;">
            <div>Talent Name</div>
            <div>Assigned Role</div>
            <div>Contact</div>
            <div>Project Progress</div>
        </div>

        <c:forEach var="client" items="${clients}">
            <div class="row">
                <div class="user">
                    <div class="avatar-circle">
                            ${client.student.firstName.substring(0,1)}
                    </div>
                    <span>${client.student.firstName} ${client.student.lastName}</span>
                </div>

                <div style="font-size: 14px;">${client.job.jobtitle}</div>

                <div>
                    <a href="mailto:${client.student.email}" style="color: #00ff88; text-decoration: none; font-size: 13px;">
                        <i class="fa fa-envelope"></i> Message
                    </a>
                </div>

                <div class="mini-progress">
                    <div class="dot-container">
                        <div class="dot ${client.progressStep >= 1 ? 'fill' : ''}"></div>
                        <div class="dot ${client.progressStep >= 2 ? 'fill' : ''}"></div>
                        <div class="dot ${client.progressStep == 3 ? 'fill' : ''}"></div>
                    </div>

                    <span class="status-text ${client.progressStep == 3 ? 'green' : 'yellow'}">
                        <c:choose>
                            <c:when test="${client.progressStep == 1}">Started</c:when>
                            <c:when test="${client.progressStep == 2}">In Progress</c:when>
                            <c:when test="${client.progressStep == 3}">Completed</c:when>
                            <c:otherwise>Pending</c:otherwise>
                        </c:choose>
                    </span>
                </div>
            </div>
        </c:forEach>

        <c:if test="${empty clients}">
            <div style="text-align:center; padding: 60px; opacity:0.5;">
                <i class="fa fa-user-slash" style="font-size: 40px; margin-bottom: 10px;"></i>
                <p>No active talent found in your client list.</p>
            </div>
        </c:if>
    </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>