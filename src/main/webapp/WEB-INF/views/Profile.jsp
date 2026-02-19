<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body{
    display:flex;
    height:100vh;
}

/* ===== Sidebar ===== */
.sidebar{
    width:240px;
    background:#1f7f82;
    color:white;
    padding:20px;
}

.profile-mini{
    display:flex;
    align-items:center;
    gap:10px;
    margin-bottom:30px;
}

.profile-mini img{
    width:40px;
    height:40px;
    border-radius:50%;
}

.menu a{
    display:block;
    color:white;
    text-decoration:none;
    padding:10px 0;
    font-size:14px;
}

.menu a:hover{
    opacity:0.85;
}

/* ===== Main ===== */
.main{
    flex:1;
    background:white;
    padding:40px;
    position:relative;
}

/* ===== Profile Header ===== */
.profile-header{
    display:flex;
    align-items:center;
    gap:20px;
    margin-bottom:25px;
}

.profile-header img{
    width:90px;
    height:90px;
    border-radius:50%;
}

.profile-header h2{
    margin-bottom:5px;
}

.profile-header small{
    color:#777;
}

/* ===== Info ===== */
.section-title{
    font-weight:600;
    margin-bottom:15px;
}

.info p{
    margin-bottom:10px;
    font-size:15px;
}

/* ===== Edit Button ===== */
.edit-btn{
    position:absolute;
    right:40px;
    top:120px;
    background:#4b39d4;
    color:white;
    border:none;
    padding:10px 16px;
    border-radius:8px;
    cursor:pointer;
    font-size:14px;
}
</style>
</head>

<body>

<!-- ===== Sidebar ===== -->
<div class="sidebar">

    <div class="profile-mini">
        <img src="https://i.pravatar.cc/40">
        <a href="Profile"><span>Sophi carter</span></a>
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

    <div class="profile-header">
        <img src="https://i.pravatar.cc/90">
        <div>
            <h2>Sophia Carter</h2>
            <small>Joined in 2021</small>
        </div>
    </div>

    <div class="section-title">Personal Information</div>

    <div class="info">
        <p><strong>Full Name :</strong> Sophia Carter</p>
        <p><strong>Email :</strong> sophi@gmail.com</p>
        <p><strong>Phone Number :</strong> 1234561230</p>
    </div>

    <form action="editProfile" method="get">
        <button class="edit-btn">Edit Profile</button>
    </form>

</div>

</body>
</html>
