<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Talent Talk | Choose Role</title>

<!-- Google Font (optional) -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">

<style>
    body {
        margin: 0;
        font-family: 'Poppins', sans-serif;
        background: #0a3d62;
    }

    .container {
        display: flex;
        height: 100vh;
    }

    /* LEFT SECTION */
    .left {
        width: 65%;
        background: linear-gradient(135deg, #1abc9c, #16a085);
        display: flex;
        flex-direction: column;
        justify-content: center;
        padding-left: 80px;
        color: white;
    }

    .left h1 {
        font-size: 40px;
        margin-bottom: 20px;
    }

    .graph {
        margin-top: 30px;
        width: 300px;
        height: 150px;
        border-left: 2px solid white;
        border-bottom: 2px solid white;
        position: relative;
    }

    .line {
        position: absolute;
        width: 100%;
        height: 100%;
        background: url('images/graph-line.png') no-repeat center;
        background-size: contain;
    }

    /* RIGHT SECTION */
    .right {
        width: 35%;
        background: #0b2f4a;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        gap: 25px;
    }

    .role-card {
        width: 260px;
        height: 140px;
        background: linear-gradient(135deg, #d7d2cc, #304352);
        border-radius: 15px;
        display: flex;
        flex-direction: column;
        justify-content: flex-end;
        align-items: center;
        padding-bottom: 15px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.3);
    }

    .role-btn {
        background: #3f2b96;
        color: white;
        border: none;
        padding: 10px 30px;
        border-radius: 20px;
        cursor: pointer;
        font-size: 14px;
        transition: 0.3s;
    }

    .role-btn:hover {
        background: #5f27cd;
    }
</style>
</head>

<body>

<div class="container">

    <!-- LEFT SIDE -->
    <div class="left">
        <h1>Choice your Roll</h1>
        <div class="graph">
            <div class="line"></div>
        </div>
    </div>

    <!-- RIGHT SIDE -->
    <div class="right">

        <form action="studentLogin.jsp">
            <div class="role-card">
                <button class="role-btn">Student</button>
            </div>
        </form>

        <form action="companyRegister.jsp">
            <div class="role-card">
                <button class="role-btn">Company</button>
            </div>
        </form>

        <form action="adminLogin" method="get">
            <div class="role-card">
                <button class="role-btn">Admin</button>
            </div>
        </form>

    </div>

</div>

</body>
</html>