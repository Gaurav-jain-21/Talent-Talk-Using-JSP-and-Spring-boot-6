<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Company</title>
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

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
    position: relative;
}

.header {
    font-size: 24px;
    font-weight: 600;
    margin-bottom: 25px;
}

/* ===== Company Grid ===== */
.company-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
    gap: 30px;
    padding-bottom: 80px;
}

/* ===== Company Card ===== */
.company-card {
    max-width: 220px;
}

/* Logo box */
.logo-box {
    width: 100%;
    height: 150px;
    border-radius: 16px;
    overflow: hidden;
    margin-bottom: 12px;
    position: relative;
    background: #eee;
}

/* Checkbox on top-right */
.logo-box input[type="checkbox"] {
    position: absolute;
    top: 10px;
    right: 10px;
    width: 18px;
    height: 18px;
    cursor: pointer;
}

/* Logo image */
.logo-box img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

/* Company text */
.company-name {
    font-weight: 600;
    margin-bottom: 4px;
    color: #222;
}

.company-category {
    color: #6c63ff;
    font-size: 14px;
    margin-bottom: 6px;
}

.company-desc {
    color: #7a7a9a;
    font-size: 13px;
    line-height: 1.4;
}

/* ===== Bottom Action Bar ===== */
.action-bar {
    position: fixed;
    bottom: 0;
    left: 240px;
    right: 0;
    background: #ffffff;
    border-top: 1px solid #e6e6e6;
    padding: 15px 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.reject-btn {
    background: transparent;
    border: none;
    font-weight: 600;
    cursor: pointer;
}

.approve-btn {
    background: #4f2cff;
    color: #fff;
    border: none;
    padding: 10px 24px;
    border-radius: 12px;
    cursor: pointer;
    font-weight: 600;
}

.approve-btn:hover {
    opacity: 0.9;
}

.container {
    background: #fff;
    border-radius: 12px;
    padding: 20px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.05);
}

.comp-table {
    width: 100%;
    border-collapse: collapse;
}

.comp-table thead th {
    text-align: left;
    color: #6b7280;
    font-size: 13px;
    padding: 12px 14px;
    border-bottom: 1px solid #ececec;
}

.comp-table td {
    padding: 14px;
    border-bottom: 1px solid #f2f2f2;
    color: #111827;
}

.working-badge {
    display: inline-block;
    background: #eef2ff;
    color: #5a54ff;
    border-radius: 999px;
    padding: 5px 10px;
    font-size: 12px;
    font-weight: 600;
}

.btn-remove {
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

.btn-remove:hover {
    background: #ffe6e6;
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
        <a href="adminCompany" class="active"><i class="fa-solid fa-building"></i> Company Verification</a>
        <a href="adminInsights"><i class="fa-solid fa-chart-pie"></i> Insights</a>
        <a href="adminPayment"><i class="fa-solid fa-credit-card"></i> Payments</a>
        <a href="adminSettings"><i class="fa-solid fa-gear"></i> Settings</a>
    </div>
</div>

<!-- Main Content -->

    <div class="main">
        <div class="header">Company Management</div>

        <div class="container">
            <table class="comp-table">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Students Working</th>
                    <th>Remove Company</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="comp" items="${companies}">
                    <tr>
                        <td><c:out value="${comp.name}" /></td>
                        <td><c:out value="${comp.email}" /></td>
                        <td>
                            <span class="working-badge">
                                <i class="fa-solid fa-user-check"></i> ${hiredCounts[comp.id]}
                            </span>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/deleteAdminCompany?id=${comp.id}" class="btn-remove" onclick="return confirm('Deleting this company will remove all their job posts. Continue?')">
                                <i class="fa-solid fa-trash-can"></i> Remove Company
                            </a>
                        </td>
                    </tr>
                </c:forEach>

                <c:if test="${empty companies}">
                    <tr>
                        <td colspan="4" style="text-align: center; padding: 40px; color: #a0aec0;">
                            No companies found in database.
                        </td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>
    <jsp:include page="footer.jsp" />

</div>

</body>
</html>