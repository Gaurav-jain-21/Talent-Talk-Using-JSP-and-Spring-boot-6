<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Login - Talent Talk</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
      }

      body {
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background: linear-gradient(135deg, #1f7f82, #145e61);
      }

      /* Login Card */
      .login-container {
        background: #ffffff;
        padding: 45px 35px;
        width: 380px;
        border-radius: 18px;
        text-align: center;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        animation: fadeIn 0.6s ease-in-out;
      }

      /* Heading */
      .login-container h1 {
        font-size: 28px;
        margin-bottom: 5px;
        color: #222;
      }

      .login-container h2 {
        font-size: 20px;
        color: #6a00ff;
        margin-bottom: 8px;
      }

      .subtitle {
        font-size: 13px;
        color: #666;
        margin-bottom: 25px;
      }

      /* Inputs */
      .input-group {
        position: relative;
        margin-bottom: 18px;
      }

      input[type="email"],
      input[type="password"] {
        width: 100%;
        padding: 12px 14px;
        border-radius: 10px;
        border: 1px solid #ddd;
        font-size: 14px;
        transition: 0.3s;
      }

      input:focus {
        border-color: #6a00ff;
        box-shadow: 0 0 0 2px rgba(106, 0, 255, 0.1);
        outline: none;
      }

      /* Options row */
      .options {
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-size: 12px;
        margin-bottom: 18px;
      }

      .options a {
        color: #6a00ff;
        text-decoration: none;
        font-weight: 500;
      }

      .options a:hover {
        text-decoration: underline;
      }

      /* Login button */
      .login-btn {
        width: 100%;
        padding: 13px;
        border: none;
        border-radius: 25px;
        background: linear-gradient(90deg, #7b2cff, #4b00ff);
        color: white;
        font-size: 17px;
        font-weight: bold;
        cursor: pointer;
        transition: 0.3s;
      }

      .login-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 18px rgba(75, 0, 255, 0.3);
      }

      /* Divider */
      .divider {
        margin: 25px 0 15px;
        height: 1px;
        background: #e0e0e0;
      }

      /* Signup */
      .signup {
        font-size: 14px;
        color: #444;
      }

      .signup a {
        color: #6a00ff;
        font-weight: 600;
        text-decoration: none;
      }

      .signup a:hover {
        text-decoration: underline;
      }

      /* Animation */
      @keyframes fadeIn {
        from {
          opacity: 0;
          transform: translateY(15px);
        }
        to {
          opacity: 1;
          transform: translateY(0);
        }
      }

      .input-error {
        border-color: #d32f2f !important;
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
    <div class="login-container">
      <h1>Login</h1>
      <h2>Talent Talk</h2>
      <p class="subtitle">Welcome back! Please enter your details</p>

      <form action="studentLoginForm" method="post" id="studentLoginForm">
        <div class="input-group">
          <input
            type="email"
            id="email"
            name="email"
            placeholder="Enter your email address"
            required
          />
          <div id="emailError" class="error-message">
            Please enter a valid email
          </div>
        </div>

        <div class="input-group">
          <input
            type="password"
            id="password"
            name="password"
            placeholder="Enter your password"
            required
          />
          <div id="passwordError" class="error-message">
            Password is required
          </div>
        </div>

        <div class="options">
          <label> <input type="checkbox" name="remember" /> Remember me </label>
          <a href="forgotPassword">Forgot password?</a>
        </div>

        <button type="submit" class="login-btn">Login</button>
      </form>

      <div class="divider"></div>

      <p class="signup">
        Don’t have an account? <a href="studentSignup">Sign up for free</a>
      </p>
    </div>
    <script>
      $(document).ready(function () {
        $("#email").on("blur", function () {
          var email = $(this).val().trim();
          var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

          if (!email || !emailRegex.test(email)) {
            $(this).addClass("input-error");
            $("#emailError").addClass("show");
          } else {
            $(this).removeClass("input-error");
            $("#emailError").removeClass("show");
          }
        });

        $("#password").on("blur", function () {
          var value = $(this).val();
          if (!value) {
            $(this).addClass("input-error");
            $("#passwordError").addClass("show");
          } else {
            $(this).removeClass("input-error");
            $("#passwordError").removeClass("show");
          }
        });

        $("#studentLoginForm").on("submit", function (e) {
          var email = $("#email").val().trim();
          var password = $("#password").val();
          var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
          var isValid = true;

          if (!email || !emailRegex.test(email)) {
            $("#email").addClass("input-error");
            $("#emailError").addClass("show");
            isValid = false;
          }

          if (!password) {
            $("#password").addClass("input-error");
            $("#passwordError").addClass("show");
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
