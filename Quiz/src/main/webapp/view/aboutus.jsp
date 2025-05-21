<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>About Us • Quizard</title>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css" />
</head>
<body>
<!-- Navbar -->
<header>
  <div class="logo-small">Quizard.</div>
  <nav>
    <a href="<%= request.getContextPath() %>/view/home.jsp">Home</a>
    <a href="<%= request.getContextPath() %>/view/category.jsp">Category</a>
    <a href="<%= request.getContextPath() %>/view/rules.jsp">Rules</a>
    <a href="<%= request.getContextPath() %>/view/aboutus.jsp">About Us</a>
  </nav>
  <!-- Placeholder for username display -->
  <div class="user-info">Hello, <strong>USERNAME</strong></div>
</header>

<!-- About Content Section -->
<main class="about-main">
  <h1 class="about-page-title">About Us</h1>
  <!-- Mission Statement -->
  <p class="about-description">
    Our mission is to make people intelligent through fun and interactive quizzes.<br />
    We believe learning should be accessible and engaging for everyone.<br />
    Quizard helps you challenge your brain while having fun!
  </p>

  <!-- Team Section -->
  <h2 class="team-heading">Our Team</h2>
  <div class="team-container">
    <!-- Team Member: SUMIT ADHIKARI -->
    <div class="team-member">
      <div class="team-photo-container">
        <img src="<%= request.getContextPath() %>/images/sumit 2.jpg" alt="SUMIT ADHIKARI" class="team-photo" />
      </div>
      <p class="team-name">SUMIT ADHIKARI</p>
      <p class="team-email">sumit@example.com</p>
    </div>
    <!-- Team Member: SUNAYAN SHAKYA -->
    <div class="team-member">
      <div class="team-photo-container">
        <img src="<%= request.getContextPath() %>/images/sunayan.jpg" alt="SUNAYAN SHAKYA" class="team-photo" />
      </div>
      <p class="team-name">SUNAYAN SHAKYA</p>
      <p class="team-email">sunayan@example.com</p>
    </div>
    <!-- Team Member: SATYAM DAHAL -->
    <div class="team-member">
      <div class="team-photo-container">
        <img src="<%= request.getContextPath() %>/images/satyam.jpg" alt="SATYAM DAHAL" class="team-photo" />
      </div>
      <p class="team-name">SATYAM DAHAL</p>
      <p class="team-email">satyam@example.com</p>
    </div>
    <!-- Team Member: RASHMI DARNAL -->
    <div class="team-member">
      <div class="team-photo-container">
        <img src="<%= request.getContextPath() %>/images/rashmi.jpg" alt="RASHMI DARNAL" class="team-photo" />
      </div>
      <p class="team-name">RASHMI DARNAL</p>
      <p class="team-email">rashmi@example.com</p>
    </div>
    <!-- Team Member: ARPANA POKHREL -->
    <div class="team-member">
      <div class="team-photo-container">
        <img src="<%= request.getContextPath() %>/images/team5.jpg" alt="ARPANA POKHREL" class="team-photo" />
      </div>
      <p class="team-name">ARPANA POKHREL</p>
      <p class="team-email">arpana@example.com</p>
    </div>
  </div>
</main>

<!-- Footer -->
<footer class="contact-footer">
  <h3>Contact Us</h3>
  <p> Email: quizard@example.com <br>Contact: 9812345670</p>
</footer>
</body>
</html>
