package com.quiz.controller;

import java.io.IOException;

import com.quiz.dao.UserDAO;
import com.quiz.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handles POST requests to delete a user account
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        UserDAO userDAO = new UserDAO(DBConnection.getConnection());
        boolean success = userDAO.deleteUserByUsername(username);
        if (success) {
            // Invalidate session and redirect to login page
            HttpSession session = request.getSession();
            session.invalidate();
            response.sendRedirect(request.getContextPath() + "/view/login.jsp?message=Account deleted successfully");
        } else {
            response.sendRedirect(request.getContextPath() + "/view/userinfo.jsp?error=Failed to delete account");
        }
    }
} 