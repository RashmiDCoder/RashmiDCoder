package com.quiz.controller;

import java.io.IOException;

import com.quiz.dao.UserDAO;
import com.quiz.model.Users;
import com.quiz.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/EditUserServlet")
public class EditUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handles GET requests to show the edit user page
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        UserDAO userDAO = new UserDAO(DBConnection.getConnection());
        Users user = userDAO.getUserByUsername(username);
        request.setAttribute("user", user);
        request.getRequestDispatcher("/view/edituser.jsp").forward(request, response);
    }

    // Handles POST requests to update user info
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String oldUsername = request.getParameter("oldUsername");
        String newUsername = request.getParameter("username");
        String newEmail = request.getParameter("email");
        boolean fromAdmin = "true".equals(request.getParameter("fromAdmin"));
        UserDAO userDAO = new UserDAO(DBConnection.getConnection());
        boolean success = userDAO.updateUser(oldUsername, newUsername, newEmail);
        // Update session username if changed
        if (success) {
            HttpSession session = request.getSession();
            session.setAttribute("username", newUsername);
            if (fromAdmin) {
                response.sendRedirect(request.getContextPath() + "/view/adminpanel.jsp?message=User updated successfully");
            } else {
                response.sendRedirect(request.getContextPath() + "/view/userinfo.jsp?message=Profile updated successfully");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/view/edituser.jsp?username=" + oldUsername + "&error=Failed to update profile");
        }
    }
} 