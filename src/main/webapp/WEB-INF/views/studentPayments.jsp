<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payout Portal</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

/* ===== Navbar ===== */
.navbar{
    width:100%;
    background:#1f7f82;
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:12px 30px;
    position:fixed;
    top:0;
    left:0;
}

.nav-left{
    display:flex;
    align-items:center;
    gap:10px;
    color:white;
    font-weight:600;
}

.nav-left img{
    width:36px;
    height:36px;
    border-radius:50%;
}

.nav-links a{
    margin-left:22px;
    text-decoration:none;
    color:white;
    font-size:14px;
}

/* ===== Body ===== */
body{
    background:#1f7f82;

    padding-top:90px;   /* navbar space only */
    margin:0;

    min-height:100vh;
    display:flex;
    flex-direction:column;
}

.container{
    max-width:1100px;
    margin:auto;
    width:100%;
    flex:1;
}

/* ===== Header ===== */
.header h1{
    margin-bottom:6px;
}

.header p{
    color:#d9e6e6;
    margin-bottom:20px;
}

/* ===== Cards ===== */
.stats{
    display:grid;
    grid-template-columns:repeat(3,1fr);
    gap:18px;
    margin-bottom:20px;
}

.card{
    padding:20px;
    border-radius:14px;
    color:black;
    font-weight:600;
}

.card small{
    display:block;
    margin-bottom:10px;
    opacity:.7;
}

.available{ background:#63b6cc; }
.processing{ background:#4a8ed1; }
.lifetime{ background:#d88a2f; }

.paid{ background:#8fda9b; }

/* ===== Grid Layout ===== */
.grid{
    display:grid;
    grid-template-columns:2fr 1fr;
    gap:18px;
}

/* ===== Panels ===== */
.panel{
    background:#e6e6e6;
    border-radius:14px;
    padding:18px;
}

/* Chart placeholder */
.chart{
    height:220px;
    background:linear-gradient(to top, #dcd3f5, #ffffff);
    border-radius:10px;
    margin-top:15px;
}

/* Withdraw panel */
.withdraw input,
.withdraw select{
    width:100%;
    padding:10px;
    margin:8px 0;
    border-radius:8px;
    border:none;
}

.method{
    background:#f3f3f3;
    padding:10px;
    border-radius:10px;
    margin-top:10px;
}

.withdraw-btn{
    width:100%;
    margin-top:15px;
    padding:12px;
    border:none;
    border-radius:10px;
    background:#5a57d6;
    color:white;
    font-size:16px;
    cursor:pointer;
}

/* Recent payouts */
.payout{
    display:flex;
    justify-content:space-between;
    margin-top:12px;
}

.payments-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 14px;
    background: #f7f7f7;
    border-radius: 10px;
    overflow: hidden;
}

.payments-table th,
.payments-table td {
    text-align: left;
    padding: 10px 12px;
    border-bottom: 1px solid #d9d9d9;
    font-size: 14px;
}

.payments-table th {
    background: #dce7e7;
}

.status-pill {
    display: inline-block;
    border-radius: 999px;
    padding: 4px 10px;
    font-size: 12px;
    font-weight: 600;
}

.status-paid {
    background: #b8efc2;
    color: #145523;
}

.status-pending {
    background: #ffe8a3;
    color: #7a5a00;
}

/* Add account */
.add-account{
    margin-top:18px;
    background:#e6e6e6;
    padding:14px;
    border-radius:12px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.add-account button{
    background:#4a8ed1;
    border:none;
    color:white;
    padding:6px 14px;
    border-radius:8px;
    cursor:pointer;
}

.footer{
    width:100%;
    background:#0f5e61;
    color:white;

    padding:22px 0;
    margin-top:auto;

    position:relative;
}
</style>
</head>

<body>

<!-- ===== Navbar ===== -->
<div class="navbar">
    <div class="nav-left">
        <img src="https://i.pravatar.cc/40">
        <span>Student</span>
    </div>

    <div class="nav-links">
        <a href="studentDashboard">Dashboard</a>
        <a href="studentProject">Projects</a>
        <a href="studentJobs">Work and Job</a>
        <a href="studentMessage">Message</a>
        <a href="studentPayments">Payments</a>
        <a href="studentSettings">Settings</a>
    </div>
</div>

<!-- ===== Main ===== -->
<div class="container">

    <div class="header">
        <h1>Payout Portal</h1>
        <p>Monitor your revenue and manage instant withdrawals.</p>
    </div>

    <!-- Stats -->
    <div class="stats">
        <div class="card available">
            <small>COMPLETED</small>
            Projects Completed<br>
            <h2>${completedProjects}</h2>
        </div>

        <div class="card paid">
            <small>RECEIVED</small>
            Total Amount Received<br>
            <h2>$${totalReceived}</h2>
        </div>

        <div class="card lifetime">
            <small>ENTRIES</small>
            Completed Payment Records<br>
            <h2>${completedPayments.size()}</h2>
        </div>
    </div>

    <!-- Grid -->
    <div class="grid">

        <!-- Left -->
        <div>
            <div class="panel">
                <h3>Completed Project Payments</h3>
                <table class="payments-table">
                    <tr>
                        <th>Company Name</th>
                        <th>Job Role</th>
                        <th>Amount</th>
                        <th>Payment Status</th>
                    </tr>
                    <c:forEach var="payment" items="${completedPayments}">
                        <tr>
                            <td>${payment.job.company.name}</td>
                            <td>${payment.job.jobtitle}</td>
                            <td>$${payment.job.payment}</td>
                            <td>
                                <span class="status-pill ${payment.paymentStatus == 'Paid' ? 'status-paid' : 'status-pending'}">
                                    ${empty payment.paymentStatus ? 'Pending' : payment.paymentStatus}
                                </span>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty completedPayments}">
                        <tr>
                            <td colspan="4">No completed project payments found yet.</td>
                        </tr>
                    </c:if>
                </table>
            </div>

            <div class="panel" style="margin-top:18px;">
                <h3>Summary</h3>
                <div class="payout">
                    <span>Total Completed Projects</span>
                    <strong>${completedProjects}</strong>
                </div>
                <div class="payout">
                    <span>Total Amount Received</span>
                    <strong>$${totalReceived}</strong>
                </div>
            </div>
        </div>

        <!-- Right -->
        <div>
            <div class="panel withdraw">
                <h3>Payment Notes</h3>
                <div class="method">Only completed projects are shown here.</div>
                <div class="method">Status turns to <strong>Paid</strong> after company payment.</div>
                <div class="method">Amount is based on each job payment value.</div>
            </div>

            <div class="add-account">
                <span>Keep your profile updated for smooth payouts.</span>
                <a href="studentProfile" style="text-decoration:none;">
                    <button type="button">Profile</button>
                </a>
            </div>
        </div>

    </div>
</div>
<br/>
<jsp:include page="footer.jsp" />

</body>
</html>
