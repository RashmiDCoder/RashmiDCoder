<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.quiz.model.Users" %>
<%
  // Fetch user info from request attribute
  Users user = (Users) request.getAttribute("user");
  String error = request.getParameter("error");
  // Determine back URL based on user role
  String backUrl;
  com.quiz.model.Users sessionUser = (com.quiz.model.Users) session.getAttribute("user");
  if (sessionUser != null && "admin".equalsIgnoreCase(sessionUser.getRole())) {
      backUrl = request.getContextPath() + "/view/adminpanel.jsp";
  } else {
      backUrl = request.getContextPath() + "/view/userinfo.jsp";
  }
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Edit User</title>
  <style>
    /* Edit User Page Styles */
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
    .edit-user-block {
      background: rgba(255,255,255,0.1);
      padding: 30px;
      border-radius: 15px;
      width: 400px;
      box-shadow: 0 6px 20px rgba(0,0,0,0.25);
      text-align: center;
    }
    .edit-user-block h2 {
      margin-bottom: 20px;
    }
    .edit-user-block input {
      width: 90%;
      padding: 10px;
      margin: 10px 0;
      border: none;
      border-radius: 8px;
      font-size: 1em;
    }
    .edit-user-block .btn {
      margin: 10px 10px 0 10px;
      padding: 10px 25px;
      font-size: 1em;
      border: none;
      border-radius: 20px;
      background: #fff;
      color: #5A8DEE;
      font-weight: bold;
      cursor: pointer;
      transition: background 0.2s;
    }
    .edit-user-block .btn:hover {
      background: #e6e6e6;
    }
    .error-message {
      color: #ff6b6b;
      background: rgba(255, 107, 107, 0.1);
      padding: 10px;
      border-radius: 5px;
      margin-bottom: 20px;
    }
  </style>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css">
</head>
<body>
<!-- Edit User Section -->
<div class="edit-user-block">
  <h2>Edit Profile</h2>
  <% if (error != null) { %>
    <!-- Error Message Display -->
    <div class="error-message"><%= error %></div>
  <% } %>
  <!-- Edit User Form -->
  <form action="<%= request.getContextPath() %>/EditUserServlet" method="post">
    <input type="hidden" name="oldUsername" value="<%= user != null ? user.getName() : "" %>">
    <input type="text" name="username" placeholder="Username" value="<%= user != null ? user.getName() : "" %>" required>
    <input type="email" name="email" placeholder="Email" value="<%= user != null ? user.getEmail() : "" %>" required>
    <button class="btn" type="submit">Update</button>
    <a href="<%= backUrl %>"><button class="btn" type="button">Cancel</button></a>
  </form>
</div>
</body>
</html> 