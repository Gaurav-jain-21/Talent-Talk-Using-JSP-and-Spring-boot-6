<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Settings</title>
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<style>
/* ===== ORIGINAL CSS (UNCHANGED) ===== */
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

/* ===== NEW SETTINGS UI ===== */
.settings-container {
    max-width: 600px;
}

.card {
    background: #ffffff;
    border-radius: 14px;
    padding: 20px;
    margin-bottom: 20px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.05);
}

.card-title {
    font-size: 16px;
    font-weight: 600;
    margin-bottom: 12px;
}

.input-group {
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.input-group input {
    padding: 10px 12px;
    border: 1px solid #ddd;
    border-radius: 8px;
    font-size: 14px;
}

.save-btn {
    margin-top: 10px;
    background: #6c63ff;
    color: #fff;
    border: none;
    padding: 10px 16px;
    border-radius: 8px;
    cursor: pointer;
    font-size: 14px;
}

.toggle {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.logout-btn {
    width: 100%;
    background: #ef4444;
    color: #fff;
    border: none;
    padding: 12px;
    border-radius: 10px;
    cursor: pointer;
    font-size: 14px;
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
        <a href="adminCompany"><i class="fa-solid fa-building"></i> Company Verification</a>
        <a href="adminInvoice"><i class="fa-solid fa-file-invoice"></i> Invoice</a>
        <a href="adminInsights"><i class="fa-solid fa-chart-pie"></i> Insights</a>
        <a href="adminPayment"><i class="fa-solid fa-credit-card"></i> Payments</a>
        <a href="adminSettins" class="active"><i class="fa-solid fa-gear"></i> Settings</a>
    </div>
</div>

<!-- Main Content -->
<div class="main">

    <div class="header">Admin Settings</div>

    <div class="settings-container">

        <!-- Edit Profile -->
        <div class="card">
            <div class="card-title">Edit Profile</div>
            <div class="input-group">
                <input type="text" placeholder="Full Name">
                <input type="email" placeholder="Email Address">
                <input type="password" placeholder="Old Password">
                <input type="password" placeholder="New Password">
                <input type="password" placeholder="Repeat New Password">
                <button class="save-btn">Save Changes</button>
            </div>
        </div>

        <!-- Dark Mode -->
        <div class="card">
            <div class="card-title">Appearance</div>
            <div class="toggle">
                <span>Enable Dark Mode</span>
                <input type="checkbox">
            </div>
        </div>

        <!-- Logout -->
        <form class="card" action="LogoutCompany" method="get">
            <button class="logout-btn" name="logoutButton" value="false">Logout</button>
        </form>

    </div>

</div>

</body>
</html>