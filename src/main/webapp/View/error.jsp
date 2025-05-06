<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <style>
        body {
            background: #fce4e4;
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 50px;
        }
        .error-container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            display: inline-block;
            border: 2px solid #e53935;
        }
        h1 {
            color: #e53935;
        }
        p {
            font-size: 18px;
            color: #555;
        }
        a {
            text-decoration: none;
            color: #2196f3;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="error-container">
    <h1>Access Denied</h1>
    <p><%= request.getParameter("error") %></p>
    <p><a href="login.jsp">Go to Login Page</a></p>
</div>
</body>
</html>