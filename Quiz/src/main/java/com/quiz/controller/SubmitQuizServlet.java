package com.quiz.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.quiz.dao.AttemptDAO;
import com.quiz.dao.QuestionDAO;
import com.quiz.dao.UserDAO;
import com.quiz.model.Attempt;
import com.quiz.model.Question;
import com.quiz.model.Users;
import com.quiz.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/SubmitQuizServlet")
public class SubmitQuizServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handles POST requests to submit a quiz
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        // Check if user is logged in
        if (session.getAttribute("username") == null) {
            response.sendRedirect(request.getContextPath() + "/view/login.jsp");
            return;
        }
        try {
            // Get the questions from the session
            @SuppressWarnings("unchecked")
            List<Question> questions = (List<Question>) session.getAttribute("questions");
            // If questions are not in session, try to get them from request parameters
            if (questions == null) {
                String categoryIdStr = request.getParameter("categoryId");
                if (categoryIdStr == null || categoryIdStr.trim().isEmpty()) {
                    throw new ServletException("Category ID is missing");
                }
                int categoryId = Integer.parseInt(categoryIdStr);
                questions = new QuestionDAO().getRandomQuestionsByCategory(categoryId, 10);
                if (questions == null || questions.isEmpty()) {
                    throw new ServletException("No questions found for the selected category");
                }
            }
            int total = questions.size();
            int score = 0;
            Map<Integer, String> userAnswers = new HashMap<>();
            Map<Integer, Boolean> correctAnswers = new HashMap<>();
            // Process user answers
            for (int i = 1; i <= total; i++) {
                String answer = request.getParameter("q" + i);
                if (answer == null || answer.trim().isEmpty()) {
                    userAnswers.put(i, "Not answered");
                    correctAnswers.put(i, false);
                    continue;
                }
                userAnswers.put(i, answer);
                Question q = questions.get(i - 1);
                int selectedOption = -1;
                try {
                    selectedOption = Integer.parseInt(answer.trim());
                } catch (NumberFormatException e) {
                    // handle error
                }
                boolean isCorrect = (selectedOption == q.getCorrectAnswer());
                correctAnswers.put(i, isCorrect);
                if (isCorrect) score++;
            }
            // Store results in session for potential review
            session.setAttribute("userAnswers", userAnswers);
            session.setAttribute("correctAnswers", correctAnswers);
            session.setAttribute("questions", questions);
            // Set attributes for result page
            request.setAttribute("score", score);
            request.setAttribute("total", total);
            request.setAttribute("percentage", (double) score / total * 100);
            // --- Save attempt to DB ---
            Users user = (Users) session.getAttribute("user");
            int userId = -1;
            if (user != null) {
                UserDAO userDAO = new UserDAO(DBConnection.getConnection());
                userId = userDAO.getUserIdByEmail(user.getEmail());
            }
            // Calculate description
            String desc;
            if (score >= 8) {
                desc = "excellent";
            } else if (score >= 6) {
                desc = "good";
            } else if (score >= 3) {
                desc = "bad";
            } else {
                desc = "poor";
            }
            // Save attempt if userId is valid
            if (userId != -1) {
                Attempt attempt = new Attempt(0, userId, score, desc);
                AttemptDAO attemptDAO = new AttemptDAO();
                attemptDAO.insertAttempt(attempt);
                // System.out.println("Attempt insert result: true"); // Removed debug print
            }
            request.setAttribute("description", desc);
            // --- End save attempt ---
            // Forward to result page
            request.getRequestDispatcher("/view/result.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid category ID format");
            request.getRequestDispatcher("/view/error.jsp").forward(request, response);
        } catch (ServletException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/view/error.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "An unexpected error occurred");
            request.getRequestDispatcher("/view/error.jsp").forward(request, response);
        }
    }
} 