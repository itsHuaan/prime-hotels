<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 16-Oct-24
  Time: 09:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet" />
    <style>
        .header {
            background-color: #000;
            color: #fff;
            padding: 20px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
        }

        .header a {
            text-decoration: none;
            color: inherit;
        }

        .header h1 {
            margin: 0 20px;
            font-size: 24px;
        }

        .header .login {
            margin: 0 20px;
            border: 1px solid #fff;
            padding: 5px 15px;
            border-radius: 20px;
            text-decoration: none;
            color: #fff;
        }
    </style>
</head>
<body>
<div class="header">
    <a href="HomepageServlet">
        <h1>
            Prime Hotels
        </h1>
    </a>
    <a class="login" href="login.jsp">
        Login
    </a>
</div>
</body>
</html>
