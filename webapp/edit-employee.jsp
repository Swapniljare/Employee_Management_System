<%@ page import="model.Employee" %>
<%
    Employee emp = (Employee) request.getAttribute("employee");
%>
<html>
<head>
    <title>Edit Employee</title>
    <link rel="stylesheet" href="/style.css">
</head>
<body>
<div class="form-container">
    <h2>Edit Employee</h2>
    <form action="EmployeeServlet?action=update" method="post">
        <input type="hidden" name="id" value="<%= emp.getId() %>" />
        <input type="text" name="name" value="<%= emp.getName() %>" required /><br>
        <input type="email" name="email" value="<%= emp.getEmail() %>" required /><br>
        <input type="text" name="department" value="<%= emp.getDepartment() %>" required /><br>
        <input type="number" name="salary" value="<%= emp.getSalary() %>" step="0.01" required /><br>
        <input type="submit" value="Update Employee" />
    </form>
</div>
</body>
</html>
