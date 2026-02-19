<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Submit Proposal</title>

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
    z-index: 1000;
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
    transition: 0.2s;
}

.nav-links a:hover {
    opacity: 0.8;
}

/* ===== Page Body ===== */
body {
    background: #1f7f82;
    padding: 110px 40px 40px; /* top padding for fixed navbar */
}

/* Container */
.wrapper {
    max-width: 900px;
    margin: auto;
    color: black;
}

/* Header */
.header small {
    color: #c7c7ff;
    letter-spacing: 1px;
}

.header h1 {
    margin: 8px 0;
}

.header p {
    color: #dfe6ff;
}

/* View Job Button */
.view-btn {
    float: right;
    margin-top: -45px;
    padding: 10px 18px;
    border-radius: 20px;
    border: none;
    background: #e6e6e6;
    cursor: pointer;
}

/* Project card */
.project {
    background: #e6e6e6;
    padding: 18px;
    border-radius: 14px;
    display: flex;
    align-items: center;
    gap: 15px;
    margin: 25px 0;
}

.project-icon {
    width: 55px;
    height: 55px;
    background: #d9cfcf;
    border-radius: 10px;
}

.badge {
    display: inline-block;
    padding: 6px 12px;
    border-radius: 10px;
    margin-right: 10px;
    font-size: 13px;
}

.price { background: #dcd0f5; }
.time  { background: #b8e6c1; }

/* Form box */
.form-box {
    background: #e6e6e6;
    padding: 20px;
    border-radius: 16px;
}

.form-box h3 {
    margin-bottom: 15px;
}

/* Inputs */
textarea, input, select {
    width: 100%;
    padding: 12px;
    border-radius: 10px;
    border: none;
    margin-top: 8px;
}

textarea {
    height: 120px;
    resize: none;
}

/* Row */
.row {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 15px;
    margin: 15px 0;
}

/* Upload box */
.upload {
    border: 2px dashed #bbb;
    padding: 30px;
    text-align: center;
    border-radius: 12px;
    background: #f5f5f5;
    margin-top: 10px;
}

/* Buttons */
.actions {
    display: flex;
    justify-content: flex-end;
    gap: 12px;
    margin-top: 15px;
}

.cancel {
    background: #d6d28f;
    border: none;
    padding: 10px 20px;
    border-radius: 8px;
    cursor: pointer;
}

.submit {
    background: #2d39d4;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 8px;
    cursor: pointer;
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
<div class="wrapper">

    <!-- Header -->
    <div class="header">
        <small>APPLICATION PROCESS</small>
        <h1>Submit Proposal</h1>
        <p>Apply for this professional opportunity</p>
        <button class="view-btn">👁 View Job Details</button>
    </div>

    <!-- Project Info -->
    <div class="project">
        <div class="project-icon"></div>
        <div>
            <strong>Senior UI/UX Designer for Fintech App</strong><br>
            <span class="badge price">$5,000 – $8,000</span>
            <span class="badge time">3 – 6 Months</span>
        </div>
    </div>

    <!-- Form -->
    <form class="form-box" action="submitProposal" method="post" enctype="multipart/form-data">

        <h3>Proposal Details</h3>

        <label>Cover Letter</label>
        <textarea name="coverLetter"
            placeholder="Write your professional cover letter here..."></textarea>

        <div class="row">
            <div>
                <label>Your Bid Amount</label>
                <input type="number" name="bid" placeholder="$0.00">
            </div>

            <div>
                <label>Project Timeline</label>
                <select name="timeline">
                    <option>Less than 1 month</option>
                    <option>1 – 3 months</option>
                    <option>3 – 6 months</option>
                </select>
            </div>
        </div>

        <label>Attachments (Optional)</label>
        <div class="upload">
            Drag and drop files here<br>
            <small>Supported: PDF, JPG, PNG, DOCX</small>
            <input type="file" name="file">
        </div>

        <div style="margin-top:10px;">
            <input type="checkbox" required>
            I agree to the Terms of Service and Privacy Policy.
        </div>

        <div class="actions">
            <button type="reset" class="cancel">Cancel</button>
            <button type="submit" class="submit">Submit Proposal</button>
        </div>

    </form>

</div>

</body>
</html>
