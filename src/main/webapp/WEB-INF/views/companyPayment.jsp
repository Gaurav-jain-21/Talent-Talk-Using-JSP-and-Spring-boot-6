<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

.flash {
    width: 70%;
    margin: 10px auto;
    padding: 10px 14px;
    border-radius: 10px;
    font-size: 14px;
}

.flash-success {
    background: #d8f3dc;
    color: #14532d;
}

.flash-error {
    background: #ffe2e2;
    color: #7f1d1d;
}
</style>
</head>

<body>

<!-- Navbar -->
<div class="navbar">
    <i class="fa fa-user"></i>
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

<c:if test="${not empty successMsg}">
    <div class="flash flash-success">${successMsg}</div>
</c:if>

<c:if test="${not empty errorMsg}">
    <div class="flash flash-error">${errorMsg}</div>
</c:if>

<h1>Payment Management</h1>
<input class="search" type="text" placeholder="Search completed work payments...">

<div class="summary">
    <div class="card">
        <h3>Completed Work Items</h3>
        <p>${completedPayments.size()}</p>
    </div>
</div>

<div class="table-wrapper">
<table>
    <tr>
        <th>Student Name</th>
        <th>Role</th>
        <th>Amount</th>
        <th>Payment Status</th>
        <th>Make Payment</th>
    </tr>

    <c:forEach var="payment" items="${completedPayments}">
        <tr>
            <td>${payment.student.firstName} ${payment.student.lastName}</td>
            <td>${payment.job.jobtitle}</td>
            <td>$${payment.job.payment}</td>
            <td>
                <span class="status ${payment.paymentStatus == 'Paid' ? 'completed' : 'pending'}">
                    ${empty payment.paymentStatus ? 'Pending' : payment.paymentStatus}
                </span>
            </td>
            <td>
                <c:choose>
                    <c:when test="${payment.paymentStatus == 'Paid'}">
                        <span class="status completed">Paid</span>
                    </c:when>
                    <c:otherwise>
                        <form action="companyPayment/pay" method="post" style="margin:0;">
                            <input type="hidden" name="appId" value="${payment.id}">
                            <button type="submit" style="padding:8px 12px; border:none; border-radius:8px; background:#1b6f75; color:white; cursor:pointer;">
                                Make Payment
                            </button>
                        </form>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>

    <c:if test="${empty completedPayments}">
        <tr>
            <td colspan="5" style="text-align:center;">No completed student work found for payment.</td>
        </tr>
    </c:if>

</table>
</div>

</div>
<jsp:include page="footer.jsp" />
</body>
</html>
