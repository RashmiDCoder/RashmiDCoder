package com.quiz.controller;

import java.io.IOException;

import com.quiz.dao.QuestionDAO;
import com.quiz.model.Question;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddQuizServlet")
public class AddQuizServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handles POST requests to add a new quiz question
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters from the request
        String questionText = request.getParameter("questionText");
        String option1 = request.getParameter("option1");
        String option2 = request.getParameter("option2");
        String option3 = request.getParameter("option3");
        String option4 = request.getParameter("option4");
        String correctAnswer = request.getParameter("correctAnswer");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));

        // Create a new Question object
        Question question = new Question();
        question.setQuestionText(questionText);
        question.setOption1(option1);
        question.setOption2(option2);
        question.setOption3(option3);
        question.setOption4(option4);
        question.setCorrectAnswer(Integer.parseInt(correctAnswer));
        question.setCategoryId(categoryId);

        // Add the question to the database
        QuestionDAO questionDAO = new QuestionDAO();
        boolean success = questionDAO.addQuestion(question);

        // Redirect based on success or failure
        if (success) {
            response.sendRedirect(request.getContextPath() + "/view/adminpanel.jsp?message=Question added successfully! The new question is now available in the quiz.");
        } else {
            response.sendRedirect(request.getContextPath() + "/view/addquiz.jsp?error=Failed to add question. Please try again.");
        }
    }
}