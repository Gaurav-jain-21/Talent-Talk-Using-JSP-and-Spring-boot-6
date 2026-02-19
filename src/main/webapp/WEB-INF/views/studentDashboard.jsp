<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Dashboard</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
    display: flex;
    background: #f4f6f8;
}

/* ===== Sidebar ===== */
.sidebar {
    width: 230px;
    background: #1f7f82;
    height: 100vh;
    color: white;
    padding: 25px 15px;
}

.profile {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 30px;
}

.profile img {
    width: 40px;
    height: 40px;
    border-radius: 50%;
}

.menu a {
    display: block;
    color: white;
    text-decoration: none;
    padding: 12px;
    border-radius: 8px;
    margin-bottom: 8px;
    transition: 0.3s;
}

.menu a:hover {
    background: rgba(255,255,255,0.15);
}

/* ===== Main ===== */
.main {
    flex: 1;
    padding: 30px;
}

/* Header */
.header h1 {
    font-size: 26px;
    margin-bottom: 5px;
}

.header p {
    color: #666;
    margin-bottom: 20px;
}

/* Search + filters */
.top-bar {
    display: flex;
    justify-content: space-between;
    margin-bottom: 25px;
}

.search {
    padding: 10px 14px;
    width: 260px;
    border-radius: 10px;
    border: 1px solid #ddd;
}

.filters button {
    border: none;
    padding: 8px 14px;
    margin-left: 8px;
    border-radius: 8px;
    background: #e6e6e6;
    cursor: pointer;
}

/* ===== Cards ===== */
.cards {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
    margin-bottom: 25px;
}

.card {
    background: #1f7f82;
    color: white;
    padding: 20px;
    border-radius: 16px;
}

.card h3 {
    font-size: 14px;
    margin-bottom: 10px;
    opacity: 0.9;
}

.card p {
    font-size: 22px;
    font-weight: bold;
}

/* ===== Bottom layout ===== */
.bottom {
    display: grid;
    grid-template-columns: 2fr 1fr;
    gap: 20px;
}

/* Earnings chart box */
.earnings {
    background: #1f7f82;
    color: white;
    padding: 20px;
    border-radius: 18px;
}

.chart {
    height: 160px;
    background: linear-gradient(to top, #dcdcff, #ffffff);
    border-radius: 10px;
    margin-top: 15px;
}

/* Jobs list */
.jobs {
    background: white;
    padding: 20px;
    border-radius: 18px;
}

.job {
    background: #f4f6f8;
    padding: 12px;
    border-radius: 10px;
    margin-bottom: 10px;
}

.job-title {
    font-weight: bold;
    margin-bottom: 4px;
}

.view-all {
    float: right;
    font-size: 12px;
    color: #1f7f82;
    text-decoration: none;
}
</style>
</head>

<body>

<!-- ===== Sidebar ===== -->
<div class="sidebar">
    <div class="profile">
        <img src="https://i.pravatar.cc/40" alt="profile">
        <span>Sophi carter</span>
    </div>

    <div class="menu">
        <a href="studentDashboard">Dashboard</a>
        <a href="studentProject">Projects</a>
        <a href="studentJobs">Find Jobs</a>
        <a href="studentMessage">Message</a>
        <a href="studentPayments">Payments</a>
        <a href="studentSettings">Settings</a>
    </div>
</div>

<!-- ===== Main Content ===== -->
<div class="main">

    <div class="header">
        <h1>Personal Insights</h1>
        <p>Welcome back, Alex. Here's what's happening today.</p>
    </div>

    <div class="top-bar">
        <input class="search" placeholder="Search users">
        <div class="filters">
            <button>Daily</button>
            <button>Weekly</button>
            <button>Monthly</button>
        </div>
    </div>

    <!-- Cards -->
    <div class="cards">
        <div class="card">
            <h3>Total Earning</h3>
            <p>$24,343</p>
        </div>

        <div class="card">
            <h3>Active Applications</h3>
            <p>24</p>
        </div>

        <div class="card">
            <h3>Average Rating</h3>
            <p>4.9 / 5.0</p>
        </div>
    </div>

    <!-- Bottom -->
    <div class="bottom">

        <!-- Earnings -->
        <div class="earnings">
            <h3>Earnings Growth</h3>
            <p>$12,400.00 this month</p>
            <div class="chart"></div>
        </div>

        <!-- Jobs -->
        <div class="jobs">
            <h3>
                Applied Jobs
                <a href="#" class="view-all">View All</a>
            </h3>

            <div class="job">
                <div class="job-title">Senior Product Designer</div>
                <small>2 days ago • 12 applicants</small>
            </div>

            <div class="job">
                <div class="job-title">Web3 Interface Architect</div>
                <small>5 days ago • 8 applicants</small>
            </div>

            <div class="job">
                <div class="job-title">Brand Identity Lead</div>
                <small>4 days ago • 34 applicants</small>
            </div>
        </div>

    </div>
</div>

</body>
</html>
