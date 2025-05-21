<%--
  Created by IntelliJ IDEA.
  User: sumitadhikari
  Date: 20/04/2025
  Time: 11:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        /* Admin Panel Page Styles */
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to bottom, #5A8DEE 0%, #00F2F1 100%);
            background-attachment: fixed;
            height: 100vh;
            color: white;
            display: flex;
            flex-direction: column;
            padding-top: 50px;
        }
        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 25px;
            height: 50px;
            background: rgba(0, 0, 0, 0.3);
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
            backdrop-filter: blur(10px);
        }
        nav h2 {
            font-size: 1rem;
            margin: 0;
            color: white;
        }
        nav a {
            font-size: 0.9rem;
            color: white;
            text-decoration: none;
            font-weight: 500;
            padding: 8px 12px;
            border-radius: 4px;
            transition: background 0.2s ease;
        }
        nav a:hover {
            background: rgba(255, 255, 255, 0.2);
        }
        .center-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }
        .center-content h1 {
            font-size: 2em;
            margin-bottom: 30px;
        }
        .action-buttons {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            justify-content: center;
        }
        .btn {
            background-color: white;
            color: #5A8DEE;
            font-size: 1.2em;
            padding: 15px 30px;
            border: none;
            border-radius: 30px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 6px 15px rgba(0,0,0,0.15);
        }
        .btn:hover {
            background-color: #e0e0e0;
        }
        .action-link {
            color: white;
            text-decoration: none;
            font-weight: 500;
            padding: 8px 12px;
            border-radius: 4px;
            transition: background 0.2s ease;
        }
        .action-link:hover {
            background: rgba(255, 255, 255, 0.2);
        }
    </style>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css">
</head>
<body>
<%
  // Session check: get username from session
  String username = (String) session.getAttribute("username");
%>
<!-- Navigation Bar -->
<nav>
    <h2>Admin Dashboard</h2>
    <div style="display: flex; align-items: center; gap: 20px;">
      <a href="<%= request.getContextPath() %>/view/userinfo.jsp" style="color: white; text-decoration: underline; font-weight: bold;">Hello, <%= username != null ? username : "Admin" %></a>
      <a href="<%= request.getContextPath() %>/view/login.jsp">LOGOUT </a>
    </div>
</nav>

<!-- Main Content Section -->
<div class="center-content">
    <% 
    // Display success or error messages if present
    String message = request.getParameter("message");
    String error = request.getParameter("error");
    if (message != null) { 
    %>
        <div id="successMsg" style="background:#d4edda;color:#155724;padding:15px;border-radius:5px;margin-bottom:20px;text-align:center;font-weight:bold;">
            <%= message %>
        </div>
        <script>
            setTimeout(function() {
                document.getElementById('successMsg').style.display = 'none';
            }, 4000);
        </script>
    <% } %>
    <% if (error != null) { %>
        <div id="errorMsg" style="background:#f8d7da;color:#721c24;padding:15px;border-radius:5px;margin-bottom:20px;text-align:center;font-weight:bold;">
            <%= error %>
        </div>
        <script>
            setTimeout(function() {
                document.getElementById('errorMsg').style.display = 'none';
            }, 4000);
        </script>
    <% } %>
    <h1>Manage Quizzes</h1>
    <!-- Action Buttons for Quiz Management -->
    <div class="action-buttons">
        <form action="<%= request.getContextPath() %>/view/addquiz.jsp" method="get">
            <button class="btn">Add Quiz</button>
        </form>
        <button class="btn" onclick="beforeedit(); return false;">Edit Quiz</button>
        <form action="<%= request.getContextPath() %>/view/deletequiz.jsp" method="get">
            <button class="btn">Delete Quiz</button>
        </form>
    </div>
</div>

<!-- Edit Quiz Prompt Script -->
<script>
function beforeedit() {
  var id = prompt('Enter the Question ID you want to edit:');
  if (id && !isNaN(id)) {
    window.location.href = '<%= request.getContextPath() %>/EditQuizServlet?id=' + id;
  }
}
</script>

</body>
</html>
