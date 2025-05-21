package com.quiz.controller;

import java.io.IOException;

import com.quiz.dao.QuestionDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteQuizServlet")
public class DeleteQuizServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handles GET requests to delete a quiz question
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int questionId = Integer.parseInt(request.getParameter("id"));
        // Delete the question from the database
        QuestionDAO questionDAO = new QuestionDAO();
        boolean success = questionDAO.deleteQuestion(questionId);
        // Redirect based on success or failure
        if (success) {
            response.sendRedirect(request.getContextPath() + "/view/adminpanel.jsp?message=Question deleted successfully! The question has been removed from the quiz.");
        } else {
            response.sendRedirect(request.getContextPath() + "/view/adminpanel.jsp?error=Failed to delete question. Please try again.");
        }
    }
}