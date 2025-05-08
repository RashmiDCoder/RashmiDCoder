<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Quiz Categories</title>
  <link rel="stylesheet" href="css/styles.css">
  <style>
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
    <a href="home.jsp">Home</a>
    <a href="category.jsp">Category</a>
    <a href="rules.jsp">Rules</a>
    <a href="aboutus.jsp">About Us</a>
  </nav>
  <div class="user-info">Hello, <strong>USERNAME</strong></div>
</header>

<!-- Category Section -->
<div class="category-main">
  <h1 class="category-heading">Choose a Quiz Category</h1>

  <div class="category-grid">
    <div class="category-card" data-category-id="1">
      <div class="category-img-container">
        <img src="images/gk.jpg" alt="General Knowledge" class="category-img">
      </div>
      <p class="category-name">General Knowledge</p>
    </div>

    <div class="category-card" data-category-id="2">
      <div class="category-img-container">
        <img src="images/science.jpg" alt="Science" class="category-img">
      </div>
      <p class="category-name">Science</p>
    </div>

    <div class="category-card" data-category-id="3">
      <div class="category-img-container">
        <img src="images/history.jpg" alt="History" class="category-img">
      </div>
      <p class="category-name">History</p>
    </div>

    <div class="category-card" data-category-id="4">
      <div class="category-img-container">
        <img src="images/geography.jpg" alt="Geography" class="category-img">
      </div>
      <p class="category-name">Geography</p>
    </div>

    <div class="category-card" data-category-id="5">
      <div class="category-img-container">
        <img src="images/sports.jpg" alt="Sports" class="category-img">
      </div>
      <p class="category-name">Sports</p>
    </div>

    <div class="category-card" data-category-id="6">
      <div class="category-img-container">
        <img src="images/technology.jpg" alt="Technology" class="category-img">
      </div>
      <p class="category-name">Technology & Computers</p>
    </div>

    <div class="category-card" data-category-id="7">
      <div class="category-img-container">
        <img src="images/literature.jpg" alt="Literature" class="category-img">
      </div>
      <p class="category-name">Literature</p>
    </div>

    <div class="category-card" data-category-id="8">
      <div class="category-img-container">
        <img src="images/culture.jpg" alt="Art & Culture" class="category-img">
      </div>
      <p class="category-name">Culture</p>
    </div>
  </div>
</div>

<script>
  document.querySelectorAll('.category-card').forEach(card => {
    card.addEventListener('click', function () {
      const categoryId = this.getAttribute('data-category-id');
      window.location.href = "QuestionsServlet?categoryId=" + categoryId;
    });
  });
</script>

</body>
</html>
