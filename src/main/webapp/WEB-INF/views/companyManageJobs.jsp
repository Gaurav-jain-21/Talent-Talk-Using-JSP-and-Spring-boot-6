<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Job Postings</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(90deg, #1f7a82, #2a9aa3);
            color: #111;
        }

        /* Navbar */
        .navbar {
            background-color: #1b6f75;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 30px;
            color: #fff;
        }

        .nav-links {
            display: flex;
            gap: 25px;
        }

        .nav-links a {
            text-decoration: none;
            color: #fff;
            font-size: 14px;
        }

        .main {
            padding: 40px 60px;
        }

        h1 {
            margin-bottom: 5px;
        }

        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 20px 0;
        }

        .post-btn {
            background: linear-gradient(90deg, #2a2aff, #5f2bff);
            border: none;
            color: white;
            padding: 12px 20px;
            border-radius: 20px;
            cursor: pointer;
        }

        .job-card {
            background: #e5e5e5;
            border-radius: 14px;
            padding: 20px;
            margin-bottom: 18px;
        }

        .job-title {
            font-size: 22px;
            font-weight: bold;
        }

        .meta {
            margin-top: 8px;
            font-size: 14px;
            display: flex;
            gap: 20px;
        }

        .status {
            padding: 6px 14px;
            border-radius: 14px;
            font-size: 13px;
        }

        .Active { background: #b8e0c2; }
        .Pending { background: #f2e7a1; }
        .Completed { background: #c9c9f5; }

        .actions {
            float: right;
            display: flex;
            gap: 12px;
        }

        .btn-icon {
            cursor: pointer;
            font-size: 18px;
        }
/* Add Job Form Styling - Improved */
form {
    background: #ffffff;
    padding: 30px 25px;
    border-radius: 16px;
    width: 380px;
    margin: 50px auto;
    box-shadow: 0 8px 25px rgba(0,0,0,0.2);
    text-align: center;
}

/* Optional heading inside form */
form::before {
    content: "Add New Job";
    display: block;
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 20px;
    color: #1b6f75;
}

form input {
    width: 80%;
    padding: 12px 14px;
    margin-bottom: 18px;
    border: 1px solid #ccc;
    border-radius: 10px;
    font-size: 14px;
    outline: none;
    transition: 0.3s;
    background: #f9f9f9;
}

form input:focus {
    border-color: #2a9aa3;
    background: #fff;
    box-shadow: 0 0 6px rgba(42,154,163,0.4);
}

/* Placeholder styling */
form input::placeholder {
    color: #888;
}

form button {
    width: 100%;
    padding: 13px;
    background: linear-gradient(90deg, #2a2aff, #5f2bff);
    color: #fff;
    border: none;
    border-radius: 25px;
    font-size: 15px;
    font-weight: bold;
    cursor: pointer;
    transition: 0.3s;
}

form button:hover {
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(0,0,0,0.2);
}
    </style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <div>Logo</div>
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

<div class="main">

<%
    List<Map<String, String>> jobs = new ArrayList<>();

    Map<String, String> j1 = new HashMap<>();
    j1.put("title", "Mobile App Developer");
    j1.put("date", "Oct 16, 2026");
    j1.put("applications", "42 Applications");
    j1.put("status", "Active");
    jobs.add(j1);

    Map<String, String> j2 = new HashMap<>();
    j2.put("title", "Brand Identity Designer");
    j2.put("date", "Oct 16, 2026");
    j2.put("applications", "0 Applications");
    j2.put("status", "Pending");
    jobs.add(j2);

    Map<String, String> j3 = new HashMap<>();
    j3.put("title", "Fullstack Node.js Dev.");
    j3.put("date", "Oct 16, 2026");
    j3.put("applications", "Hired: Alex River");
    j3.put("status", "Completed");
    jobs.add(j3);

    Map<String, String> j4 = new HashMap<>();
    j4.put("title", "Data Science (ML)");
    j4.put("date", "Oct 16, 2026");
    j4.put("applications", "18 Applications");
    j4.put("status", "Active");
    jobs.add(j4);
%>

    <div class="top-bar">
        <div>
            <h1>Manage Job Postings</h1>
            <div>Oversee your active listings and track applicant progress.</div>
        </div>
        <!--  <button class="post-btn">+ Post New Jobs</button>-->
    </div>
    
    <form method='post' action="addCompanyPost">
    <input type="text" name="jobtitle" placeholder="Enter the title of the job"><br>
    <input type="text" name="jobpay" placeholder ="Enter the amount you want to pay"><br>
    <input  type="text" name="jobsets" placeholder="Enter number of sets in company"><br>
    <button type= "submit" class="btn-btn-primary">Add</button>
    
    </form>

<%
    for (Map<String, String> job : jobs) {
%>

    <div class="job-card">
        <div class="actions">
            <span class="btn-icon">✏️</span>
            <span class="btn-icon">⏸️</span>
            <span class="btn-icon">🗑️</span>
        </div>

        <div class="job-title"><%= job.get("title") %></div>

        <div class="meta">
            <span>📅 <%= job.get("date") %></span>
            <span>👥 <%= job.get("applications") %></span>
            <span class="status <%= job.get("status") %>"><%= job.get("status") %></span>
        </div>
    </div>

<%
    }
%>

</div>
<jsp:include page="footer.jsp" />

</body>
</html>
