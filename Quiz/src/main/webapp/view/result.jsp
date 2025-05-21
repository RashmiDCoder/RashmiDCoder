<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Quiz Result</title>
    <style>
        /* Quiz Result Page Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            text-align: center;
        }
        h1 {
            color: #333;
            margin-bottom: 30px;
        }
        .score {
            font-size: 24px;
            color: #2c3e50;
            margin: 20px 0;
            padding: 15px;
            background: #f8f9fa;
            border-radius: 5px;
        }
        .message {
            font-size: 18px;
            color: #666;
            margin: 20px 0;
        }
        .success {
            color: #27ae60;
        }
        .try-again {
            color: #e74c3c;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #2980b9;
        }
    </style>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css">
</head>
<body>
    <!-- Quiz Result Container -->
    <div class="container">
        <h1>Quiz Result</h1>
        
        <!-- Display Score -->
        <div class="score">
            Your Score: ${score} out of ${total}
        </div>
        
        <!-- Display Pass/Fail Message -->
        <div class="message">
            <% 
            Integer score = (Integer) request.getAttribute("score");
            Integer total = (Integer) request.getAttribute("total");
            // Calculate and display message based on percentage
            if (score != null && total != null) {
                double percentage = (double) score / total * 100;
                if (percentage >= 70) { %>
                    <p class="success">Congratulations! You passed the quiz!</p>
                <% } else { %>
                    <p class="try-again">Keep practicing! You can do better next time!</p>
                <% } %>
            <% } %>
        </div>
        
        <!-- Navigation Buttons -->
        <div>
            <a href="<%= request.getContextPath() %>/view/home.jsp" class="btn">Back to Home</a>
            <a href="<%= request.getContextPath() %>/view/category.jsp" class="btn">Take Another Quiz</a>
        </div>
    </div>
</body>
</html> 