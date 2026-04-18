<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Jobs</title>
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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

/* Job Cards */
.job-card {
    background: #ffffff;
    border-radius: 16px;
    padding: 18px 20px;
    margin-bottom: 18px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 4px 14px rgba(0,0,0,0.05);
    transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.job-card:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 20px rgba(0,0,0,0.08);
}

/* Text Section */
.status {
    font-size: 12px;
    color: #6c63ff;
    font-weight: 600;
    margin-bottom: 6px;
}

.title {
    font-size: 18px;
    font-weight: 600;
    margin-bottom: 8px;
    color: #222;
}

.description {
    font-size: 13px;
    color: #666;
    max-width: 520px;
    line-height: 1.5;
    margin-bottom: 12px;
}

/* Approve Button */
.approve-btn {
    background: #f0f1f7;
    border: none;
    padding: 8px 14px;
    border-radius: 8px;
    font-size: 13px;
    cursor: pointer;
    transition: all 0.2s ease;
}

.approve-btn:hover {
    background: #6c63ff;
    color: #fff;
}

/* Image */
.job-image img {
    width: 180px;
    height: 120px;
    object-fit: cover;
    border-radius: 14px;
}

.jobs-table {
    width: 100%;
    border-collapse: collapse;
    background: #fff;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 4px 14px rgba(0,0,0,0.05);
}

.jobs-table th,
.jobs-table td {
    text-align: left;
    padding: 14px;
    border-bottom: 1px solid #f0f0f0;
    vertical-align: top;
}

.jobs-table th {
    color: #6b7280;
    font-size: 13px;
    font-weight: 700;
    background: #fafbff;
}

.jobs-table td {
    font-size: 14px;
    color: #111827;
}

.job-description {
    color: #4b5563;
    max-width: 420px;
    line-height: 1.4;
}

.delete-btn {
    display: inline-block;
    text-decoration: none;
    color: #b42318;
    background: #fff1f1;
    border: 1px solid #ffd7d7;
    border-radius: 8px;
    padding: 6px 10px;
    font-size: 13px;
    font-weight: 600;
}

.delete-btn:hover {
    background: #ffe6e6;
}

/* Search Toolbar */
.search-toolbar {
    margin-bottom: 20px;
    display: flex;
    gap: 10px;
    flex-wrap: wrap;
}

.search-toolbar input {
    padding: 10px 14px;
    border: 1px solid #e6e6e6;
    border-radius: 8px;
    font-size: 14px;
    width: 300px;
    transition: border-color 0.2s ease;
}

.search-toolbar input:focus {
    outline: none;
    border-color: #6c63ff;
    box-shadow: 0 0 0 3px rgba(108, 99, 255, 0.1);
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
        <a href="adminJobs" class="active">
            <i class="fa-solid fa-briefcase"></i> Jobs
        </a>
        <a href="adminCompany"><i class="fa-solid fa-building"></i> Company Verification</a>
<%--        <a href="adminInsights"><i class="fa-solid fa-chart-pie"></i> Insights</a>--%>
        <a href="adminPayment"><i class="fa-solid fa-credit-card"></i> Payments</a>
        <a href="adminSettings"><i class="fa-solid fa-gear"></i> Settings</a>
    </div>
</div>

<!-- Main Content -->
<div class="main">
    <div class="header">Job Management</div>

    <div class="search-toolbar">
        <input type="text" id="jobSearch" placeholder="Search by job title or company name...">
    </div>

    <table class="jobs-table">
        <thead>
        <tr>
            <th>Title</th>
            <th>Company</th>
            <th>Description</th>
            <th>Applicants / Client</th>
            <th>Delete Job</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="job" items="${allJobs}">
            <tr class="job-row">
                <td class="job-title"><c:out value="${job.jobtitle}" /></td>
                <td class="job-company"><c:out value="${job.company.name}" /></td>
                <td class="job-description"><c:out value="${job.projectdescription}" /></td>
                <td>${fn:length(job.applications)}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/deleteAdminJob?id=${job.id}"
                       class="delete-btn"
                       onclick="return confirm('Delete this job post?')">
                        Delete
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <c:if test="${empty allJobs}">
        <div style="text-align: center; padding: 50px; color: #9ca3af;">
            <i class="fa-solid fa-folder-open" style="font-size: 40px; margin-bottom: 10px;"></i>
            <p>No jobs have been posted yet.</p>
        </div>
    </c:if>

    <br/>
    <jsp:include page="footer.jsp" />
</div>

<script>
$(document).ready(function() {
    $("#jobSearch").on("keyup", function() {
        var searchTerm = $(this).val().toLowerCase();
        $(".job-row").each(function() {
            var jobTitle = $(this).find(".job-title").text().toLowerCase();
            var jobCompany = $(this).find(".job-company").text().toLowerCase();
            
            if (jobTitle.includes(searchTerm) || jobCompany.includes(searchTerm)) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    });
});
</script>

</body>
</html>