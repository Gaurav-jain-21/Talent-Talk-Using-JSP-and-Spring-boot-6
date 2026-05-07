<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Messages</title>

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
    padding: 30px 60px 60px;
}

.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 25px;
}

.search {
    padding: 10px 14px;
    border-radius: 12px;
    border: none;
    width: 260px;
}

.compose-card { background: white; color: #333; padding: 20px; border-radius: 15px; margin-bottom: 30px; }
.compose-card input, .compose-card textarea { width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ddd; border-radius: 8px; }
.btn-send { background: #1f7f82; color: white; border: none; padding: 10px 20px; border-radius: 8px; cursor: pointer; font-weight: bold; }
/* Message Card */
.message {
    background: #e6e6e6;
    border-radius: 25px;
    padding: 15px 20px;
    margin-bottom: 18px;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.left {
    display: flex;
    align-items: center;
    gap: 15px;
}

.avatar {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    background: #bbb;
}

.name {
    font-weight: bold;
    font-size: 18px;
}

.time {
    font-size: 13px;
    color: #333;
}

.subject {
    flex: 1;
    text-align: center;
    font-size: 15px;
}

.actions {
    display: flex;
    gap: 18px;
    font-size: 18px;
    cursor: pointer;
}

.delete { color: red; }
</style>
</head>

<body>

<!-- Navbar -->
<div class="navbar">
    <i class="fa fa-user"></i>
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
    <div class="container">
        <h2>Send New Message</h2>
        <div class="compose-card">
            <form action="sendMessage" method="POST">
                <input type="email" name="clientEmail" placeholder="Recipient Email (Student)" required>
                <textarea name="messageContent" rows="3" placeholder="Write your message..." required></textarea>
                <button type="submit" class="btn-send">Send Message <i class="fa fa-paper-plane"></i></button>
            </form>
        </div>

        <hr style="margin-bottom: 20px; opacity: 0.3;">

        <h2>Recent Inbound Messages</h2>
        <c:forEach var="msg" items="${messages}">
            <div class="message-card">
                <div class="msg-icon">${msg.senderEmail.substring(0,1).toUpperCase()}</div>
                <div class="msg-body">
                    <strong>${msg.senderEmail}</strong><br>
                    <small>${msg.content}</small>
                </div>
                <div class="msg-actions">
                    <i class="fa fa-eye"></i>
                    <a href="deleteMessage/${msg.id}"><i class="fa fa-trash delete"></i></a>
                </div>
            </div>
        </c:forEach>

        <c:if test="${empty messages}">
            <p style="text-align:center; opacity:0.7;">No messages in your inbox.</p>
        </c:if>
    </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
