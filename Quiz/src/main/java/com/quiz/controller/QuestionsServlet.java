package com.quiz.controller;

import java.io.IOException;
import java.util.List;

import com.quiz.dao.QuestionDAO;
import com.quiz.model.Question;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/QuestionsServlet")
public class QuestionsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handles GET requests to show questions for a category
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get category ID from request
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        // Get random questions for the category
        QuestionDAO questionDAO = new QuestionDAO();
        List<Question> questions = questionDAO.getRandomQuestionsByCategory(categoryId, 10);

        // --- Temporary Debugging ---
        // System.out.println("Fetched " + (questions != null ? questions.size() : 0) + " questions for category " + categoryId);
        // if (questions != null && !questions.isEmpty()) {
        //     Question firstQuestion = questions.get(0);
        //     System.out.println("First question text: " + firstQuestion.getQuestionText());
        //     System.out.println("Option 1: " + firstQuestion.getOption1());
        //     System.out.println("Option 2: " + firstQuestion.getOption2());
        //     System.out.println("Option 3: " + firstQuestion.getOption3());
        //     System.out.println("Option 4: " + firstQuestion.getOption4());
        // }
        // --- End Debugging ---

        // Set questions as request attribute
        request.setAttribute("questions", questions);
        // Store questions in session for quiz
        HttpSession session = request.getSession();
        session.setAttribute("questions", questions);
        // Forward to questions.jsp
        request.getRequestDispatcher("/view/questions.jsp").forward(request, response);
    }
} 