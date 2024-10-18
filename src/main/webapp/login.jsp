<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 16-Oct-24
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <title>Prime Hotels</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body,
        html {
            margin-top: 90px;
            padding: 0;
            width: 100%;
            height: 100%;
            font-family: Arial, sans-serif;
            background: url('https://picsum.photos/1920/1080') no-repeat center center fixed;
            background-size: cover;
        }

        .header {
            background-color: #000;
            color: #fff;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header .title {
            font-size: 20px;
        }

        .header .login-btn {
            border: 1px solid #fff;
            padding: 5px 15px;
            border-radius: 20px;
            background: none;
            color: #fff;
            cursor: pointer;
        }

        .container {
            display: flex;
            justify-content: flex-start;
            align-items: center;
            height: calc(100% - 50px);
            flex-direction: column;
        }

        .container h1 {
            color: #fff;
            font-size: 3rem;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
        }

        .login-box {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            text-align: center;
            width: 30%;
            height: auto;
            padding: 70px 40px;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
        }

        .login-box h1 {
            margin-bottom: 20px;
            font-size: 24px;
        }

        .tabs {
            display: flex;
            margin-bottom: 20px;
        }

        .tabs div {
            flex: 1;
            padding: 15px;
            cursor: pointer;
        }

        .tabs .login {
            border: 1px solid #000;
            border-radius: 20px 0 0 20px;
        }

        .tabs .signup {
            border: 1px solid #000;
            border-radius: 0 20px 20px 0;
        }

        .active {
            background: #000;
            color: #fff;
            /* Ensure text color is white when active */
        }

        .input-group {
            margin-bottom: 15px;
        }

        .input-group input {
            width: 100%;
            padding: 15px;
            border: 1px solid #ccc;
            border-radius: 20px;
            box-sizing: border-box;
        }

        .login-btn {
            background: #000;
            color: #fff;
            padding: 15px;
            border: none;
            border-radius: 20px;
            width: 100%;
            cursor: pointer;
        }

        .signup-link {
            margin-top: 10px;
            font-size: 14px;
        }

        .signup-link a {
            color: #000;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</head>

<body>
<div class="container">
    <h1>Welcome to Prime Hotels</h1>
    <div class="login-box">
        <div class="tabs">
            <div class="login active" onclick="toggleTab('login')">Login</div>
            <div class="signup" onclick="toggleTab('signup')">Sign Up</div>
        </div>
        <div id="loginForm">
            <div class="input-group">
                <input type="text" placeholder="Email">
            </div>
            <div class="input-group">
                <input type="password" placeholder="Password">
            </div>
            <button class="login-btn" onclick="location.href='dashboard.jsp'">Let's Go</button>
            <div class="signup-link">
                Don't have an account? <a href="#" onclick="toggleTab('signup')">Sign Up</a>
            </div>
        </div>
        <div id="signupForm" style="display: none;">
            <div class="input-group">
                <input type="text" placeholder="Username">
            </div>
            <div class="input-group">
                <input type="text" placeholder="Email">
            </div>
            <div class="input-group">
                <input type="password" placeholder="Password">
            </div>
            <div class="input-group">
                <input type="password" placeholder="Confirm Password">
            </div>
            <form action="HotelManagementServlet">
                <button class="login-btn" type="submit">Create Account</button>
            </form>
            <div class="signup-link">
                Already have an account? <a href="#" onclick="toggleTab('login')">Login</a>
            </div>
        </div>
    </div>
</div>

<script>
    function toggleTab(tab) {
        const loginTab = document.querySelector('.login');
        const signupTab = document.querySelector('.signup');
        const loginForm = document.getElementById('loginForm');
        const signupForm = document.getElementById('signupForm');

        if (tab === 'login') {
            loginTab.classList.add('active');
            signupTab.classList.remove('active');
            loginForm.style.display = 'block';
            signupForm.style.display = 'none';
        } else {
            loginTab.classList.remove('active');
            signupTab.classList.add('active');
            loginForm.style.display = 'none';
            signupForm.style.display = 'block';
        }
    }
</script>
</body>

</html>
