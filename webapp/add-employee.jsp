<html>
<head>
    <title>Add Employee</title>
    <link rel="stylesheet" href="/style.css">
</head>
<body>
<div class="form-container">
    <h2>Add New Employee</h2>
    <form action="EmployeeServlet?action=insert" method="post">
        <input type="text" name="name" placeholder="Name" required /><br>
        <input type="email" name="email" placeholder="Email" required /><br>
        <input type="text" name="department" placeholder="Department" required /><br>
        <input type="number" name="salary" placeholder="Salary" step="0.01" required /><br>
        <input type="submit" value="Add Employee" />
    </form>
</div>
</body>
</html>
