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

        <div class="title">Lead UX Designer for AI-Powered Analytics Dashboard</div>
        <div class="subtitle">
            Posted 2 hours ago · Remote, Global · <span class="featured">FEATURED</span>
        </div>

        <div class="section">
            <h3>Project Description</h3>
            <p>
                We are seeking a high-caliber Lead UX Designer to spearhead the evolution
                of our flagship AI-driven analytics platform. The platform serves Fortune
                500 enterprises, transforming complex data streams into intuitive,
                actionable insights.
            </p>
        </div>

        <div class="section">
            <h3>Key Responsibilities:</h3>
            <ul>
                <li>Architect end-to-end user journeys for predictive analytics modules.</li>
                <li>Design and scale a comprehensive Design System.</li>
                <li>Translate business goals into high-fidelity prototypes.</li>
                <li>Conduct usability testing with enterprise-level users.</li>
            </ul>
        </div>

        <div class="section">
            <h3>Required Skills</h3>
            <div class="skills">
                <span>User Research</span>
                <span>Prototyping</span>
                <span>Figma Mastery</span>
                <span>Data Visualization</span>
                <span>UX Architecture</span>
            </div>
        </div>

        <div class="section">
            <h3>Project Assets</h3>
            <div class="assets">
                <div class="asset">📄 Project_Scope.pdf (2.4 MB)</div>
                <div class="asset">🖼 Current_Workflow.jpg (1.8 MB)</div>
            </div>
        </div>

    </div>

    <!-- Right -->
    <div>

        <div class="budget">
            <h3>Estimated Budget</h3>
            <div class="amount">$12,000 – $18,000</div>
            <div class="small">Fixed-price · Intermediate-Expert Level</div>
        </div>

        <div class="info">
            <div><strong>Project Duration:</strong> 3–6 Months</div>
            <div><strong>Weekly Commitment:</strong> 30+ Hours</div>

            <form action="applyJob" method="post">
                <button class="apply">Apply Now</button>
            </form>

            <button class="save">Save Job</button>
        </div>

    </div>

</div>

</body>
</html>
