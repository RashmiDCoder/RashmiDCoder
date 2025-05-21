<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Quiz Categories</title>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css">
  <style>
    /* Category Card Styles */
    .category-card {
      cursor: pointer;
      transition: transform 0.2s ease, box-shadow 0.2s ease;
    }

    .category-card:hover {
      transform: scale(1.05);
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    }
  </style>
</head>
<body>

<!-- Navbar -->
<header>
  <div class="logo-small">Quizard</div>
  <nav>
    <a href="<%= request.getContextPath() %>/view/home.jsp">Home</a>
    <a href="<%= request.getContextPath() %>/view/category.jsp">Category</a>
    <a href="<%= request.getContextPath() %>/view/rules.jsp">Rules</a>
    <a href="<%= request.getContextPath() %>/view/aboutus.jsp">About Us</a>
  </nav>
  <!-- Display username (replace USERNAME placeholder) -->
  <div class="user-info">Hello, <strong>USERNAME</strong></div>
</header>

<!-- Category Selection Section -->
<div class="category-main">
  <h1 class="category-heading">Choose a Quiz Category</h1>

  <!-- Category Grid -->
  <div class="category-grid">
    <!-- Category Card: General Knowledge -->
    <div class="category-card" data-category-id="1">
      <div class="category-img-container">
        <a href="<%= request.getContextPath() %>/QuestionsServlet?categoryId=1">
          <img src="<%= request.getContextPath() %>/images/gk.jpg" alt="General Knowledge" class="category-img">
        </a>
      </div>
      <p class="category-name">General Knowledge</p>
    </div>

    <!-- Category Card: Science -->
    <div class="category-card" data-category-id="2">
      <div class="category-img-container">
        <a href="<%= request.getContextPath() %>/QuestionsServlet?categoryId=2">
          <img src="<%= request.getContextPath() %>/images/science.jpg" alt="Science" class="category-img">
        </a>
      </div>
      <p class="category-name">Science</p>
    </div>

    <!-- Category Card: History -->
    <div class="category-card" data-category-id="3">
      <div class="category-img-container">
        <a href="<%= request.getContextPath() %>/QuestionsServlet?categoryId=3">
          <img src="<%= request.getContextPath() %>/images/history.jpg" alt="History" class="category-img">
        </a>
      </div>
      <p class="category-name">History</p>
    </div>

    <!-- Category Card: Geography -->
    <div class="category-card" data-category-id="4">
      <div class="category-img-container">
        <a href="<%= request.getContextPath() %>/QuestionsServlet?categoryId=4">
          <img src="<%= request.getContextPath() %>/images/geography.jpg" alt="Geography" class="category-img">
        </a>
      </div>
      <p class="category-name">Geography</p>
    </div>

    <!-- Category Card: Sports -->
    <div class="category-card" data-category-id="5">
      <div class="category-img-container">
        <a href="<%= request.getContextPath() %>/QuestionsServlet?categoryId=5">
          <img src="<%= request.getContextPath() %>/images/sports.jpg" alt="Sports" class="category-img">
        </a>
      </div>
      <p class="category-name">Sports</p>
    </div>

    <!-- Category Card: Technology -->
    <div class="category-card" data-category-id="6">
      <div class="category-img-container">
        <a href="<%= request.getContextPath() %>/QuestionsServlet?categoryId=6">
          <img src="<%= request.getContextPath() %>/images/technology.jpg" alt="Technology & Computers" class="category-img">
        </a>
      </div>
      <p class="category-name">Technology & Computers</p>
    </div>

    <!-- Category Card: Literature -->
    <div class="category-card" data-category-id="7">
      <div class="category-img-container">
        <a href="<%= request.getContextPath() %>/QuestionsServlet?categoryId=7">
          <img src="<%= request.getContextPath() %>/images/literature.jpg" alt="Literature" class="category-img">
        </a>
      </div>
      <p class="category-name">Literature</p>
    </div>

    <!-- Category Card: Art & Culture -->
    <div class="category-card" data-category-id="8">
      <div class="category-img-container">
        <a href="<%= request.getContextPath() %>/QuestionsServlet?categoryId=8">
          <img src="<%= request.getContextPath() %>/images/culture.jpg" alt="Art & Culture" class="category-img">
        </a>
      </div>
      <p class="category-name">Culture</p>
    </div>
  </div>
</div>

<!-- JavaScript for Category Card Click Handling -->
<script>
  document.querySelectorAll('.category-card').forEach(card => {
    card.addEventListener('click', function () {
      const categoryId = this.getAttribute('data-category-id');
      // Redirect to QuestionsServlet with category ID
      window.location.href = "<%= request.getContextPath() %>/QuestionsServlet?categoryId=" + categoryId;
    });
  });
</script>

</body>
</html>
