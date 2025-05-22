package com.quiz.controller;

import java.io.IOException;
import java.sql.Connection;

import com.quiz.dao.UserDAO;
import com.quiz.model.Users;
import com.quiz.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handle login requests via POST method
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get login form parameters
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        try {
            // Get DB connection and attempt login
            Connection con = DBConnection.getConnection();
            UserDAO dao = new UserDAO(con);
            Users user = dao.login(email, password);
            if (user != null) {
                // If credentials are valid, create a session
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                session.setAttribute("username", user.getName());
                session.setAttribute("role", user.getRole());
                // Set a cookie to store the user's role
                Cookie roleCookie = new Cookie("userRole", user.getRole());
                roleCookie.setMaxAge(30 * 60); // 30 minutes expiry
                response.addCookie(roleCookie);
                // Redirect based on user role
                if ("admin".equalsIgnoreCase(user.getRole())) {
                    response.sendRedirect(request.getContextPath() + "/view/adminpanel.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/view/home.jsp");
                }
            } else {
                // Redirect back to login with an error message if invalid
                response.sendRedirect(request.getContextPath() + "/view/login.jsp?error=Invalid+credentials");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/view/login.jsp?error=An+error+occurred");
        }
    }
}
