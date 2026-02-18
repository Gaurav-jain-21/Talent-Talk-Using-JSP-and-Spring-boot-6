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
        <a href="${pageContext.request.contextPath}/companyDashboard">Dashboard</a>
        <a href="${pageContext.request.contextPath}/companyClient" class="active">Clients</a>
        <a href="${pageContext.request.contextPath}/companyJobs">Post Jobs</a>
        <a href="${pageContext.request.contextPath}/companyManageJobs">Manage Jobs</a>
        <a href="${pageContext.request.contextPath}/companyApplication">Application</a>
        <a href="${pageContext.request.contextPath}/companyMessage">Messages</a>
        <a href="${pageContext.request.contextPath}/companyPayment">Payments</a>
        <a href="${pageContext.request.contextPath}/companySettings">Settings</a>
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

    <%
    List<Map<String,String>> clients = Arrays.asList(

        Map.of(
            "name","Sophia Carter",
            "role","Mobile App Developer",
            "rating","4.5/5",
            "status","Active",
            "color","green"
        ),

        Map.of(
            "name","Jackson Reed",
            "role","Content Marketing",
            "rating","4/5",
            "status","Accepts",
            "color","yellow"
        ),

        Map.of(
            "name","Isabella Cole",
            "role","Senior UX/UI Designer",
            "rating","4.6/5",
            "status","Deactive",
            "color","red"
        )
    );
    %>

    <div class="table">

        <!-- HEADER -->
        <div class="row" style="opacity:0.8; font-size:14px;">
            <div>Name</div>
            <div>Role</div>
            <div>Rating</div>
            <div>Status</div>
        </div>

        <% for(Map<String,String> c : clients){ %>
        <div class="row">
            <div class="user">
                <img src="https://i.pravatar.cc/40">
                <span><%= c.get("name") %></span>
            </div>

            <div><%= c.get("role") %></div>

            <div><%= c.get("rating") %></div>

            <div class="status <%= c.get("color") %>">
                <%= c.get("status") %>
            </div>
        </div>
        <% } %>

    </div>

</div>

</body>
</html>