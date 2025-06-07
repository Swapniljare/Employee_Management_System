package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Hardcoded credentials for simplicity
    private final String USERNAME = "admin";
    private final String PASSWORD = "admin123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Validate credentials
        if (USERNAME.equals(username) && PASSWORD.equals(password)) {
            // Create session and set attribute
            HttpSession session = request.getSession();
            session.setAttribute("username", username);

            // Redirect to dashboard or home page
            response.sendRedirect("dashboard.jsp");
        } else {
            // Invalid login
            request.setAttribute("errorMessage", "Invalid username or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    // Optional: Handle GET by redirecting to login.jsp
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }
}
