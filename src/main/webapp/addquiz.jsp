<%--
  Created by IntelliJ IDEA.
  User: sumitadhikari
  Date: 20/04/2025
  Time: 10:18 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Add Quiz</title>
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

<form action="AddQuizServlet" method="post">
  <h2>Add New Quiz</h2>
  <input type="text" name="question" placeholder="Enter question" required>
  <input type="text" name="optionA" placeholder="Option A" required>
  <input type="text" name="optionB" placeholder="Option B" required>
  <input type="text" name="optionC" placeholder="Option C" required>
  <input type="text" name="optionD" placeholder="Option D" required>
  <select name="correctAnswer" required>
    <option value="" disabled selected>Select correct answer</option>
    <option value="a">Option A</option>
    <option value="b">Option B</option>
    <option value="c">Option C</option>
    <option value="d">Option D</option>
  </select>
  <button type="submit">Add Quiz</button>
  <a href="adminpanel.jsp">
    <button type="button">Back</button>
  </a>

</form>

</body>
</html>

