<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Company Login</title>

  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: Arial, Helvetica, sans-serif;
    }

    body {
      height: 100vh;
      background: radial-gradient(circle at center, #3aa7b0, #0f6f78);
      display: flex;
      align-items: center;
      justify-content: center;
      position: relative;
      overflow: hidden;
    }

    .title {
      position: absolute;
      top: 80px;
      font-size: 36px;
      font-weight: bold;
      color: #111;
    }

    .login-box {
      width: 380px;
      padding: 30px 28px 35px;
      border: 1px solid rgba(0, 0, 0, 0.5);
      background: rgba(255, 255, 255, 0.08);
      backdrop-filter: blur(6px);
    }

    .login-box input {
      width: 100%;
      padding: 14px 16px;
      margin-bottom: 18px;
      border-radius: 10px;
      border: none;
      background: #e9e9e9;
      font-size: 14px;
    }

    .forgot {
      font-size: 12px;
      color: #1f3ac6;
      text-align: right;
      margin-top: -10px;
      margin-bottom: 16px;
      display: block;
      text-decoration: none;
    }

    .btn {
      width: 100%;
      padding: 14px;
      border: none;
      border-radius: 12px;
      background: #1f3ac6;
      color: white;
      font-size: 16px;
      cursor: pointer;
    }

    .graph-line {
      position: absolute;
      width: 500px;
      height: 300px;
      border-left: 2px solid rgba(255,255,255,0.7);
      border-bottom: 2px solid rgba(255,255,255,0.7);
      transform: rotate(-25deg);
      left: 120px;
      bottom: 120px;
      opacity: 0.5;
    }

    .cup {
      position: absolute;
      right: 40px;
      bottom: 0;
      width: 260px;
      opacity: 0.95;
    }

    @media (max-width: 600px) {
      .title {
        top: 40px;
        font-size: 28px;
      }

      .login-box {
        width: 90%;
      }

      .cup {
        display: none;
      }
    }
  </style>
</head>

<body>
  <div class="title">Company Login</div>

  <div class="login-box">
    <!-- ONLY IMPORTANT FIX IS HERE -->
    <form action="${pageContext.request.contextPath}/CompanyLogin" method="post">
      <input type="email" name="email" placeholder="Email" required />
      <input type="password" name="password" placeholder="Password" required />
      <a href="companyForgetPassword.jsp" class="forgot">forgot password?</a>
      <button class="btn" type="submit">Login</button>
    </form>
  </div>

  <div class="graph-line"></div>
  <img class="cup" src="cup.png" alt="cup" />
</body>
</html>
