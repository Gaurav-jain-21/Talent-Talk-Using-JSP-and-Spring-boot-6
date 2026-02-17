<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Arial, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .login-container {
            width: 100%;
            max-width: 400px;
        }
        
        .login-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            padding: 40px;
            position: relative;
            overflow: hidden;
        }
        
        .login-header {
            text-align: center;
            margin-bottom: 40px;
        }
        
        .login-header h1 {
            color: #333;
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 10px;
        }
        
        .login-header p {
            color: #666;
            font-size: 16px;
        }
        
        .form-group {
            margin-bottom: 25px;
        }
        
        .form-group label {
            display: block;
            color: #555;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 8px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .form-group input {
            width: 100%;
            padding: 15px;
            border: 2px solid #e1e5e9;
            border-radius: 10px;
            font-size: 16px;
            transition: all 0.3s ease;
            background: #f8f9fa;
        }
        
        .form-group input:focus {
            outline: none;
            border-color: #667eea;
            background: white;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }
        
        .form-group input::placeholder {
            color: #aaa;
        }
        
        .login-btn {
            width: 100%;
            padding: 16px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-top: 10px;
        }
        
        .login-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);
        }
        
        .login-btn:active {
            transform: translateY(0);
        }
        
        .error-message {
            background: #fee;
            color: #c33;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 20px;
            text-align: center;
            font-size: 14px;
            border: 1px solid #fcc;
            display: none;
        }
        
        .error-message.show {
            display: block;
        }
        
        .decoration {
            position: absolute;
            top: 0;
            right: 0;
            width: 100px;
            height: 100px;
            background: linear-gradient(45deg, #667eea, #764ba2);
            border-radius: 0 20px 0 100px;
        }
        
        .footer-text {
            text-align: center;
            margin-top: 25px;
            color: #666;
            font-size: 14px;
        }
        
        @media (max-width: 480px) {
            .login-card {
                padding: 30px 25px;
            }
            
            .login-header h1 {
                font-size: 28px;
            }
        }
    </style>
</head>
<body>

<div class="login-container">
    <div class="login-card">
        <div class="decoration"></div>
        
        <div class="login-header">
            <h1>Admin Login</h1>
            <p>Enter your credentials to access the dashboard</p>
        </div>
        
        <c:if test="${not empty error}">
    <div class="error-message show">
        ${error}
    </div>
</c:if>

        
        <form action="adminLogin" method="post" id="loginForm">
            <div class="form-group">
                <label for="AdminEmail">Email</label>
                <input type="email" id="AdminEmail" name="AdminEmail" 
                       placeholder="admin@example.com" required>
            </div>
            
            <div class="form-group">
                <label for="Adminpwd">Password</label>
                <input type="password" id="Adminpwd" name="Adminpwd" 
                       placeholder="Enter your password" required>
            </div>
            
            <button type="submit" class="login-btn">Login</button>
        </form>
        
        <div class="footer-text">
            Secure Admin Access
        </div>
    </div>
</div>

<script>
    // JavaScript for form validation and error handling
    document.getElementById('loginForm').addEventListener('submit', function(e) {
        const email = document.getElementById('AdminEmail').value;
        const password = document.getElementById('Adminpwd').value;
        const errorMessage = document.getElementById('errorMessage');
        
        // Basic client-side validation
        if (!email || !password) {
            e.preventDefault();
            errorMessage.textContent = 'Please fill in all fields';
            errorMessage.classList.add('show');
            return false;
        }
        
        // Email format validation
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            e.preventDefault();
            errorMessage.textContent = 'Please enter a valid email address';
            errorMessage.classList.add('show');
            return false;
        }
        
        // Hide error message if validation passes
        errorMessage.classList.remove('show');
        return true;
    });
    
    // Hide error message when user starts typing
    const inputs = document.querySelectorAll('input');
    inputs.forEach(input => {
        input.addEventListener('input', function() {
            document.getElementById('errorMessage').classList.remove('show');
        });
    });
</script>

</body>
</html>