<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Company Login</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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

    .input-error {
      border: 1px solid #d32f2f !important;
      background: #ffebee !important;
    }

    .error-message {
      color: #d32f2f;
      font-size: 12px;
      margin-top: 4px;
      display: none;
    }

    .error-message.show {
      display: block;
    }
  </style>
</head>

<body>
  <div class="title">Company Login</div>

  <div class="login-box">
    <p th:if="${error}" style="color: #ff4d4d; font-size: 13px; margin-bottom: 10px; text-align: center;">
      [[${error}]]
    </p>

    <form action="CompanyLoginForm" method="post" id="companyLoginForm">
      <input type="email" id="compEmail" name="email" placeholder="Email" required />
      <div id="emailError" class="error-message">Please enter a valid email</div>
      
      <input type="password" id="compPassword" name="password" placeholder="Password" required />
      <div id="passwordError" class="error-message">Password is required</div>

      <a href="companyForgotPassword" class="forgot">forgot password?</a>
      <button class="btn" type="submit">Login</button>
    </form>
  </div>
  <div class="graph-line"></div>
  <img class="cup" src="cup.png" alt="cup" />

<script>
$(document).ready(function() {
    $('#compEmail').on('blur', function() {
        var email = $(this).val().trim();
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        
        if (!email || !emailRegex.test(email)) {
            $(this).addClass('input-error');
            $('#emailError').addClass('show');
        } else {
            $(this).removeClass('input-error');
            $('#emailError').removeClass('show');
        }
    });
    
    $('#compPassword').on('blur', function() {
        var value = $(this).val();
        if (!value) {
            $(this).addClass('input-error');
            $('#passwordError').addClass('show');
        } else {
            $(this).removeClass('input-error');
            $('#passwordError').removeClass('show');
        }
    });
    
    $('#companyLoginForm').on('submit', function(e) {
        var email = $('#compEmail').val().trim();
        var password = $('#compPassword').val();
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        var isValid = true;
        
        if (!email || !emailRegex.test(email)) {
            $('#compEmail').addClass('input-error');
            $('#emailError').addClass('show');
            isValid = false;
        }
        
        if (!password) {
            $('#compPassword').addClass('input-error');
            $('#passwordError').addClass('show');
            isValid = false;
        }
        
        if (!isValid) {
            e.preventDefault();
            return false;
        }
    });
});
</script>

</body>
</html>
