<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Quizard • Log In</title>
  <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<div class="container">
  <h1 class="logo">Quizard.</h1>
  <p class="subtitle">Become the ultimate<br>Quizard</p>

  <%
    String error = request.getParameter("error");
    if (error != null) {
  %>
    <div style="color:red; text-align:center; margin-bottom:10px; font-weight:bold;"> <%= error %> </div>
  <% } %>

  <!-- HTML5 form, posts to your Java servlet at /login -->
  <form class="form" action="login" method="post">
    <input
            type="email"
            name="email"
            class="input"
            placeholder="Phone Number, Username or Email"
    required
    />
    <input
            type="password"
            name="password"
            class="input"
            placeholder="Password"
            required
    />
    <button type="submit" class="button">Log In</button>
    <a href="#" class="forgot">Forgot Password?</a>
    <p class="switch">
      Don't have an account?
      <a href="signup.jsp">Sign Up</a>
    </p>
  </form>
</div>
</body>
</html>
