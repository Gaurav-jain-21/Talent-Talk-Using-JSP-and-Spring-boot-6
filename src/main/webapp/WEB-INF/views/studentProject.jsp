<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find Projects</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
    background: #1f7f82;
    color: #000;
}

/* ===== Top Navbar ===== */
.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 12px 30px;
    background: #1f7f82;
    color: white;
}

.nav-right a {
    margin-left: 20px;
    text-decoration: none;
    color: white;
    font-size: 14px;
}

/* ===== Hero Section ===== */
.hero {
    text-align: center;
    padding: 40px 20px 20px;
    color: black;
}

.hero h1 {
    font-size: 34px;
    margin-bottom: 10px;
}

.hero p {
    color: #e0e0e0;
}

/* ===== Search Bar ===== */
.search-bar {
    background: #e5e5e5;
    margin: 25px auto;
    padding: 18px;
    width: 80%;
    border-radius: 12px;
    display: flex;
    gap: 10px;
    justify-content: space-between;
}

.search-bar input,
.search-bar select {
    padding: 10px 12px;
    border-radius: 8px;
    border: none;
}

.search-bar input {
    flex: 1;
}

/* ===== Cards Grid ===== */
.cards {
    width: 85%;
    margin: auto;
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 25px;
}

/* ===== Single Card ===== */
.card {
    background: #f2f2f2;
    padding: 18px;
    border-radius: 16px;
    position: relative;
    transition: 0.3s;
}

.card:hover {
    transform: translateY(-6px);
    box-shadow: 0 10px 25px rgba(0,0,0,0.15);
}

.heart {
    position: absolute;
    right: 15px;
    top: 12px;
    font-size: 18px;
    cursor: pointer;
}

.logo {
    width: 45px;
    height: 45px;
    background: #8fb3a9;
    border-radius: 6px;
    margin-bottom: 10px;
}

.title {
    font-weight: 600;
    margin-bottom: 6px;
}

.salary {
    color: #0066ff;
    font-weight: 600;
    margin-bottom: 4px;
}

.meta {
    font-size: 13px;
    color: #666;
    margin-bottom: 10px;
}

/* Tags */
.tags {
    display: flex;
    gap: 6px;
    flex-wrap: wrap;
    margin-bottom: 12px;
}

.tag {
    background: #dcd0f5;
    padding: 4px 10px;
    border-radius: 12px;
    font-size: 12px;
}

/* Button */
.apply-btn {
    width: 100%;
    padding: 10px;
    border: none;
    border-radius: 18px;
    background: linear-gradient(90deg, #4b2cff, #2a2acb);
    color: white;
    font-weight: 600;
    cursor: pointer;
}

/* ===== Explore Button ===== */
.explore {
    display: block;
    margin: 40px auto;
    padding: 12px 22px;
    border-radius: 18px;
    border: none;
    background: #e6e6e6;
    cursor: pointer;
}
</style>
</head>

<body>

<!-- ===== Navbar ===== -->
<div class="navbar">
    <div>👤</div>

    <div class="nav-right">
        <a href="studentDashboard">Dashboard</a>
        <a href="studentProject">Projects</a>
        <a href="studentJobs">Find Jobs</a>
        <a href="studentMessage">Message</a>
        <a href="studentPayments">Payments</a>
        <a href="studentSettings">Settings</a>
    </div>
</div>

<!-- ===== Hero ===== -->
<div class="hero">
    <h1>Find Your Next Premium Project</h1>
    <p>Connect with top-tier companies and work on high-impact projects that match your expertise.</p>
</div>

<!-- ===== Search ===== -->
<div class="search-bar">
    <input type="text" placeholder="Search users">
    <select><option>Category</option></select>
    <select><option>Budget Range</option></select>
    <select><option>Job Type</option></select>
</div>

<!-- ===== Cards ===== -->
<div class="cards">

    <div class="card">
        <div class="heart">♡</div>
        <div class="logo"></div>
        <div class="title">Senior UI/UX Designer</div>
        <div class="salary">$80k – $120k / year</div>
        <div class="meta">Posted 2h ago • Remote</div>

        <div class="tags">
            <span class="tag">Figma</span>
            <span class="tag">UI/UX</span>
            <span class="tag">Mobile app</span>
        </div>

        <button class="apply-btn">Quick Apply</button>
    </div>

    <div class="card">
        <div class="heart">♡</div>
        <div class="logo"></div>
        <div class="title">Senior UI/UX Designer</div>
        <div class="salary">$80k – $120k / year</div>
        <div class="meta">Posted 2h ago • Remote</div>

        <div class="tags">
            <span class="tag">Figma</span>
            <span class="tag">UI/UX</span>
            <span class="tag">Mobile app</span>
        </div>

        <button class="apply-btn">Quick Apply</button>
    </div>

    <div class="card">
        <div class="heart">♡</div>
        <div class="logo"></div>
        <div class="title">Senior UI/UX Designer</div>
        <div class="salary">$80k – $120k / year</div>
        <div class="meta">Posted 2h ago • Remote</div>

        <div class="tags">
            <span class="tag">Figma</span>
            <span class="tag">UI/UX</span>
            <span class="tag">Mobile app</span>
        </div>

        <button class="apply-btn">Quick Apply</button>
    </div>

</div>

<button class="explore">Explore More Projects</button>

</body>
</html>
