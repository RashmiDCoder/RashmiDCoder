<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.quiz.model.Question" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Quiz</title>
  <style>
    /* Quiz Page Styles */
    body {
      margin: 0;
      font-family: 'Segoe UI', Arial, sans-serif;
      background: linear-gradient(to bottom, #5A8DEE 0%, #00F2F1 100%);
      color: #222;
      min-height: 100vh;
    }
    .quiz-container {
      background: #fff;
      max-width: 700px;
      margin: 40px auto 0 auto;
      border-radius: 18px;
      box-shadow: 0 8px 32px rgba(90, 141, 238, 0.15);
      padding: 40px 32px 32px 32px;
      min-height: 60vh;
    }
    .quiz-container h2 {
      font-size: 2.2em;
      margin-bottom: 30px;
      color: #5A8DEE;
      letter-spacing: 1px;
    }
    .single-question {
      margin-bottom: 32px;
      padding-bottom: 18px;
      border-bottom: 1px solid #eaeaea;
    }
    .single-question:last-child {
      border-bottom: none;
    }
    .question-title {
      font-size: 1.18em;
      font-weight: 600;
      margin-bottom: 16px;
      color: #333;
    }
    .options {
      margin: 0 0 0 10px;
      text-align: left;
    }
    .options label {
      display: block;
      font-size: 1.08em;
      margin: 10px 0 10px 0;
      cursor: pointer;
      padding-left: 8px;
      transition: background 0.2s;
      border-radius: 5px;
      color: #333;
    }
    .options label:hover {
      background: #f0f6ff;
    }
    input[type="radio"] {
      margin-right: 10px;
      transform: scale(1.15);
      accent-color: #5A8DEE;
    }
    .submit-btn {
      display: block;
      margin: 40px auto 0 auto;
      padding: 15px 50px;
      font-size: 1.15em;
      font-weight: bold;
      border: none;
      border-radius: 30px;
      background-color: #5A8DEE;
      color: #fff;
      cursor: pointer;
      box-shadow: 0 6px 18px rgba(90, 141, 238, 0.15);
      transition: background 0.2s, box-shadow 0.2s;
    }
    .submit-btn:hover {
      background-color: #3a6edb;
      box-shadow: 0 8px 24px rgba(90, 141, 238, 0.22);
    }
    @media (max-width: 800px) {
      .quiz-container {
        padding: 18px 4vw 24px 4vw;
      }
    }
  </style>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css">
</head>
<body>
<!-- Quiz Container -->
<div class="quiz-container">
  <!-- Quiz Form -->
  <form action="<%= request.getContextPath() %>/SubmitQuizServlet" method="post">
    <% // Pass category ID %>
    <input type="hidden" name="categoryId" value="<%= request.getParameter("categoryId") != null ? request.getParameter("categoryId") : "" %>">
    <h2>Quiz</h2>
    <% 
      // Fetch questions from request attribute
      List<Question> questions = (List<Question>) request.getAttribute("questions");
      // Display questions if available
      if (questions != null && !questions.isEmpty()) {
        int qNum = 1;
        // Loop through each question
        for (Question q : questions) {
    %>
      <!-- Single Question Block -->
      <div class="single-question">
        <div class="question-title">Q<%= qNum %>: <%= q.getQuestionText() %></div>
        <div class="options">
          <!-- Display answer options -->
          <label><input type="radio" name="q<%= qNum %>" value="1"> <%= q.getOption1() %></label>
          <label><input type="radio" name="q<%= qNum %>" value="2"> <%= q.getOption2() %></label>
          <label><input type="radio" name="q<%= qNum %>" value="3"> <%= q.getOption3() %></label>
          <label><input type="radio" name="q<%= qNum %>" value="4"> <%= q.getOption4() %></label>
        </div>
      </div>
    <% qNum++; } %>
    <!-- Submit Button -->
    <button type="submit" class="submit-btn">Submit</button>
    <% } else { %>
      <!-- Message if no questions found -->
      <p>No questions found for this category.</p>
    <% } %>
  </form>
</div>

</body>
</html>
