<%@ page import="com.quiz.model.Question" %><%--
  Created by IntelliJ IDEA.
  User: sumitadhikari
  Date: 20/04/2025
  Time: 10:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Edit Quiz</title>
  <style>
    body {
      margin: 0;
      font-family: 'Segoe UI', sans-serif;
      background: linear-gradient(to bottom, #5A8DEE 0%, #00F2F1 100%);
      color: #fff;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    form {
      background-color: rgba(255, 255, 255, 0.1);
      padding: 30px;
      border-radius: 15px;
      width: 400px;
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.25);
    }

    h2 {
      text-align: center;
      margin-bottom: 25px;
    }

    input, textarea, select {
      width: 100%;
      padding: 10px;
      margin-top: 10px;
      border: none;
      border-radius: 8px;
      font-size: 1em;
    }

    button {
      width: 100%;
      padding: 12px;
      margin-top: 20px;
      background-color: #fff;
      color: #5A8DEE;
      border: none;
      border-radius: 25px;
      font-weight: bold;
      font-size: 1.1em;
      cursor: pointer;
    }

    button:hover {
      background-color: #e6e6e6;
    }

  </style>
</head>
<body>
<%
  Question question = (Question) request.getAttribute("question");
  if (question != null) {
%>
<form action="EditQuizServlet" method="post" onsubmit="return confirm('Are you sure you want to update this question?');">
  <h2>Edit Quiz</h2>
  <input type="hidden" name="id" value="<%= question.getId() %>">
  <input type="text" name="questionText" placeholder="Updated question" value="<%= question.getQuestionText() %>" required>
  <input type="text" name="option1" placeholder="Option 1" value="<%= question.getOption1() %>" required>
  <input type="text" name="option2" placeholder="Option 2" value="<%= question.getOption2() %>" required>
  <input type="text" name="option3" placeholder="Option 3" value="<%= question.getOption3() %>" required>
  <input type="text" name="option4" placeholder="Option 4" value="<%= question.getOption4() %>" required>
  <select name="categoryId" required>
    <option value="1" <%= question.getCategoryId() == 1 ? "selected" : "" %>>1 - General Knowledge</option>
    <option value="2" <%= question.getCategoryId() == 2 ? "selected" : "" %>>2 - Science</option>
    <option value="3" <%= question.getCategoryId() == 3 ? "selected" : "" %>>3 - History</option>
    <option value="4" <%= question.getCategoryId() == 4 ? "selected" : "" %>>4 - Geography</option>
    <option value="5" <%= question.getCategoryId() == 5 ? "selected" : "" %>>5 - Sports</option>
    <option value="6" <%= question.getCategoryId() == 6 ? "selected" : "" %>>6 - Technology & Computers</option>
    <option value="7" <%= question.getCategoryId() == 7 ? "selected" : "" %>>7 - Literature</option>
    <option value="8" <%= question.getCategoryId() == 8 ? "selected" : "" %>>8 - Culture</option>
  </select>
  <input type="text" name="correctAnswer" placeholder="Enter correct answer" value="<%= question.getCorrectAnswer() %>" required>
  <button type="submit">Update Quiz</button>
  <a href="adminpanel.jsp">
    <button type="button">Back</button>
  </a>
</form>
<% } else { %>
  <div style="text-align: center;">
    <h2>Question not found</h2>
    <a href="adminpanel.jsp">
      <button type="button">Back to Admin Panel</button>
    </a>
  </div>
<% } %>
</body>
</html>

