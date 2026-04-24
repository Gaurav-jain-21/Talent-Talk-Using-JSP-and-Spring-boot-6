<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Messages</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
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
}

/* ===== Page Layout ===== */
body {
    background: #1f7f82;

    padding-top: 90px; /* navbar space */
    margin: 0;

    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

.container {
    max-width: 900px;
    margin: auto;
    width: 100%;
    flex: 1;
}

/* Header */
.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    color: black;
    margin-bottom: 20px;
}

.search-box input {
    padding: 10px 14px;
    border-radius: 10px;
    border: none;
    width: 260px;
}
/* Add these to your existing CSS */

.inbox-card {
    background: #e6e6e6; /* Matches your previous gray style */
    border-radius: 14px;
    padding: 16px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 14px;
    color: #333;
    position: relative;
}

.status-dot {
    width: 10px;
    height: 10px;
    background: #1f7f82;
    border-radius: 50%;
    position: absolute;
    left: 6px;
    top: 50%;
    transform: translateY(-50%);
}

.company-logo {
    width: 50px;
    height: 50px;
    border-radius: 10px;
    background: #cfdede;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
    margin-right: 15px;
    flex-shrink: 0;
}

.msg-details {
    flex: 1; /* This pushes the meta and actions to the right */
}

.msg-details strong {
    display: block;
    font-size: 16px;
}

.msg-details p {
    font-size: 14px;
    color: #555;
}

.msg-meta {
    text-align: right;
    font-size: 12px;
    color: #777;
    margin-left: 20px;
}

.actions {
    margin-top: 5px;
    font-size: 18px;
}
/* Divider */
.divider {
    height: 1px;
    background: rgba(255,255,255,0.4);
    margin: 15px 0 25px;
}

/* Message Card */
.message-card {
    background: #e6e6e6;
    border-radius: 14px;
    padding: 14px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 14px;
}

.msg-left {
    display: flex;
    align-items: center;
    gap: 12px;
}

.msg-icon {
    width: 50px;
    height: 50px;
    border-radius: 10px;
    background: #cfdede;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
}

.msg-info strong {
    display: block;
}

.msg-info small {
    color: #555;
}

.msg-type {
    color: #333;
}

/* Actions */
.msg-actions {
    display: flex;
    gap: 14px;
    font-size: 18px;
    cursor: pointer;
}

.delete {
    color: red;
}
.footer {
    background: #0f5e61;
    color: white;

    width: 100%;
    padding: 20px 0;

    margin-top: auto;

    position: relative;
    left: 0;
    bottom: 0;
}
</style>
</head>

<body>

<!-- ===== Navbar ===== -->
<div class="navbar">
    <div class="nav-left">
        <i class="fa fa-user"></i>
    </div>

    <div class="nav-links">
        <a href="studentDashboard">Dashboard</a>
        <a href="studentProject">Projects</a>
        <a href="studentJobs">Work and Job</a>
        <a href="studentMessage">Message</a>
        <a href="studentPayments">Payments</a>
        <a href="studentSettings">Settings</a>
    </div>
</div>
<div class="container">
    <div class="header-box">
        <h1>Messages</h1>
        <div class="search-box">
            <input type="text" class="search-input" placeholder="🔍 Search conversations...">
        </div>
    </div>

    <div class="message-card" style="margin-bottom: 20px; align-items: flex-start;">
        <div style="width: 100%;">
            <strong>Send Message To Company</strong>
            <c:if test="${param.status == 'sent'}">
                <p style="color:#0f5e61; margin-top:8px;">Message sent successfully.</p>
            </c:if>
            <c:if test="${param.error == 'missing'}">
                <p style="color:#b30000; margin-top:8px;">Company email and message are required.</p>
            </c:if>
            <c:if test="${param.error == 'company'}">
                <p style="color:#b30000; margin-top:8px;">Company email not found.</p>
            </c:if>

            <form action="${pageContext.request.contextPath}/studentMessage/send" method="post" style="margin-top:10px;">
                <input type="email" name="companyEmail" placeholder="Company email" required
                       style="width:100%; padding:10px; border-radius:8px; border:1px solid #ccc; margin-bottom:10px;">
                <textarea name="messageContent" placeholder="Write your message" required rows="3"
                          style="width:100%; padding:10px; border-radius:8px; border:1px solid #ccc; margin-bottom:10px;"></textarea>
                <button type="submit"
                        style="background:#1f7f82; color:#fff; border:none; padding:10px 16px; border-radius:8px; cursor:pointer;">
                    Send
                </button>
            </form>
        </div>
    </div>

    <div class="divider" style="height:1px; background:rgba(255,255,255,0.2); margin-bottom:20px;"></div>

    <c:forEach var="m" items="${inbox}">
        <div class="inbox-card">
                <%-- Status dot shows if 'isRead' is false --%>
            <c:if test="${not m.read}">
                <div class="status-dot" title="Unread"></div>
            </c:if>

            <div class="company-logo">
                <c:choose>
                    <c:when test="${not empty m.senderEmail}">
                        ${m.senderEmail.substring(0,1).toUpperCase()}
                    </c:when>
                    <c:otherwise>?</c:otherwise>
                </c:choose>
            </div>

            <div class="msg-details">
                <strong>${m.senderEmail}</strong>
                <p>
                    <c:choose>
                        <c:when test="${not empty m.content && m.content.length() > 60}">
                            ${m.content.substring(0,60)}...
                        </c:when>
                        <c:otherwise>
                            ${not empty m.content ? m.content : "No content available."}
                        </c:otherwise>
                    </c:choose>
                </p>
            </div>

            <div class="msg-meta">
                <span style="display:block; margin-bottom: 5px;">${m.timestamp}</span>
                <div class="actions">
                    <i class="fa fa-eye" style="margin-right:10px; cursor:pointer;" title="View Message"></i>

                    <a href="${pageContext.request.contextPath}/deleteMessage/${m.id}"
                       onclick="return confirm('Are you sure you want to delete this message?')"
                       style="color:inherit; text-decoration:none;">
                        <i class="fa fa-trash" title="Delete" style="color:#ff4d4d;"></i>
                    </a>
                </div>
            </div>
        </div>
    </c:forEach>

    <c:if test="${empty inbox}">
        <div style="text-align:center; padding:60px; opacity:0.6;">
            <i class="fa-solid fa-envelope-open-text" style="font-size: 50px; margin-bottom:15px; display:block;"></i>
            <p style="font-size: 18px;">Your inbox is empty.</p>
            <small>New project requirements from companies will appear here.</small>
        </div>
    </c:if>
</div>
<jsp:include page="footer.jsp" />

</body>
</html>
