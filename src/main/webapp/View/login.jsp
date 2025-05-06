<%@ page contentType="text/html" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
<div class="container">
    <h2>Login</h2>
    <form action="../LoginServlet" method="post">
        <input type="email" name="email" placeholder="Email" required><br>
        <input type="password" name="password" placeholder="Password" required><br>
        <button type="submit">Login</button>
        <p>Don't have an account? <a href="register.jsp">Register here</a></p>
    </form>
</div>
</body>
</html>
