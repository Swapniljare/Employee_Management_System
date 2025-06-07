package dao;

import model.Employee;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/employee_db";
    private String jdbcUsername = "root";
    private String jdbcPassword = "Swapnil@2549";

    private static final String INSERT_EMPLOYEE_SQL = "INSERT INTO employees (name, email, department, salary) VALUES (?, ?, ?, ?)";
    private static final String SELECT_EMPLOYEE_BY_ID = "SELECT * FROM employees WHERE id = ?";
    private static final String SELECT_ALL_EMPLOYEES = "SELECT * FROM employees";
    private static final String DELETE_EMPLOYEE_SQL = "DELETE FROM employees WHERE id = ?";
    private static final String UPDATE_EMPLOYEE_SQL = "UPDATE employees SET name = ?, email = ?, department = ?, salary = ? WHERE id = ?";
    private static final String VALIDATE_ADMIN_SQL = "SELECT * FROM admin WHERE username = ? AND password = ?";

    public Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // For MySQL 8+
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_db", "root", "Swapnil@2549");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    public boolean validateAdmin(String username, String password) {
        boolean isValid = false;
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(VALIDATE_ADMIN_SQL)) {

            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            isValid = rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isValid;
    }

    public void addEmployee(Employee employee) {
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(INSERT_EMPLOYEE_SQL)) {

            stmt.setString(1, employee.getName());
            stmt.setString(2, employee.getEmail());
            stmt.setString(3, employee.getDepartment());
            stmt.setDouble(4, employee.getSalary());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Employee getEmployeeById(int id) {
        Employee employee = null;
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(SELECT_EMPLOYEE_BY_ID)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String department = rs.getString("department");
                double salary = rs.getDouble("salary");

                employee = new Employee(id, name, email, department, salary);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employee;
    }

    public List<Employee> getAllEmployees() {
        List<Employee> employees = new ArrayList<>();

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(SELECT_ALL_EMPLOYEES)) {

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String department = rs.getString("department");
                double salary = rs.getDouble("salary");

                employees.add(new Employee(id, name, email, department, salary));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return employees;
    }

    public void updateEmployee(Employee employee) {
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(UPDATE_EMPLOYEE_SQL)) {

            stmt.setString(1, employee.getName());
            stmt.setString(2, employee.getEmail());
            stmt.setString(3, employee.getDepartment());
            stmt.setDouble(4, employee.getSalary());
            stmt.setInt(5, employee.getId());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteEmployee(int id) {
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(DELETE_EMPLOYEE_SQL)) {

            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
