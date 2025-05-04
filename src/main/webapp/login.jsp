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

    <!-- Display error message if present -->
    <c:if test="${param.error != null}">
      <p style="color:red;">${param.error}</p>
    </c:if>
  </form>
</div>
</body>
</html>
