
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Company Dashboard</title>

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
    display:flex;
    background:#f5f6f8;
}

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

/* MAIN */
.main{
    flex:1;
    padding:30px;
}

.title{
    font-size:32px;
    font-weight:900;
}

.subtitle{
    margin:10px 0 25px;
    color:#555;
}

/* GRID */
.grid{
    display:grid;
    grid-template-columns:260px 1fr;
    gap:30px;
}

/* LEFT CARDS */
.card{
    background:#1f7f86;
    color:white;
    border-radius:16px;
    padding:25px;
    margin-bottom:25px;
    text-align:center;
}

.card i{
    font-size:40px;
    margin-bottom:10px;
}

.card .number{
    font-size:48px;
    margin-top:10px;
}

.blue{
    color:#2a5cff;
    font-size:18px;
}

/* RIGHT PANEL */
.panel{
    background:#1f7f86;
    color:white;
    padding:25px;
    border-radius:18px;
}

.app{
    display:flex;
    align-items:center;
    justify-content:space-between;
    margin:15px 0;
}

.app-left{
    display:flex;
    align-items:center;
    gap:10px;
}

.app img{
    width:45px;
    height:45px;
    border-radius:50%;
}

.view-btn{
    display:block;
    margin:20px auto 0;
    background:#2a5cff;
    color:white;
    padding:12px 30px;
    border-radius:25px;
    text-align:center;
    text-decoration:none;
}

/* PROJECTS */
.projects{
    margin-top:30px;
}

.project{
    background:#e6e6e6;
    padding:18px 22px;
    border-radius:16px;
    margin-top:15px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.status{
    padding:8px 18px;
    border-radius:20px;
    color:white;
}

.green{ background:#2ecc71; }
.yellow{ background:#f1c40f; }
</style>
</head>

<body>

<!-- SIDEBAR -->
<div class="sidebar">
    <div class="profile">
        <img src="https://i.pravatar.cc/40">
        <div>Sophi carter</div>
    </div>

    <div class="menu">
        <a href="${pageContext.request.contextPath}/companyDashboard" class="active"><i class="fa fa-home"></i> Dashboard</a>
        <a href="${pageContext.request.contextPath}/companyClient"><i class="fa fa-users"></i> Client</a>
        <a href="${pageContext.request.contextPath}/companyJobs"><i class="fa fa-briefcase"></i> Post Jobs</a>
        <a href="${pageContext.request.contextPath}/companyManageJobs"><i class="fa fa-list"></i> Manage Jobs</a>
        <a href="${pageContext.request.contextPath}/companyApplication"><i class="fa fa-file"></i> Application</a>
        <a href="${pageContext.request.contextPath}/companyMessage"><i class="fa fa-envelope"></i> Message</a>
        <a href="${pageContext.request.contextPath}/companyPayment"><i class="fa fa-dollar-sign"></i> Payments</a>
        <a href="#"><i class="fa fa-gear"></i> Settings</a>
    </div>
</div>

<!-- MAIN -->
<div class="main">

    <div class="title">DASHBOARD</div>
    <div class="subtitle">Welcome back, here What’s happening with your company today</div>

    <div class="grid">

        <!-- LEFT -->
        <div>
            <div class="card">
                <i class="fa fa-briefcase"></i>
                <div>Active jobs</div>
                <div class="number">24 <span class="blue">20%</span></div>
            </div>

            <div class="card">
                <i class="fa fa-bell"></i>
                <div>Recent Notification</div>
                <div class="number">24</div>
            </div>

            <div class="card">
                <i class="fa fa-star"></i>
                <div>Rating</div>
                <div class="number">4/5</div>
            </div>
        </div>

        <!-- RIGHT -->
        <div>
            <div class="panel">
                <h3>Resent Application</h3>

                <%
                List<Map<String,String>> apps = Arrays.asList(
                    Map.of("name","Olivia Hayes","role","Content Marketing Specialist","score","90%"),
                    Map.of("name","Liam Harper","role","Mobile App Developer","score","94%"),
                    Map.of("name","Ethan Bennett","role","Senior UX/UI Designer","score","89%")
                );

                for(Map<String,String> a : apps){
                %>
                <div class="app">
                    <div class="app-left">
                        <img src="https://i.pravatar.cc/45">
                        <div>
                            <div><%=a.get("name")%></div>
                            <small><%=a.get("role")%></small>
                        </div>
                    </div>
                    <div class="blue"><%=a.get("score")%></div>
                </div>
                <% } %>

                <a class="view-btn" href="#">View All</a>
            </div>

            <!-- PROJECTS -->
            <div class="projects">
                <h2>Current Projects <span style="float:right;color:#2a5cff;font-size:14px;">View All</span></h2>

                <%
List<Map<String,String>> projects = Arrays.asList(
    Map.of(
        "title","Senior UX/UI Designer",
        "details","Application 56 • Post 1 Week Ago",
        "status","Active",
        "color","green"
    ),
    Map.of(
        "title","Mobile App Developer",
        "details","Application 116 • Post 2 day’s Ago",
        "status","Reviewing",
        "color","yellow"
    )
);
%>

<% for(Map<String,String> p : projects){ %>
    <div class="project">
        <div>
            <h3><%= p.get("title") %></h3>
            <small><%= p.get("details") %></small>
        </div>
        <div class="status <%= p.get("color") %>">
            <%= p.get("status") %>
        </div>
    </div>
<% } %>
            </div>
        </div>

    </div>
</div>

</body>
</html>
