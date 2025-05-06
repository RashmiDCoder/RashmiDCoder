<%@ page contentType="text/html" %>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
<div class="container">
    <h2>Register</h2>
    <form action="../RegisterServlet" method="post">
        <input type="text" name="name" placeholder="Full Name" required><br>
        <input type="email" name="email" placeholder="Email" required><br>
        <input type="password" name="password" placeholder="Password" required><br>
        <select name="role" required>
            <option value="user">User</option>
            <option value="admin">Admin</option>
        </select><br>
        <button type="submit">Register</button>
        <p>Already have an account? <a href="login.jsp">Login</a></p>
    </form>
</div>
</body>
</html>