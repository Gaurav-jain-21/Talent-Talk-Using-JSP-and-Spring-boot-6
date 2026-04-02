<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Reset Password</title>

    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Segoe UI", sans-serif;
      }

      body {
        height: 100vh;
        background: linear-gradient(135deg, #1fa2a6, #2c7da0);
        display: flex;
        justify-content: center;
        align-items: center;
        overflow: hidden;
      }

      .container {
        position: relative;
        z-index: 2;
        text-align: center;
      }

      h1 {
        font-size: 42px;
        font-weight: bold;
        color: #111;
        margin-bottom: 30px;
      }

      .form-box {
        display: flex;
        flex-direction: column;
        align-items: center;
      }

      input[type="password"],
      input[type="submit"] {
        width: 420px;
        padding: 14px;
        border: none;
        border-radius: 10px;
        font-size: 15px;
      }

      input[type="password"] {
        margin-bottom: 20px;
        background: #eaeaea;
      }

      input[type="submit"] {
        background: linear-gradient(to right, #1e3cfa, #1b2cc1);
        color: white;
        cursor: pointer;
        transition: 0.3s ease;
      }

      input[type="submit"]:hover {
        transform: scale(1.03);
        opacity: 0.95;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <h1>Reset Password</h1>

      <form
        class="form-box"
        action="${pageContext.request.contextPath}/resetPassword"
        method="post"
      >
        <input type="hidden" name="token" value="${token}" />
        <input
          type="password"
          name="password"
          placeholder="New Password"
          required
        />
        <input type="submit" value="Update Password" />
      </form>
    </div>
  </body>
</html>
