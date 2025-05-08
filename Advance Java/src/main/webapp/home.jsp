<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Quizard • Home</title>
  <link rel="stylesheet" href="css/styles.css" />
</head>
<body>
<%
  String username = (String) session.getAttribute("username");
  if (username == null) {
    response.sendRedirect("login.jsp");
    return;
  }
%>
<!-- Nav Bar -->
<header>
  <div class="logo-small">Quizard.</div>
  <nav>
    <a href="home.jsp">Home</a>
    <a href="category.jsp">Category</a>
    <a href="rules.jsp">Rules</a>
    <a href="aboutus.jsp">About Us</a>
    <a href="login.jsp" id="logoutLink">LOGOUT</a>

  </nav>
  <!-- Replace USERNAME with server‐rendered or JS‐injected name -->
  <div class="user-info">Hello, <a href="userinfo.jsp"><strong><%= username %></strong></a></div>
</header>

<!-- Main Content -->
<div class="container home-container" style="padding-top: 100px;">
  <h2 class="home-text">Want to become the ultimate quizard?</h2>
  <a href="category.jsp" class="home-button">Let's Go</a>
</div>
</body>
<!-- JavaScript -->
<script>


  // Confirmation on logout
  document.getElementById("logoutLink").addEventListener("click", function (event) {
    const confirmLogout = confirm("Are you sure you want to log out?");
    if (!confirmLogout) {
      event.preventDefault(); // Stop the link if user cancels
    }
  });
</script>
</html>
