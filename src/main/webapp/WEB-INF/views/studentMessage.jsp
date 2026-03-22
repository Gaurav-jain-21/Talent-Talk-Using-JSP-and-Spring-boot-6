<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Messages</title>

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
}

/* ===== Page Layout ===== */
body {
    background: #1f7f82;
    padding: 90px 30px;
}

.container {
    max-width: 900px;
    margin: auto;
}

/* Header */
.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    color: black;
    margin-bottom: 20px;
}

.search-box input {
    padding: 10px 14px;
    border-radius: 10px;
    border: none;
    width: 260px;
}

/* Divider */
.divider {
    height: 1px;
    background: rgba(255,255,255,0.4);
    margin: 15px 0 25px;
}

/* Message Card */
.message-card {
    background: #e6e6e6;
    border-radius: 14px;
    padding: 14px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 14px;
}

.msg-left {
    display: flex;
    align-items: center;
    gap: 12px;
}

.msg-icon {
    width: 50px;
    height: 50px;
    border-radius: 10px;
    background: #cfdede;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
}

.msg-info strong {
    display: block;
}

.msg-info small {
    color: #555;
}

.msg-type {
    color: #333;
}

/* Actions */
.msg-actions {
    display: flex;
    gap: 14px;
    font-size: 18px;
    cursor: pointer;
}

.delete {
    color: red;
}
</style>
</head>

<body>

<!-- ===== Navbar ===== -->
<div class="navbar">
    <div class="nav-left">
        <img src="https://i.pravatar.cc/40" alt="profile">
        <span>Student</span>
    </div>

    <div class="nav-links">
        <a href="studentDashboard">Dashboard</a>
        <a href="studentProject">Projects</a>
        <a href="studentJobs">Find Jobs</a>
        <a href="studentMessage">Message</a>
        <a href="studentPayments">Payments</a>
        <a href="studentSettings">Settings</a>
    </div>
</div>

<!-- ===== Main Content ===== -->
<div class="container">

    <div class="header">
        <h2>Message</h2>
        <div class="search-box">
            <input type="text" placeholder="🔍 Search">
        </div>
    </div>

    <div class="divider"></div>

    <!-- Message Item 1 -->
    <div class="message-card">
        <div class="msg-left">
            <div class="msg-icon">TA</div>
            <div class="msg-info">
                <strong>Tech Innovators Inc.</strong>
                <small>2 mins ago</small>
            </div>
        </div>

        <div class="msg-type">Project Requirement</div>

        <div class="msg-actions">
            👁
            <span class="delete">🗑</span>
        </div>
    </div>

    <!-- Message Item 2 -->
    <div class="message-card">
        <div class="msg-left">
            <div class="msg-icon">CM</div>
            <div class="msg-info">
                <strong>Creative Minds Co.</strong>
                <small>10 mins ago</small>
            </div>
        </div>

        <div class="msg-type">Project Inquiry</div>

        <div class="msg-actions">
            👁
            <span class="delete">🗑</span>
        </div>
    </div>

</div>

</body>
</html>
