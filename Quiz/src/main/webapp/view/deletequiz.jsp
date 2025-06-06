<%--
  Created by IntelliJ IDEA.
  User: sumitadhikari
  Date: 20/04/2025
  Time: 10:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Delete Question</title>
  <style>
    /* Delete Question Page Styles */
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

<!-- Delete Question Form -->
<form action="<%= request.getContextPath() %>/DeleteQuizServlet" method="get" onsubmit="return confirm('Are you sure you want to delete this question?');">
  <h2>Delete Question</h2>
  <label for="id">Enter the Question ID to delete:</label>
  <input type="number" id="id" name="id" placeholder="Question ID" required>
  <%-- Optional: keep quizId if needed for redirection or context --%>
  <input type="hidden" name="quizId" value="<%= request.getParameter("quizId") %>">
  <button type="submit">Delete Question</button>
  <!-- Back button to Admin Panel -->
  <a href="<%= request.getContextPath() %>/view/adminpanel.jsp">
    <button type="button">Back</button>
  </a>
</form>

</body>
</html>
