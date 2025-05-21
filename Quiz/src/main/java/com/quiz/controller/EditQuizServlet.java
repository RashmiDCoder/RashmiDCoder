package com.quiz.controller;

import java.io.IOException;

import com.quiz.dao.QuestionDAO;
import com.quiz.model.Question;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EditQuizServlet")
public class EditQuizServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handles GET requests to show the edit quiz page
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the question ID from the request
        int questionId = Integer.parseInt(request.getParameter("id"));
        // Get the question from the database
        QuestionDAO questionDAO = new QuestionDAO();
        Question question = questionDAO.getQuestionById(questionId);
        if (question != null) {
            // Set the question as an attribute and forward to the edit page
            request.setAttribute("question", question);
            request.getRequestDispatcher("/view/editquiz.jsp").forward(request, response);
        } else {
            // Redirect to admin panel with error message
            response.sendRedirect(request.getContextPath() + "/view/adminpanel.jsp?error=Question not found");
        }
    }

    // Handles POST requests to update a quiz question
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters from the request
        int questionId = Integer.parseInt(request.getParameter("id"));
        String questionText = request.getParameter("questionText");
        String option1 = request.getParameter("option1");
        String option2 = request.getParameter("option2");
        String option3 = request.getParameter("option3");
        String option4 = request.getParameter("option4");
        String correctAnswer = request.getParameter("correctAnswer");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));

        // Create a Question object with updated values
        Question question = new Question();
        question.setId(questionId);
        question.setQuestionText(questionText);
        question.setOption1(option1);
        question.setOption2(option2);
        question.setOption3(option3);
        question.setOption4(option4);
        question.setCorrectAnswer(Integer.parseInt(correctAnswer));
        question.setCategoryId(categoryId);

        // Update the question in the database
        QuestionDAO questionDAO = new QuestionDAO();
        boolean success = questionDAO.updateQuestion(question);

        // Redirect based on success or failure
        if (success) {
            response.sendRedirect(request.getContextPath() + "/view/adminpanel.jsp?message=Question updated successfully! The changes are now live in the quiz.");
        } else {
            response.sendRedirect(request.getContextPath() + "/view/editquiz.jsp?id=" + questionId + "&error=Failed to update question. Please check your changes and try again.");
        }
    }
}