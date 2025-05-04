package com.quiz.servlets;

import com.quiz.model.DBConnection;
import com.quiz.model.PasswordUtil;
import com.quiz.model.UserDAO;
import com.quiz.model.Users;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/signup")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handles POST requests from the signup form.
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        Users user = new Users(name, email, password, role);


        try {
            // Obtain the database connection

            Connection con = DBConnection.getConnection(); // Get the database connection
            UserDAO dao = new UserDAO(con); // Create a UserDAO object
            boolean isRegistered = dao.registerUser(user);

            if (isRegistered) {
                // If registration is successful, redirect to login page with a success message
                response.sendRedirect("login.jsp?success=Registered+Successfully");
            } else {
                // On failure, redirect back to the signup page with an error message
                response.sendRedirect("signup.jsp?error=Registration+failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("signup.jsp?error=" + e.getMessage());
        }
    }
}
