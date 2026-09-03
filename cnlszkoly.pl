<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Strona Główna</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <header>
    <h1>Witamy na naszej stronie</h1>
    <nav>
      <ul>
        <li><a href="#">Strona główna</a></li>
        <li><a href="#">O nas</a></li>
        <li><a href="#">Kontakt</a></li>
      </ul>
    </nav>
  </header>

  <main>
    <section class="search-bar">
      <input type="text" placeholder="Szukaj...">
      <button>Szukaj</button>
    </section>

    <section class="add-review">
      <div id="reviews-container"></div>

      <h2>Dodaj swoją recenzję</h2>
      <form id="review-form">
        <input type="text" id="reviewer-name" placeholder="Twoje imię" required>
        <textarea id="review-text" placeholder="Twoja recenzja" required></textarea>
        <button type="submit">Dodaj</button>
      </form>
    </section>
  </main>

  <script>
    document.addEventListener('DOMContentLoaded', loadReviews);

    document.getElementById('review-form').addEventListener('submit', function(e) {
      e.preventDefault();

      const nameInput = document.getElementById('reviewer-name');
      const textInput = document.getElementById('review-text');
      const name = nameInput.value.trim();
      const text = textInput.value.trim();

      if (name === '' || text === '') {
        alert('Proszę wypełnić wszystkie pola.');
        return;
      }

      const review = { name, text };
      saveReview(review);
      renderReview(review);

      document.getElementById('review-form').reset();
    });

    function saveReview(review) {
      let reviews = JSON.parse(localStorage.getItem('reviews')) || [];
      reviews.push(review);
      localStorage.setItem('reviews', JSON.stringify(reviews));
    }

    function loadReviews() {
      let reviews = JSON.parse(localStorage.getItem('reviews')) || [];
      reviews.forEach(renderReview);
    }

    function renderReview(review) {
      const container = document.getElementById('reviews-container');
      const div = document.createElement('div');
      div.className = 'review-item';
      div.innerHTML = `<p><strong>${review.name}</strong>: ${review.text}</p>`;
      container.appendChild(div);
    }
  </script>
</body>
</html>
