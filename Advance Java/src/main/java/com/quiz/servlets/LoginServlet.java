package com.quiz.servlets;

import java.io.IOException;
import java.sql.Connection;

import com.quiz.model.DBConnection;
import com.quiz.model.UserDAO;
import com.quiz.model.Users;

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

    // Handle login requests via POST method.
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Ensure the form field names match your JSP inputs.
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Connection con = DBConnection.getConnection();
            UserDAO dao = new UserDAO(con);
            Users user = dao.login(email, password);

            if (user != null) {
                // If credentials are valid, create a session.
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                session.setAttribute("username", user.getName());

                // Set a cookie to store the user's role.
                Cookie roleCookie = new Cookie("userRole", user.getRole());
                roleCookie.setMaxAge(30 * 60); // 30 minutes expiry
                response.addCookie(roleCookie);

                // Redirect based on user role.
                if ("admin".equalsIgnoreCase(user.getRole())) {
                    response.sendRedirect("adminpanel.jsp");
                } else {
                    response.sendRedirect("home.jsp");
                }
            } else {
                // Redirect back to login with an error message if invalid.
                response.sendRedirect("login.jsp?error=Invalid+credentials");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=An+error+occurred");
        }
    }
}
