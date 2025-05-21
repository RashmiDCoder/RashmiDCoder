<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="com.quiz.model.Users" %>
<%@ page import="com.quiz.dao.UserDAO" %>
<%@ page import="com.quiz.util.DBConnection" %>
<%@ page import="java.sql.Connection" %>
<%
  // Session check: redirect to login if not logged in
  String username = (String) session.getAttribute("username");
  if (username == null) {
    response.sendRedirect("login.jsp");
    return;
  }
  // Fetch user info from database
  Connection con = com.quiz.util.DBConnection.getConnection();
  com.quiz.dao.UserDAO userDAO = new com.quiz.dao.UserDAO(con);
  com.quiz.model.Users user = userDAO.getUserByUsername(username);
%>
<!DOCTYPE html>
<html>
<head>   
  <meta charset="UTF-8">
  <title>User Info</title>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css">
  <style>
    /* User Info Page Styles */
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
    .user-info-block {
      background: rgba(255,255,255,0.1);
      padding: 30px;
      border-radius: 15px;
      width: 400px;
      box-shadow: 0 6px 20px rgba(0,0,0,0.25);
      text-align: center;
    }
    .user-info-block h2 {
      margin-bottom: 20px;
    }
    .user-info-block p {
      font-size: 1.2em;
      margin: 10px 0;
    }
    .user-info-block .btn {
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
    .user-info-block .btn:hover {
      background: #e6e6e6;
    }
  </style>
</head>
<body>
<!-- User Info Section -->
<div class="user-info-block">
  <h2>User Info</h2>
  <p><b>Username:</b> <%= user != null ? user.getName() : "N/A" %></p>
  <p><b>Email:</b> <%= user != null ? user.getEmail() : "N/A" %></p>
  <!-- Edit User Form -->
  <form action="<%= request.getContextPath() %>/EditUserServlet" method="get" style="display:inline;">
    <input type="hidden" name="username" value="<%= user != null ? user.getName() : "" %>">
    <button class="btn" type="submit">Edit</button>
  </form>
  <!-- Delete User Form -->
  <form action="<%= request.getContextPath() %>/DeleteUserServlet" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete your account?');">
    <input type="hidden" name="username" value="<%= user != null ? user.getName() : "" %>">
    <button class="btn" type="submit">Delete</button>
  </form>
  <br/>
  <% // Back button: go to admin panel if admin, else home
     String backUrl;
     if (user != null && "admin".equalsIgnoreCase(user.getRole())) {
         backUrl = request.getContextPath() + "/view/adminpanel.jsp";
     } else {
         backUrl = request.getContextPath() + "/view/home.jsp";
     }
  %>
  <a href="<%= backUrl %>"><button class="btn" type="button">Back</button></a>
</div>
</body>
</html> 