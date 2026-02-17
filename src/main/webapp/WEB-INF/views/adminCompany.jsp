<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Company</title>
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>

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
    position: relative;
}

.header {
    font-size: 24px;
    font-weight: 600;
    margin-bottom: 25px;
}

/* ===== Company Grid ===== */
.company-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
    gap: 30px;
    padding-bottom: 80px;
}

/* ===== Company Card ===== */
.company-card {
    max-width: 220px;
}

/* Logo box */
.logo-box {
    width: 100%;
    height: 150px;
    border-radius: 16px;
    overflow: hidden;
    margin-bottom: 12px;
    position: relative;
    background: #eee;
}

/* Checkbox on top-right */
.logo-box input[type="checkbox"] {
    position: absolute;
    top: 10px;
    right: 10px;
    width: 18px;
    height: 18px;
    cursor: pointer;
}

/* Logo image */
.logo-box img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

/* Company text */
.company-name {
    font-weight: 600;
    margin-bottom: 4px;
    color: #222;
}

.company-category {
    color: #6c63ff;
    font-size: 14px;
    margin-bottom: 6px;
}

.company-desc {
    color: #7a7a9a;
    font-size: 13px;
    line-height: 1.4;
}

/* ===== Bottom Action Bar ===== */
.action-bar {
    position: fixed;
    bottom: 0;
    left: 240px;
    right: 0;
    background: #ffffff;
    border-top: 1px solid #e6e6e6;
    padding: 15px 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.reject-btn {
    background: transparent;
    border: none;
    font-weight: 600;
    cursor: pointer;
}

.approve-btn {
    background: #4f2cff;
    color: #fff;
    border: none;
    padding: 10px 24px;
    border-radius: 12px;
    cursor: pointer;
    font-weight: 600;
}

.approve-btn:hover {
    opacity: 0.9;
}

</style>     
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <h2>Admin Panel</h2>
    <div class="menu">
        <a href="adminDashboard.jsp"><i class="fa-solid fa-chart-line"></i> Dashboard</a>
        <a href="adminUsers.jsp"><i class="fa-solid fa-users"></i> Users</a>
        <a href="adminJobs.jsp"><i class="fa-solid fa-briefcase"></i> Jobs</a>
        <a href="adminCompany.jsp" class="active"><i class="fa-solid fa-building"></i> Company Verification</a>
        <a href="adminInvoice.jsp"><i class="fa-solid fa-file-invoice"></i> Invoice</a>
        <a href="adminInsights.jsp"><i class="fa-solid fa-chart-pie"></i> Insights</a>
        <a href="adminPayment.jsp"><i class="fa-solid fa-credit-card"></i> Payments</a>
        <a href="adminSettings.jsp"><i class="fa-solid fa-gear"></i> Settings</a>
    </div>
</div>

<!-- Main Content -->
<div class="main">
    <div class="header">Company Verification</div>

    <%
    List<Map<String, String>> companys = Arrays.asList(

        Map.of(
            "name", "Tech Innovators Inc.",
            "category", "Technology",
            "description", "Tech Innovators Inc. is a leading technology company specializing in software development and IT solutions.",
            "image", "images/company1.png"
        ),

        Map.of(
            "name", "Global Solutions Ltd.",
            "category", "Consulting",
            "description", "Global Solutions Ltd. offers comprehensive consulting services to businesses worldwide.",
            "image", "images/company2.png"
        ),

        Map.of(
            "name", "Creative Minds Co.",
            "category", "Design",
            "description", "Creative Minds Co. is a design agency known for its innovative and creative solutions.",
            "image", "images/company3.png"
        ),

        Map.of(
            "name", "Digital Dynamics Corp.",
            "category", "Software",
            "description", "Digital Dynamics Corp. is a software company focused on creating dynamic digital experiences.",
            "image", "images/company4.png"
        ),

        Map.of(
            "name", "Strategic Ventures LLC.",
            "category", "Finance",
            "description", "Strategic Ventures LLC. is a finance firm specializing in strategic investments and financial planning.",
            "image", "images/company5.png"
        ),

        Map.of(
            "name", "Innovative Systems Group",
            "category", "Engineering",
            "description", "Innovative Systems Group is an engineering company that develops cutting-edge systems and technologies.",
            "image", "images/company6.png"
        )

    );
    %>

    <form action="CompanyApprovalServlet" method="post">

    <div class="company-grid">

    <% for (Map<String, String> c : companys) { %>

        <div class="company-card">
            <div class="logo-box">
                <input type="checkbox" name="selectedCompanies" value="<%= c.get("name") %>">
                <img src="<%= c.get("image") %>" alt="logo">
            </div>
            <div class="company-name"><%= c.get("name") %></div>
            <div class="company-category"><%= c.get("category") %></div>
            <div class="company-desc"><%= c.get("description") %></div>
        </div>

    <% } %>

    </div>

    <!-- Bottom Buttons -->
    <div class="action-bar">
        <button type="submit" name="action" value="reject" class="reject-btn">Reject</button>
        <button type="submit" name="action" value="approve" class="approve-btn">Approve</button>
    </div>

    </form>

</div>

</body>
</html>