<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Create Account</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: Arial, Helvetica, sans-serif;
    }

    body {
      height: 100vh;
      display: flex;
    }

    .left {
      flex: 1;
      background: #2f9aa3;
      color: white;
      display: flex;
      flex-direction: column;
      justify-content: center;
      padding: 80px;
    }

    .left h1 {
      font-size: 42px;
      line-height: 1.2;
      margin-bottom: 20px;
    }

    .left p {
      font-size: 18px;
      max-width: 400px;
      opacity: 0.95;
    }

    .right {
      flex: 1;
      background: #f5f5f5;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 40px;
    }

    .form-container {
      width: 100%;
      max-width: 420px;
    }

    .form-container h2 {
      font-size: 32px;
      margin-bottom: 8px;
    }

    .form-container .subtitle {
      color: #666;
      margin-bottom: 28px;
    }

    label {
      font-size: 14px;
      margin-bottom: 6px;
      display: block;
    }

    input, select {
      width: 100%;
      padding: 12px 14px;
      margin-bottom: 16px;
      border-radius: 10px;
      border: 1px solid #ddd;
      font-size: 14px;
    }

    .row {
      display: flex;
      gap: 12px;
    }

    .row > div {
      flex: 1;
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
      margin-top: 10px;
    }

    .terms {
      font-size: 12px;
      color: #666;
      margin-top: 12px;
      line-height: 1.4;
    }

    .login {
      text-align: center;
      margin-top: 30px;
      font-size: 14px;
    }

    .login a {
      color: #1f3ac6;
      text-decoration: none;
      font-weight: bold;
    }

    @media (max-width: 900px) {
      body {
        flex-direction: column;
      }

      .left {
        padding: 40px;
        text-align: center;
      }

      .left p {
        margin: 0 auto;
      }
    }
  </style>
</head>
<body>
  <div class="left">
    <h1>Scale your<br />business with<br />confidence</h1>
    <p>
      Join over 10,000 enterprises worldwide using our platform to streamline
      operations and drive B2B growth.
    </p>
  </div>

  <div class="right">
    <div class="form-container">
      <h2>Create Account</h2>
      <p class="subtitle">Let's get your business set up for success.</p>

      <label>Company Legal Name</label>
      <input type="text" placeholder="Company Name" />

      <label>Work Email Address</label>
      <input type="email" placeholder="Company Email" />

      <label>Create Password</label>
      <input type="password" placeholder="Create Password" />

      <div class="row">
        <div>
          <label>Industry</label>
          <select>
            <option>Select industry</option>
          </select>
        </div>

        <div>
          <label>Headquarters</label>
          <input type="text" placeholder="Search city..." />
        </div>
      </div>

      <button class="btn">Create Account</button>

      <p class="terms">
        By clicking “Create Account”, you agree to our Terms of Service and
        Privacy Policy.
      </p>

      <div class="login">
        Already have a company account? <a href="companyLogin">Log in</a>
      </div>
    </div>
  </div>
</body>
</html>