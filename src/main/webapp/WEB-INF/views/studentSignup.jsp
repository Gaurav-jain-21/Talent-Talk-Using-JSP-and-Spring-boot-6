<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register - Talent Talk</title>

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

/* Card */
.container {
    background: #ffffff;
    padding: 35px;
    width: 760px;
    border-radius: 18px;
    box-shadow: 0 12px 35px rgba(0,0,0,0.25);
    animation: fadeIn 0.5s ease-in-out;
}

/* Title */
h1 {
    text-align: center;
    margin-bottom: 25px;
    color: #222;
}

/* Grid layout */
.form-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 25px;
}

/* Inputs */
input, select, textarea {
    width: 100%;
    padding: 12px 14px;
    border-radius: 12px;
    border: 1px solid #ddd;
    margin-top: 10px;
    font-size: 14px;
    transition: 0.3s;
}

input:focus, select:focus, textarea:focus {
    border-color: #6a00ff;
    box-shadow: 0 0 0 2px rgba(106,0,255,0.1);
    outline: none;
}

/* Address */
textarea {
    height: 90px;
    resize: none;
    margin-top: 20px;
}

/* Purpose cards */
.purpose {
    display: flex;
    gap: 15px;
    margin-bottom: 15px;
}

.purpose div {
    flex: 1;
    background: #f3f3f3;
    padding: 22px;
    border-radius: 14px;
    text-align: center;
    cursor: pointer;
    font-weight: 600;
    transition: 0.3s;
}

.purpose div:hover {
    background: #ece6ff;
    color: #4b00ff;
    transform: translateY(-2px);
}

/* Register button */
.register-btn {
    float: right;
    padding: 13px 36px;
    border: none;
    border-radius: 25px;
    background: linear-gradient(90deg, #7b2cff, #4b00ff);
    color: white;
    font-size: 17px;
    font-weight: bold;
    cursor: pointer;
    transition: 0.3s;
}

.register-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 22px rgba(75,0,255,0.35);
}

/* Login link */
.login-link {
    text-align: right;
    margin-top: 18px;
    font-size: 14px;
}

.login-link a {
    color: #6a00ff;
    font-weight: 600;
    text-decoration: none;
}

.login-link a:hover {
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
</style>

</head>

<body>

<div class="container">
    <h1>Create Your Account</h1>

    <form action="studentRegister" method="post">

        <div class="form-grid">

            <!-- Left -->
            <div>
                <input type="text" name="firstName" placeholder="First Name" required>
                <input type="text" name="lastName" placeholder="Last Name" required>
                <input type="email" name="email" placeholder="Email Address" required>
                <input type="password" name="password" placeholder="Password" required>
                <input type="password" name="confirmPassword" placeholder="Confirm Password" required>
            </div>

            <!-- Right -->
            <div>
                <div class="purpose">
                    <div>Earn Money</div>
                    <div>Education Purpose</div>
                </div>

                <select name="profession" required>
                    <option value="">Choose Profession</option>
                    <option>Student</option>
                    <option>Teacher</option>
                    <option>Freelancer</option>
                </select>
            </div>
        </div>

        <textarea name="address" placeholder="Full Address"></textarea>

        <br><br>

        <button type="submit" class="register-btn">Register</button>

        <div class="login-link">
            Already have an account? <a href="studentLogin">Login</a>
        </div>

    </form>
</div>

</body>
</html>
