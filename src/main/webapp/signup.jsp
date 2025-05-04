<%--
  Created by IntelliJ IDEA.
  User: sumitadhikari
  Date: 20/04/2025
  Time: 11:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Quizard • Sign Up</title>
  <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<div class="container">
  <h1 class="logo">Quizard.</h1>
  <p class="subtitle">Become the ultimate<br>Quizard</p>

  <form class="form" action="signup" method="post">
    <input
            type="email"
            name="email"
            class="input"
            placeholder="Email"
            required
    />
    <input
            type="text"
            name="name"
            class="input"
            placeholder="Name"
            required
    />
    <input
            type="text"
            name="role"
            class="input"
            placeholder="Role"
            required
    />
    <input
            type="password"
            name="password"
            class="input"
            placeholder="Password"
            required
    />

    <button type="submit" class="button">Sign Up</button>
    <p class="switch">
      Have an account?
      <a href="login.jsp">Log In</a>
    </p>
  </form>
</div>
</body>
</html>
