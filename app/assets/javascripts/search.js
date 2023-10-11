const searchForm = document.getElementById('search-form');
const searchInput = document.getElementById('search-input');
const searchResultsContainer = document.getElementById('search-results');

searchForm.addEventListener('submit', event => {
    event.preventDefault();
    updateSearchResults();
});

searchInput.addEventListener('input', updateSearchResults);

function updateSearchResults() {
    const query = searchInput.value.trim();

    if (query.length === 0) {
        searchResultsContainer.innerHTML = '';
        return;
    }
    console.log(query);
    const authenticityToken = document.querySelector('[name="csrf-token"]').content;
    const options = {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': authenticityToken,
        },
        body: JSON.stringify({ query }),
    };

    fetch(`/search?query=${encodeURIComponent(query)}`, options)
        .then(response => response.json())
        .then(data => {
            const articles = data.articles;
            let articlesHTML = '';
            if (!articles.length) {
                articlesHTML = `
                    <p class="card-text">No articles found.</p>
                `
            } else {

                articlesHTML = articles.map(article => {

                    return `<div class="card-body">
                  <h4 class="card-title">${article.title}</h4>
                  <p class="card-text">${article.content}</p>
                </div>`;
                }).join('');
            }
            searchResultsContainer.innerHTML = articlesHTML;
        })
        .catch(error => {
            console.error('Error occurred while fetching search results:', error);
        });
}