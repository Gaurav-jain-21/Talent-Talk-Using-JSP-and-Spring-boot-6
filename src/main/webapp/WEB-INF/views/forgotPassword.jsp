<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Forget Password</title>

    <style>
        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family: 'Segoe UI', sans-serif;
        }

        body{
            height:100vh;
            background: linear-gradient(135deg, #1fa2a6, #2c7da0);
            display:flex;
            justify-content:center;
            align-items:center;
            position:relative;
            overflow:hidden;
        }

        /* Center Content */
        .container{
            text-align:center;
            z-index:2;
        }

        h1{
            font-size:42px;
            font-weight:bold;
            color:#111;
            margin-bottom:40px;
        }

        .form-box{
            display:flex;
            flex-direction:column;
            align-items:center;
        }

        .message{
            width:420px;
            padding:12px 14px;
            margin-bottom:16px;
            border-radius:10px;
            font-size:14px;
            text-align:left;
        }

        .message.success{
            background:#e7f8ec;
            color:#1f7a35;
        }

        .message.error{
            background:#fde8e8;
            color:#b42318;
        }

        input[type="email"]{
            width:420px;
            padding:14px;
            border:none;
            border-radius:10px;
            margin-bottom:20px;
            font-size:15px;
            background:#eaeaea;
        }

        input[type="submit"]{
            width:420px;
            padding:14px;
            border:none;
            border-radius:10px;
            background: linear-gradient(to right, #1e3cfa, #1b2cc1);
            color:white;
            font-size:15px;
            cursor:pointer;
            transition:0.3s ease;
        }

        input[type="submit"]:hover{
            transform:scale(1.03);
            opacity:0.95;
        }

        /* Graph Line (Background Image) */
        .graph{
            position:absolute;
            width:100%;
            height:100%;
            background:url('images/graph.png') no-repeat center;
            background-size:contain;
            opacity:0.4;
            z-index:1;
        }

        /* Coffee Cup Image */
        .cup{
            position:absolute;
            bottom:0;
            right:80px;
            width:300px;
        }

    </style>
</head>

<body>

<div class="graph"></div>

<div class="container">
    <h1>Forget Password</h1>

    <form class="form-box" action="${pageContext.request.contextPath}/forgotPassword" method="post" >
        <c:if test="${not empty successMsg}">
            <div class="message success">${successMsg}</div>
        </c:if>
        <c:if test="${not empty errorMsg}">
            <div class="message error">${errorMsg}</div>
        </c:if>
        <input type="email" name="email" placeholder="Email" required>
        <input type="submit" value="Send to email">
    </form>
</div>

<!-- Coffee Cup Image -->
<img src="images/cup.png" class="cup">

</body>
</html>