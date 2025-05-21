<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Quizard • Home</title>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css" />
</head>
<body>
<%
  // Session check: redirect to login if not logged in
  String username = (String) session.getAttribute("username");
  if (username == null) {
    response.sendRedirect("login.jsp");
    return;
  }
%>
<!-- Navigation Bar -->
<header>
  <div class="logo-small">Quizard.</div>
  <nav>
    <a href="<%= request.getContextPath() %>/view/home.jsp">Home</a>
    <a href="<%= request.getContextPath() %>/view/category.jsp">Category</a>
    <a href="<%= request.getContextPath() %>/view/rules.jsp">Rules</a>
    <a href="<%= request.getContextPath() %>/view/aboutus.jsp">About Us</a>
    <a href="<%= request.getContextPath() %>/view/login.jsp" id="logoutLink">LOGOUT</a>
  </nav>
  <!-- Display username with link to user info page -->
  <div class="user-info">Hello, <a href="<%= request.getContextPath() %>/view/userinfo.jsp"><strong><%= username %></strong></a></div>
</header>

<!-- Main Content Section -->
<div class="container home-container" style="padding-top: 100px;">
  <h2 class="home-text">Want to become the ultimate quizard?</h2>
  <!-- Button to go to Category page -->
  <a href="<%= request.getContextPath() %>/view/category.jsp" class="home-button">Let's Go</a>
</div>

<!-- JavaScript for Logout Confirmation -->
<script>
  // Confirmation on logout
  document.getElementById("logoutLink").addEventListener("click", function (event) {
    const confirmLogout = confirm("Are you sure you want to log out?");
    if (!confirmLogout) {
      event.preventDefault(); // Stop the link if user cancels
    }
  });
</script>

</body>
</html>
