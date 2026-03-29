<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Job Details</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body{
    background:#1f7f82;
    padding:30px;
}

/* ===== Navbar ===== */
.navbar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:25px;
    color:white;
}

.navbar img{
    width:40px;
    border-radius:50%;
}

.navbar a{
    color:white;
    text-decoration:none;
    margin-left:20px;
    font-size:14px;
}

/* ===== Layout ===== */
.container{
    display:grid;
    grid-template-columns: 2fr 1fr;
    gap:25px;
}

/* ===== Job Card ===== */
.card{
    background:white;
    border-radius:14px;
    padding:25px;
}

.title{
    font-size:22px;
    font-weight:600;
}

.subtitle{
    color:#666;
    margin:6px 0 15px;
    font-size:14px;
}

.featured{
    color:#4b39d4;
    font-weight:600;
}

/* ===== Section ===== */
.section h3{
    margin:15px 0 10px;
}

.section p, .section li{
    font-size:14px;
    color:#444;
    line-height:1.6;
}

.section ul{
    margin-left:18px;
}

/* ===== Skills ===== */
.skills span{
    display:inline-block;
    background:#efe7ff;
    color:#4b39d4;
    padding:6px 12px;
    border-radius:12px;
    font-size:12px;
    margin:5px 6px 0 0;
}

/* ===== Assets ===== */
.assets{
    display:flex;
    gap:15px;
    margin-top:10px;
}

.asset{
    background:#f1f1f1;
    padding:10px 15px;
    border-radius:10px;
    font-size:13px;
}

/* ===== Budget Box ===== */
.budget{
    background:#0f0f0f;
    color:white;
    border-radius:14px;
    padding:20px;
}

.budget h3{
    margin-bottom:10px;
}

.amount{
    font-size:22px;
    font-weight:600;
}

.small{
    font-size:13px;
    color:#ccc;
    margin-top:5px;
}

.info{
    background:white;
    color:black;
    border-radius:10px;
    padding:15px;
    margin-top:15px;
    font-size:14px;
}

.info div{
    margin-bottom:8px;
}

/* ===== Buttons ===== */
.apply{
    width:100%;
    background:#6a74f5;
    color:white;
    border:none;
    padding:12px;
    border-radius:10px;
    font-size:16px;
    margin-top:15px;
    cursor:pointer;
}

.save{
    width:100%;
    background:#a5e7b0;
    border:none;
    padding:10px;
    border-radius:10px;
    margin-top:10px;
    cursor:pointer;
}
</style>
</head>

<body>

<!-- ===== Navbar ===== -->
<div class="navbar">
    <img src="https://i.pravatar.cc/40">
    <div>
        <a href="studentDashboard">Dashboard</a>
        <a href="studentProject">Projects</a>
        <a href="studentJobs">Find Jobs</a>
        <a href="studentMessage">Message</a>
        <a href="studentPayments">Payments</a>
        <a href="studentSettings">Settings</a>
    </div>
</div>

<!-- ===== Content ===== -->
<div class="container">

    <!-- Left -->
    <div class="card">
        <div class="title">${job.jobtitle}</div>
        <div class="subtitle">
            Posted ${job.timeline} ·
            <span class="featured">${job.company.name}</span>
        </div>

        <div class="section">
            <h3>Project Description</h3>
            <p>${job.projectdescription}</p> </div>
    </div>

    <div>
        <div class="budget">
            <h3>Estimated Budget</h3>
            <div class="amount">${job.payment}</div>
            <div class="small">${job.projecttype} Level</div>
        </div>

        <div class="info">
<%--            <div><strong>Location:</strong> ${job.l}</div>--%>

            <form action="confirmApplication" method="post">
                <input type="hidden" name="jobId" value="${job.id}">
                <button type="submit" class="apply">Apply Job</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>
