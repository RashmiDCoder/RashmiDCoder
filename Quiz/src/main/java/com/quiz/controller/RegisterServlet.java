package com.quiz.controller;

import java.io.IOException;
import java.sql.Connection;

import com.quiz.dao.UserDAO;
import com.quiz.model.Users;
import com.quiz.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handles POST requests from the signup form
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        Users user = new Users(name, email, password, role);
        // Server-side validation
        if (name == null || name.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            password == null || !password.matches("\\d{4}") ||
            role == null || role.trim().isEmpty()) {
            request.setAttribute("error", "All fields are required and password must be a 4-digit number.");
            request.getRequestDispatcher("/view/signup.jsp").forward(request, response);
            return;
        }
        try {
            // Obtain the database connection and register the user
            Connection con = DBConnection.getConnection();
            UserDAO dao = new UserDAO(con);
            boolean isRegistered = dao.registerUser(user);
            // Redirect or forward based on registration result
            if (isRegistered) {
                response.sendRedirect(request.getContextPath() + "/view/signup.jsp?success=1");
            } else {
                request.setAttribute("error", "Registration failed. Please try again.");
                request.getRequestDispatcher("/view/signup.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("/view/signup.jsp").forward(request, response);
        }
    }
}
