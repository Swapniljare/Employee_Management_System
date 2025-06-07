<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // If user already logged in, redirect to dashboard
    String username = (String) session.getAttribute("username");
    if (username != null) {
        response.sendRedirect("dashboard.jsp");
        return;
    }
    
    if (session.getAttribute("username") != null) {
        response.sendRedirect("dashboard.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Employee Management System</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url('https://images.unsplash.com/photo-1681366099753-f904192f17bb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGxvZ2luJTIwcGFnZSUyMGltYWdlJTIwZm9yJTIwZW1wbG95ZWUlMjBtYW5hZ2VtZW50fGVufDB8fDB8fHww');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: #fff;
        }

        .login-container {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 40px;
            max-width: 400px;
            margin: 100px auto;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0,0,0,0.5);
        }

        .login-container h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0 20px 0;
            border: none;
            border-radius: 8px;
            background: #f1f1f1;
            color: #333;
        }

        .login-container input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .login-container input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .error {
            color: red;
            text-align: center;
            margin-top: 10px;
        }

        .footer {
            text-align: center;
            margin-top: 30px;
            color: #ddd;
            font-size: 13px;
        }
    </style>
</head>
<body>

<div class="login-container">
    <h2>Employee Login</h2>
    <form action="LoginServlet" method="post">
        <input type="text" name="username" placeholder="Enter Username" required />
        <input type="password" name="password" placeholder="Enter Password" required />
        <input type="submit" value="Login" />
    </form>

    <% if (request.getParameter("error") != null) { %>
        <div class="error">Invalid username or password</div>
    <% } %>
</div>

<div class="footer">
    &copy; 2025 Employee Management System
</div>
<script>
    window.history.forward();
    function noBack() {
        window.history.forward();
    }
</script>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
</body>
</html>
