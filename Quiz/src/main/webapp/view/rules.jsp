<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Quizard • Rules</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css" />
</head>
<body>
<!-- Navigation Bar -->
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

<!-- Rules Section -->
<div class="container rules-container" style="padding-top: 100px;">
    <div class="content-box">
        <h1 class="rules-title">Quiz Rules</h1>
        <!-- List of Rules -->
        <ul class="rules-list">
            <li> You need to choose an option in 10 seconds.</li>
            <li> If no option is chosen, it will automatically go to the next question.</li>
            <li> All your correct answers will be collected, and the result will be shown at the end.</li>
            <li> Timer will start after pressing the start button.</li>
        </ul>
    </div>
</div>
</body>
</html>
