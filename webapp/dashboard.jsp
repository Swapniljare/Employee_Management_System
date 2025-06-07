<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession nsession = request.getSession(false);
    if (nsession == null || nsession.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String username = (String) session.getAttribute("username");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Employee Management System</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url('https://images.unsplash.com/photo-1504384308090-c894fdcc538d'); /* Background image */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: #fff;
        }

        /* Navbar styles */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: rgba(0,0,0,0.7);
            padding: 10px 40px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.7);
        }
        .navbar .logo {
            font-size: 24px;
            font-weight: bold;
            color: #4fc3f7;
        }
        .navbar ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
            gap: 25px;
        }
        .navbar ul li {
            display: inline;
        }
        .navbar ul li a {
            color: #ddd;
            text-decoration: none;
            font-weight: 600;
            padding: 8px 12px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .navbar ul li a:hover {
            background-color: #4fc3f7;
            color: #000;
        }

        /* Welcome container */
        .welcome-container {
            max-width: 700px;
            margin: 50px auto;
            background-color: rgba(0, 0, 0, 0.7);
            padding: 40px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.8);
        }
        .welcome-container p {
            font-size: 22px;
            margin-bottom: 15px;
        }
        .welcome-container .username {
            font-weight: 700;
            color: #4fc3f7;
            font-size: 26px;
        }

        /* Logout button */
        .logout-btn {
            display: inline-block;
            margin-top: 25px;
            padding: 10px 25px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }
        .logout-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <!-- Navigation bar -->
    <div class="navbar">
        <div class="logo">EMS</div>
        <ul>
            <li><a href="viewEmployees.jsp">View Employees</a></li>
            <li><a href="addEmployee.jsp">Add Employee</a></li>
            <li><a href="updateEmployee.jsp">Update Employee</a></li>
            <li><a href="deleteEmployee.jsp">Delete Employee</a></li>
            <li><a href="logout.jsp" >Logout</a></li>
        </ul>
    </div>

    <!-- Welcome message -->
    <div class="welcome-container">
        <p>Welcome, <span class="username"><%= username %></span>!</p>
        <p>This is the Employee Management System dashboard.</p>
    </div>
    
    <script>
    window.onload = function() {
        alert("Welcome, <%= username != null ? username : "User" %>! You have successfully logged in.");
    };
</script>

</body>
</html>
