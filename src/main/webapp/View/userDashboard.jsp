<%@ page contentType="text/html" %>
<html>
<head>
    <title>User Dashboard</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
<%
    Cookie[] cookies = request.getCookies();
    String userEmail = "";
    if (cookies != null) {
        for (Cookie c : cookies) {
            if (c.getName().equals("userEmail")) {
                userEmail = c.getValue();
            }
        }
    }
%>

<h3>Welcome, <%= userEmail %></h3>

<div class="container">
    <h1>Welcome User</h1>
    <p>This is your dashboard.</p>
    <a href="login.jsp">Logout</a>
</div>
</body>
</html>