<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Settings</title>

<!-- Font Awesome -->
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
    *{
        margin:0;
        padding:0;
        box-sizing:border-box;
        font-family: Arial, sans-serif;
    }

    body{
        display:flex;
        background:#f4f4f4;
    }

    /* Sidebar */
    /* SIDEBAR */
.sidebar{
    width:240px;
    background:#1f7f86;
    color:white;
    min-height:100vh;
    padding:20px;
}

.profile{
    display:flex;
    align-items:center;
    gap:10px;
    margin-bottom:30px;
}

.profile img{
    width:40px;
    height:40px;
    border-radius:50%;
}

.menu a{
    display:flex;
    align-items:center;
    gap:10px;
    padding:10px;
    margin-bottom:8px;
    color:white;
    text-decoration:none;
    border-radius:8px;
    font-size:14px;
}

.menu a:hover{
    background:#166a70;
}
    /* Main Content */
    .main{
        flex:1;
        padding:40px;
    }

    .main h2{
        margin-bottom:30px;
    }

    .setting-item{
        display:flex;
        justify-content:space-between;
        align-items:center;
        margin-bottom:20px;
        width:400px;
    }

    /* Toggle Switch */
    .switch{
        position:relative;
        display:inline-block;
        width:50px;
        height:25px;
    }

    .switch input{
        opacity:0;
        width:0;
        height:0;
    }

    .slider{
        position:absolute;
        cursor:pointer;
        top:0;
        left:0;
        right:0;
        bottom:0;
        background-color:#ccc;
        border-radius:25px;
        transition:0.4s;
    }

    .slider:before{
        position:absolute;
        content:"";
        height:19px;
        width:19px;
        left:3px;
        bottom:3px;
        background:white;
        border-radius:50%;
        transition:0.4s;
    }

    input:checked + .slider{
        background-color:#4CAF50;
    }

    input:checked + .slider:before{
        transform:translateX(24px);
    }

    /* Buttons */
    .btn{
        padding:10px 20px;
        border:none;
        border-radius:8px;
        cursor:pointer;
        font-weight:bold;
        margin-right:10px;
    }

    .save-btn{
        background:#4b3df2;
        color:white;
    }

    .logout-btn{
        background:#e53935;
        color:white;
    }

    .button-group{
        margin-top:30px;
    }

</style>

</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <div class="profile">
        <img src="https://i.pravatar.cc/100" alt="Profile">
        <span>Sophi carter</span>
    </div>

    <div class="menu">
        <a href="${pageContext.request.contextPath}/companyDashboard" ><i class="fa fa-home"></i> Dashboard</a>
        <a href="${pageContext.request.contextPath}/companyClient"><i class="fa fa-users"></i> Client</a>
        <a href="${pageContext.request.contextPath}/companyJobs"><i class="fa fa-briefcase"></i> Post Jobs</a>
        <a href="${pageContext.request.contextPath}/companyManageJobs"><i class="fa fa-list"></i> Manage Jobs</a>
        <a href="${pageContext.request.contextPath}/companyApplication"><i class="fa fa-file"></i> Application</a>
        <a href="${pageContext.request.contextPath}/companyMessage"><i class="fa fa-envelope"></i> Message</a>
        <a href="${pageContext.request.contextPath}/companyPayment"><i class="fa fa-dollar-sign"></i> Payments</a>
        <a href="${pageContext.request.contextPath}/companySettings" class="active"><i class="fa fa-gear"></i> Settings</a>
    </div>
</div>

<!-- Main Content -->
<div class="main">
    <h2>Setting</h2>

    <div class="setting-item">
        <span>Dark Mode</span>
        <label class="switch">
            <input type="checkbox">
            <span class="slider"></span>
        </label>
    </div>

    <div class="setting-item">
        <span>Email Alerts</span>
        <label class="switch">
            <input type="checkbox">
            <span class="slider"></span>
        </label>
    </div>

    <div class="button-group">
        <button class="btn save-btn">Save Changes</button>
        <form action="LogoutAdmin" method="get">
        <button class="btn logout-btn">
            <i class="fa fa-right-from-bracket"></i> Logout
        </button>
        </form>
    </div>
</div>

</body>
</html>
