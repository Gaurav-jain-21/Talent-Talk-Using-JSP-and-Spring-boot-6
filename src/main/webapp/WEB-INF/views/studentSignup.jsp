<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register - Talent Talk</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #1f7f82, #145e61);
        }

        .container {
            background: #ffffff;
            padding: 35px;
            width: 760px;
            border-radius: 18px;
            box-shadow: 0 12px 35px rgba(0,0,0,0.25);
            animation: fadeIn 0.5s ease-in-out;
        }

        h1 { text-align: center; margin-bottom: 25px; color: #222; }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        input, select, textarea {
            width: 100%;
            padding: 12px 14px;
            border-radius: 12px;
            border: 1px solid #ddd;
            margin-top: 8px;
            font-size: 14px;
            transition: 0.3s;
        }

        input:focus, select:focus, textarea:focus {
            border-color: #6a00ff;
            outline: none;
        }

        textarea { height: 80px; resize: none; margin-top: 15px; }

        .purpose { display: flex; gap: 10px; margin-top: 8px; }
        .purpose-opt {
            flex: 1;
            background: #f3f3f3;
            padding: 15px;
            border-radius: 10px;
            text-align: center;
            cursor: pointer;
            font-size: 13px;
            font-weight: 600;
            transition: 0.3s;
        }
        .purpose-opt:hover { background: #ece6ff; color: #4b00ff; }

        .register-btn {
            float: right;
            padding: 13px 36px;
            border: none;
            border-radius: 25px;
            background: linear-gradient(90deg, #7b2cff, #4b00ff);
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 20px;
        }

        .login-link { text-align: left; margin-top: 25px; font-size: 14px; clear: both; }
        .login-link a { color: #6a00ff; font-weight: 600; text-decoration: none; }

        .error-message { color: #d32f2f; font-size: 11px; margin-top: 2px; min-height: 14px; }
        .input-error { border-color: #d32f2f !important; }
        .success-check { color: #2e7d32; font-size: 11px; }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Create Your Account</h1>

    <% if (request.getAttribute("error") != null) { %>
    <div style="background: #ffebee; padding: 10px; border-radius: 8px; margin-bottom: 15px; color: #d32f2f; font-size: 13px; border: 1px solid #ffcdd2;">
        <%= request.getAttribute("error") %>
    </div>
    <% } %>

    <form action="studentRegister" method="post" id="studentSignupForm">
        <div class="form-grid">
            <div>
                <input type="text" name="firstName" id="firstName" placeholder="First Name" required>
                <div id="firstNameError" class="error-message"></div>

                <input type="text" name="lastName" id="lastName" placeholder="Last Name" required>
                <div id="lastNameError" class="error-message"></div>

                <input type="email" name="email" id="email" placeholder="Email Address" required>
                <div id="emailError" class="error-message"></div>
                <div id="emailSuccess" class="success-check"></div>
            </div>

            <div>
                <input type="password" name="password" id="password" placeholder="Password" required>
                <div id="passwordError" class="error-message"></div>

                <input type="password" name="confirmPassword" id="confirmPassword" placeholder="Confirm Password" required>
                <div id="confirmPasswordError" class="error-message"></div>

                <label style="font-size: 12px; color: #666; margin-left: 5px;">Join Purpose</label>
                <div class="purpose">
                    <div class="purpose-opt">Earn Money</div>
                    <div class="purpose-opt">Education</div>
                </div>
            </div>
        </div>

        <div class="form-grid" style="margin-top: 10px;">
            <div>
                <select name="profession" id="profession" required>
                    <option value="">Choose Profession</option>
                    <option value="Student">Student</option>
                    <option value="Teacher">Teacher</option>
                    <option value="Freelancer">Freelancer</option>
                </select>
                <div id="professionError" class="error-message"></div>
            </div>
            <div>
                <textarea name="address" placeholder="Full Address"></textarea>
            </div>
        </div>

        <button type="submit" class="register-btn">Register</button>

        <div class="login-link">
            Already have an account? <a href="studentLogin">Login</a>
        </div>
    </form>
</div>

<script>
    $(document).ready(function() {
        var emailValid = false;

        $('#email').on('blur', function() {
            var email = $(this).val().trim();
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            $('#emailError, #emailSuccess').text('');
            $(this).removeClass('input-error');

            if (!email) {
                $('#emailError').text('Email is required');
                $(this).addClass('input-error');
                emailValid = false; return;
            }
            if (!emailRegex.test(email)) {
                $('#emailError').text('Invalid email format');
                $(this).addClass('input-error');
                emailValid = false; return;
            }

            $.get('checkStudentEmail', { email: email }, function(exists) {
                if (exists) {
                    $('#emailError').text('Email already registered');
                    $('#email').addClass('input-error');
                    emailValid = false;
                } else {
                    $('#emailSuccess').text('✓ Email available');
                    emailValid = true;
                }
            });
        });

        $('#studentSignupForm').on('submit', function(e) {
            var pass = $('#password').val();
            var cPass = $('#confirmPassword').val();
            var isValid = true;

            if (!emailValid) {
                $('#email').addClass('input-error');
                isValid = false;
            }
            if (pass.length < 6) {
                $('#passwordError').text('Min 6 characters');
                isValid = false;
            }
            if (pass !== cPass) {
                $('#confirmPasswordError').text('Passwords do not match');
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