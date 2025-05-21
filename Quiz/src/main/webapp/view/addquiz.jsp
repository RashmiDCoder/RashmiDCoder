<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Add Quiz</title>
  <style>
    /* Add Quiz Page Styles */
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
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css">
</head>
<body>
<%
  String quizIdParam = request.getParameter("quizId");
%>
<!-- Add New Question Form -->
<form action="<%= request.getContextPath() %>/AddQuizServlet" method="post" onsubmit="return confirm('Are you sure you want to add this question?');">
  <h2>Add New Question</h2>
  <div class="form-group">
    <label for="categoryId">Select a category for this question:</label>
    <select name="categoryId" id="categoryId" required>
      <option value="" disabled selected>Select a category</option>
      <option value="1">1 - General Knowledge</option>
      <option value="2">2 - Science</option>
      <option value="3">3 - History</option>
      <option value="4">4 - Geography</option>
      <option value="5">5 - Sports</option>
      <option value="6">6 - Technology & Computers</option>
      <option value="7">7 - Literature</option>
      <option value="8">8 - Culture</option>
    </select>
  </div>
  <textarea name="questionText" placeholder="Enter question" required></textarea>
  <input type="text" name="option1" placeholder="Option 1" required>
  <input type="text" name="option2" placeholder="Option 2" required>
  <input type="text" name="option3" placeholder="Option 3" required>
  <input type="text" name="option4" placeholder="Option 4" required>
  <input type="text" name="correctAnswer" placeholder="Enter correct answer" required>
  <button type="submit">Add Question</button>
  <!-- Back button to Admin Panel -->
  <a href="<%= request.getContextPath() %>/view/adminpanel.jsp">
    <button type="button">Back</button>
  </a>
</form>

</body>
</html>

