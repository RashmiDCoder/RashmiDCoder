package com.quiz.servlets;

import java.io.IOException;

import com.quiz.model.DBConnection;
import com.quiz.model.UserDAO;
import com.quiz.model.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/EditUserServlet")
public class EditUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        UserDAO userDAO = new UserDAO(DBConnection.getConnection());
        Users user = userDAO.getUserByUsername(username);
        request.setAttribute("user", user);
        request.getRequestDispatcher("edituser.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String oldUsername = request.getParameter("oldUsername");
        String newUsername = request.getParameter("username");
        String newEmail = request.getParameter("email");
        UserDAO userDAO = new UserDAO(DBConnection.getConnection());
        boolean success = userDAO.updateUser(oldUsername, newUsername, newEmail);
        if (success) {
            // Update session username if changed
            HttpSession session = request.getSession();
            session.setAttribute("username", newUsername);
            response.sendRedirect("userinfo.jsp?message=Profile updated successfully");
        } else {
            response.sendRedirect("edituser.jsp?username=" + oldUsername + "&error=Failed to update profile");
        }
    }
} 