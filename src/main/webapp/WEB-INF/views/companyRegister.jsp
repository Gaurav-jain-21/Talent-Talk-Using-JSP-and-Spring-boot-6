<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Create Company Account | Talent Talk</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif; }
    body { height: 100vh; display: flex; background: #f5f5f5; }
    .left { flex: 1; background: #2f9aa3; color: white; display: flex; flex-direction: column; justify-content: center; padding: 80px; }
    .left h1 { font-size: 42px; line-height: 1.2; margin-bottom: 20px; }
    .left p { font-size: 18px; max-width: 400px; opacity: 0.95; }
    .right { flex: 1; display: flex; justify-content: center; align-items: center; padding: 40px; overflow-y: auto; }
    .form-container { width: 100%; max-width: 420px; background: white; padding: 30px; border-radius: 16px; box-shadow: 0 4px 20px rgba(0,0,0,0.08); }
    .form-container h2 { font-size: 28px; margin-bottom: 8px; color: #333; }
    .subtitle { color: #666; margin-bottom: 24px; font-size: 14px; }
    label { font-size: 13px; font-weight: 600; margin-bottom: 6px; display: block; color: #444; }
    input, select { width: 100%; padding: 12px; margin-bottom: 4px; border-radius: 8px; border: 1px solid #ddd; font-size: 14px; outline: none; }
    input:focus, select:focus { border-color: #1f3ac6; }
    .row { display: flex; gap: 12px; margin-top: 12px; }
    .row > div { flex: 1; }
    .btn { width: 100%; padding: 14px; border: none; border-radius: 10px; background: #1f3ac6; color: white; font-size: 16px; font-weight: 600; cursor: pointer; margin-top: 20px; transition: 0.3s; }
    .btn:hover { background: #15288a; }
    .error-message { color: #d32f2f; font-size: 11px; height: 15px; margin-bottom: 8px; }
    .input-error { border-color: #d32f2f !important; }
    .success-check { color: #2e7d32; font-size: 11px; }
    .login { text-align: center; margin-top: 20px; font-size: 13px; color: #666; }
    .login a { color: #1f3ac6; text-decoration: none; font-weight: bold; }
    @media (max-width: 900px) { body { flex-direction: column; } .left { padding: 40px; text-align: center; } .left p { margin: 0 auto; } }
  </style>
</head>
<body>
<div class="left">
  <h1>Scale your<br />business with<br />confidence</h1>
  <p>Join over 10,000 enterprises worldwide using Talent Talk to streamline hiring and drive growth.</p>
</div>

<div class="right">
  <div class="form-container">
    <h2>Company Sign Up</h2>
    <p class="subtitle">Enter your details to create a corporate account.</p>

    <% if (request.getAttribute("error") != null) { %>
    <div style="background: #ffebee; padding: 10px; border-radius: 8px; margin-bottom: 15px; color: #d32f2f; font-size: 13px; border: 1px solid #ffcdd2;">
      <i class="fas fa-exclamation-circle"></i> <%= request.getAttribute("error") %>
    </div>
    <% } %>

    <form action="companyRegisterForm" method="post" id="companyRegisterForm">
      <label>Company Name</label>
      <input type="text" placeholder="e.g. Tech Solutions Inc" name="name" id="companyName" required />
      <div id="companyNameError" class="error-message"></div>

      <label>Work Email Address</label>
      <input type="email" placeholder="email@company.com" name="email" id="companyEmail" required />
      <div id="emailError" class="error-message"></div>
      <div id="emailSuccess" class="success-check"></div>

      <label>Create Password</label>
      <input type="password" placeholder="Min 6 characters" name="password" id="companyPassword" required />
      <div id="passwordError" class="error-message"></div>

      <div class="row">
        <div>
          <label>Industry</label>
          <select name="category" id="industry" required>
            <option value="" disabled selected>Select industry</option>
            <option value="IT">IT & Software</option>
            <option value="Mechanical">Mechanical</option>
            <option value="Finance">Finance</option>
            <option value="Content Writing">Content Writing</option>
          </select>
          <div id="industryError" class="error-message"></div>
        </div>
        <div>
          <label>Headquarters</label>
          <input type="text" placeholder="City, Country" name="headQuarter" id="headquarters" required />
          <div id="headquartersError" class="error-message"></div>
        </div>
      </div>

      <button type="submit" class="btn">Create Account</button>
    </form>

    <p style="font-size: 11px; color: #888; margin-top: 15px; text-align: center;">
      By clicking "Create Account", you agree to our Terms of Service and Privacy Policy.
    </p>

    <div class="login">
      Already have a company account? <a href="companyLogin">Log in</a>
    </div>
  </div>
</div>

<script>
  $(document).ready(function() {
    var emailValid = false;

    // Generic function to handle errors
    function setError(id, msg, inputId) {
      $(id).text(msg);
      if(msg) $(inputId).addClass('input-error');
      else $(inputId).removeClass('input-error');
    }

    $('#companyName').on('blur', function() {
      var val = $(this).val().trim();
      setError('#companyNameError', val ? '' : 'Company name is required', '#companyName');
    });

    $('#companyEmail').on('blur', function() {
      var email = $(this).val().trim();
      var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

      setError('#emailError', '', '#companyEmail');
      $('#emailSuccess').text('');

      if (!email) {
        setError('#emailError', 'Email is required', '#companyEmail');
        emailValid = false; return;
      }
      if (!emailRegex.test(email)) {
        setError('#emailError', 'Invalid email format', '#companyEmail');
        emailValid = false; return;
      }

      $.get('checkCompanyEmail', { email: email }, function(exists) {
        if (exists) {
          setError('#emailError', 'Email already registered', '#companyEmail');
          emailValid = false;
        } else {
          $('#emailSuccess').text('✓ Email available');
          emailValid = true;
        }
      });
    });

    $('#companyPassword').on('blur', function() {
      var val = $(this).val();
      if (!val) setError('#passwordError', 'Password is required', '#companyPassword');
      else if (val.length < 6) setError('#passwordError', 'Min 6 characters required', '#companyPassword');
      else setError('#passwordError', '', '#companyPassword');
    });

    $('#companyRegisterForm').on('submit', function(e) {
      // Trigger all blurs to check fields
      $('#companyName, #companyPassword, #headquarters').blur();

      if (!$('#companyName').val() || !emailValid || $('#companyPassword').val().length < 6 || !$('#industry').val() || !$('#headquarters').val()) {
        e.preventDefault();
        alert("Please correct the errors before submitting.");
        return false;
      }
    });
  });
</script>
</body>
</html>