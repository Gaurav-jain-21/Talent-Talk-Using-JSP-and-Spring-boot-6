<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Submit Proposal</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

/* ===== Navbar ===== */
.navbar {
    width: 100%;
    background: #1f7f82;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 12px 30px;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 1000;
}

.nav-left {
    display: flex;
    align-items: center;
    gap: 10px;
    color: white;
    font-weight: 600;
}

.nav-left img {
    width: 36px;
    height: 36px;
    border-radius: 50%;
}

.nav-links a {
    margin-left: 22px;
    text-decoration: none;
    color: white;
    font-size: 14px;
    transition: 0.2s;
}

.nav-links a:hover {
    opacity: 0.8;
}

/* ===== Page Body ===== */
body {
    background: #1f7f82;
    padding-top: 90px;   /* space for navbar */
    
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

/* Container */
.wrapper {
    max-width: 900px;
    margin: auto;
    color: black;
    flex: 1;   /* pushes footer to bottom */
}

/* Header */
.header small {
    color: #c7c7ff;
    letter-spacing: 1px;
}

.header h1 {
    margin: 8px 0;
}

.header p {
    color: #dfe6ff;
}


.form-box h3 {
    margin-bottom: 15px;
}

/* Inputs */
textarea, input, select {
    width: 100%;
    padding: 12px;
    border-radius: 10px;
    border: none;
    margin-top: 8px;
}

textarea {
    height: 120px;
    resize: none;
}
/* New Styles for Progress & Shortlist */
.section-title {
    color: white;
    margin: 20px 0 15px 0;
    font-size: 22px;
    display: flex;
    align-items: center;
    gap: 10px;
}

.card {
    background: #e6e6e6;
    border-radius: 16px;
    padding: 20px;
    margin-bottom: 25px;
    color: #333;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
}

/* Shortlist Row */
.shortlist-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px;
    border-bottom: 1px solid #ccc;
}
.shortlist-item:last-child { border-bottom: none; }

.comp-info { display: flex; align-items: center; gap: 15px; }
.comp-logo {
    width: 45px; height: 45px; background: #1f7f82;
    color: white; border-radius: 8px; display: flex;
    align-items: center; justify-content: center; font-weight: bold;
}

.status-badge {
    padding: 5px 12px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 600;
    background: #b8e6c1; /* Greenish */
    color: #1b5e20;
}

/* Progress Tracker */
.progress-container {
    margin-top: 15px;
}
.step-wizard {
    display: flex;
    justify-content: space-between;
    position: relative;
    margin-bottom: 10px;
}
.step-wizard::before {
    content: "";
    position: absolute;
    top: 15px;
    left: 0;
    width: 100%;
    height: 3px;
    background: #ccc;
    z-index: 1;
}
.step {
    width: 30px;
    height: 30px;
    border-radius: 50%;
    background: #ccc;
    z-index: 2;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 12px;
}
.step.active { background: #1f7f82; }
.step.completed { background: #2d39d4; }

.step-label {
    display: flex;
    justify-content: space-between;
    font-size: 13px;
    color: #555;
}

.btn-action {
    background: #1f7f82;
    color: white;
    padding: 8px 15px;
    border-radius: 8px;
    text-decoration: none;
    font-size: 13px;
}
.footer p {
    margin: 5px 0;
    font-size: 14px;
}


</style>
</head>

<body>

<!-- ===== Navbar ===== -->
<div class="navbar">
    <div class="nav-left">
        <i class="fa fa-user"></i>
    </div>

    <div class="nav-links">
        <a href="studentDashboard">Dashboard</a>
        <a href="studentProject">Projects</a>
        <a href="studentJobs">Work and Jobs</a>
        <a href="studentMessage">Message</a>
        <a href="studentPayments">Payments</a>
        <a href="studentSettings">Settings</a>
    </div>
</div>
<div class="wrapper">
    <div class="section-title">
        <i class="fa-solid fa-suitcase"></i>
        My Shortlisted Jobs
    </div>

    <div class="card" style="padding: 0; overflow: hidden;">
        <table style="width: 100%; border-collapse: collapse; text-align: left; background: #e6e6e6;">
            <thead>
            <tr style="background: #cfdede; color: #333;">
                <th style="padding: 15px;">Company</th>
                <th style="padding: 15px;">Job Title</th>
                <th style="padding: 15px;">Status</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="app" items="${shortlistedJobs}">
                <tr style="border-bottom: 1px solid #ccc;">
                    <td style="padding: 15px;"><strong>${app.job.company.name}</strong></td>
                    <td style="padding: 15px;">${app.job.jobtitle}</td>
                    <td style="padding: 15px;">
                        <span class="status-badge">${app.status}</span>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="section-title">
        <i class="fa-solid fa-list-check"></i>
        My Active Project Progress
    </div>

    <div class="card" style="padding: 0; overflow: hidden;">
        <table style="width: 100%; border-collapse: collapse; text-align: left; background: #e6e6e6;">
            <thead>
            <tr style="background: #cfdede; color: #333;">
                <th style="padding: 15px;">Company</th>
                <th style="padding: 15px;">Job Title</th>
                <th style="padding: 15px;">Contact Client</th>
                <th style="padding: 15px;">Current Status</th>
                <th style="padding: 15px;">Update Progress</th>
                <th style="padding: 15px; text-align: center;">Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="app" items="${activeProjects}">
                <tr style="border-bottom: 1px solid #ccc;">
                    <td style="padding: 15px;">
                        <strong>${app.job.company.name}</strong>
                    </td>
                    <td style="padding: 15px;">${app.job.jobtitle}</td>
                    <td style="padding: 15px;">
                        <a href="mailto:${app.job.company.email}" style="color: #1f7f82; text-decoration: none;">
                            <i class="fa fa-envelope"></i> Email
                        </a>
                    </td>
                    <td style="padding: 15px;">
                            <span class="status-badge" style="
                                    background: ${app.progressStep == 3 ? '#b8e6c1' : (app.progressStep == 2 ? '#fff9c4' : '#dcd0f5')};
                                    color: ${app.progressStep == 3 ? '#1b5e20' : (app.progressStep == 2 ? '#f57f17' : '#512da8')};">
                                <c:choose>
                                    <c:when test="${app.progressStep == 1}">Started</c:when>
                                    <c:when test="${app.progressStep == 2}">In Progress</c:when>
                                    <c:when test="${app.progressStep == 3}">Completed</c:when>
                                </c:choose>
                            </span>
                    </td>
                    <td style="padding: 15px;">
                        <form action="updateProjectStatus" method="post" id="form-${app.id}">
                            <input type="hidden" name="applicationId" value="${app.id}">
                            <select name="newStep" style="padding: 5px; border-radius: 5px; border: 1px solid #bbb;">
                                <option value="1" ${app.progressStep == 1 ? 'selected' : ''}>Started</option>
                                <option value="2" ${app.progressStep == 2 ? 'selected' : ''}>In Progress</option>
                                <option value="3" ${app.progressStep == 3 ? 'selected' : ''}>Completed</option>
                            </select>
                        </form>
                    </td>
                    <td style="padding: 15px; text-align: center;">
                        <button type="submit" form="form-${app.id}" class="btn-action" style="border: none; cursor: pointer;">
                            <i class="fa fa-save"></i> Save
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <c:if test="${empty activeProjects}">
            <div style="text-align:center; padding: 35px; color:#777; background:#e6e6e6;">
                No shortlisted work has been assigned yet.
            </div>
        </c:if>
    </div>
</div>
<jsp:include page="footer.jsp" />

</body>
</html>
