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

    <div class="title">Client</div>

    <div class="search">
        <i class="fa fa-search"></i>
        <input type="text" placeholder="Search users">
    </div>

    <div class="filter">
        <button>Filter ▼</button>
    </div>

    <div class="table">
        <div class="row" style="opacity:0.8; font-size:14px; border-bottom: 1px solid rgba(255,255,255,0.1); padding-bottom: 10px; margin-bottom: 10px;">
            <div>Name</div>
            <div>Applied Role</div>
            <div>Email</div>
            <div>Status</div>
        </div>

        <%-- Replace your manual Java loop with JSTL --%>
        <c:forEach var="client" items="${clients}">
            <div class="row">
                <div class="user">
                    <div style="width:35px; height:35px;">
                        <c:choose>
                            <c:when test="${not empty client.student.firstName}">
                                ${client.student.firstName.substring(0,1)}
                            </c:when>
                            <c:otherwise>?</c:otherwise>
                        </c:choose>
                    </div>
                    <span>${client.student.firstName} ${client.student.lastName}</span>
                </div>

                <div>${client.job.jobtitle}</div>

                <div style="font-size: 13px; opacity: 0.8;">${client.student.email}</div>

                <div class="status green">
                    Shortlisted
                </div>
            </div>
        </c:forEach>

        <%-- Handle empty list --%>
        <c:if test="${empty clients}">
            <div style="text-align:center; padding: 40px; opacity:0.6;">
                No shortlisted candidates yet.
            </div>
        </c:if>
    </div>



</div>
<jsp:include page="footer.jsp" />
</body>
</html>