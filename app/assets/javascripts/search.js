document.getElementById('search-form').addEventListener('submit', event => {
    event.preventDefault();
    updateSearchResults();
});

document.getElementById('search-input').addEventListener('input', updateSearchResults);

function updateSearchResults() {
    const searchInput = document.getElementById('search-input');
    const searchResultsContainer = document.getElementById('search-results');
    const query = searchInput.value.trim();
    if (query.length === 0) {
        searchResultsContainer.innerHTML = '';
        return;
    }
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
                    const created_at = new Date(article.created_at)
                    return `
                    <a href="/articles/${article.id}" style="text-decoration: none;">
                        <li class="list-group-item  border-0">
                            <div class="card border-0 shadow d-flex flex-row justify-content-between align-items-start">
                                <div class="card-body">
                                    <h4 class="card-title mb-3">${article.title} by ${article.author.name}</h4>
                                    <p class="card-text">${article.content.slice(0,100)} ${article.content.length>100 ? "......":""} </p>
                                </div>
                                <div class="d-flex flex-column align-items-start justify-content-between mt-3 mx-4">
                                    <span class="badge bg-primary rounded-pill mb-2">Searched Hits: ${article.searched_hits}</span>
                                    <span class="badge bg-primary rounded-pill">Creation Date: ${created_at.getFullYear()} - ${created_at.getMonth() + 1} - ${created_at.getDate()}</span>
                                </div>
                            </div>
                        </li>
                    </a>
                `
                }).join('');
            }
            searchResultsContainer.innerHTML = articlesHTML;
        })
        .catch(error => {
            console.error('Error occurred while fetching search results:', error);
        });
}