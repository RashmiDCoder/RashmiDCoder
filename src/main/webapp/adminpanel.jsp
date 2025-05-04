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
    </style>
</head>
<body>

<nav>
    <h2>Welcome, Admin</h2>

    <a href="login.jsp">LOGOUT </a>
</nav>

<div class="center-content">
    <h1>Manage Quizzes</h1>
    <div class="action-buttons">
        <form action="addquiz.jsp" method="get">
            <button class="btn">Add Quiz</button>
        </form>
        <form action="editquiz.jsp" method="get">
            <button class="btn">Edit Quiz</button>
        </form>
        <form action="deletequiz.jsp" method="get">
            <button class="btn">Delete Quiz</button>
        </form>
    </div>
</div>

</body>
</html>
