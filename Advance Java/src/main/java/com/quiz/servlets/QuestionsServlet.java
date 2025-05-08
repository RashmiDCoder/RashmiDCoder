package com.quiz.servlets;

import java.io.IOException;
import java.util.List;

import com.quiz.model.Question;
import com.quiz.model.QuestionDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/QuestionsServlet")
public class QuestionsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        QuestionDAO questionDAO = new QuestionDAO();
        List<Question> questions = questionDAO.getRandomQuestionsByCategory(categoryId, 10);
        request.setAttribute("questions", questions);
        request.getRequestDispatcher("questions.jsp").forward(request, response);
    }
} 