<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Quiz</title>
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

    .question-block {
      text-align: center;
    }

    .question-block h2 {
      font-size: 2em;
      margin-bottom: 30px;
    }

    .options {
      margin: 20px 0;
      text-align: left;
    }

    .options label {
      display: block;
      font-size: 1.2em;
      margin: 10px 0;
    }

    input[type="radio"] {
      margin-right: 10px;
      transform: scale(1.2);
    }

    .submit-btn {
      margin-top: 30px;
      padding: 15px 40px;
      font-size: 1.1em;
      font-weight: bold;
      border: none;
      border-radius: 30px;
      background-color: #fff;
      color: #5A8DEE;
      cursor: pointer;
      box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
    }

    .submit-btn:hover {
      background-color: #e6e6e6;
    }
  </style>
</head>
<body>

<div class="question-block">
  <form action="SubmitQuizServlet" method="post">
    <h2>What is the capital of France?</h2>
    <div class="options">
      <label><input type="radio" name="q1" value="a"> Berlin</label>
      <label><input type="radio" name="q1" value="b"> Madrid</label>
      <label><input type="radio" name="q1" value="c"> Paris</label>
      <label><input type="radio" name="q1" value="d"> Rome</label>
    </div>
    <button type="submit" class="submit-btn">Submit</button>
  </form>
</div>

</body>
</html>
