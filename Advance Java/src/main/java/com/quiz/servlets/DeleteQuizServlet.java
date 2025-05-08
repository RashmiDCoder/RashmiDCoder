package com.quiz.servlets;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteQuizServlet")
public class DeleteQuizServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get the question ID from the request
        int questionId = Integer.parseInt(request.getParameter("id"));

        // Delete the question from the database
        com.quiz.model.QuestionDAO questionDAO = new com.quiz.model.QuestionDAO();
        boolean success = questionDAO.deleteQuestion(questionId);

        if (success) {
            // Redirect to the admin panel with success message
            response.sendRedirect("adminpanel.jsp?message=Question deleted successfully! The question has been removed from the quiz.");
        } else {
            // Redirect to the admin panel with error message
            response.sendRedirect("adminpanel.jsp?error=Failed to delete question. Please try again.");
        }
    }
}