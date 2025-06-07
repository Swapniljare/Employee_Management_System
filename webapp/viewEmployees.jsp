<%@ page import="java.util.List" %>
<%@ page import="model.Employee" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Employees</title>
    <style>
        table {
            width: 70%;
            border-collapse: collapse;
            margin: 20px auto;
        }
        th, td {
            padding: 10px;
            border: 1px solid #666;
            text-align: center;
        }
        th {
            background-color: #ddd;
        }
        a {
            text-decoration: none;
            color: blue;
        }
    </style>
</head>
<body>
    <h2 style="text-align:center;">Employee List</h2>
    <div style="text-align:center; margin-bottom:10px;">
        <a href="EmployeeServlet?action=new">Add New Employee</a>
    </div>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Department</th>
            <th>Actions</th>
        </tr>
        <%
            List<Employee> employees = (List<Employee>) request.getAttribute("employeeList");
            if (employees != null && !employees.isEmpty()) {
                for (Employee emp : employees) {
        %>
        <tr>
            <td><%= emp.getId() %></td>
            <td><%= emp.getName() %></td>
            <td><%= emp.getEmail() %></td>
            <td><%= emp.getDepartment() %></td>
            <td>
                <a href="EmployeeServlet?action=edit&id=<%= emp.getId() %>">Edit</a> |
                <a href="EmployeeServlet?action=delete&id=<%= emp.getId() %>"
                   onclick="return confirm('Are you sure you want to delete this employee?');">Delete</a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr><td colspan="5">No employees found.</td></tr>
        <%
            }
        %>
    </table>
</body>
</html>
