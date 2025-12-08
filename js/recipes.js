import { Omk } from '../modules/omk.js';

// Initialize Omeka client
const omk = new Omk({
    api: 'http://localhost/omk_thyp_25-26_clone/api/',
    ident: 'q94woTAaTNH186HmJ4F6ykBecD1KAEfI',
    key: 'mCR2PBA6Us9gTZ4d6EuPdKsARjKIPxmz',
    mail: 'benakchaihab@gmail.com',
    vocabs: ['ke', 'dcterms', 'foaf']
});

omk.init();

let allRecipes = [];
let filteredRecipes = [];

// Load recipes
async function loadRecipes() {
    try {
        const recipeClass = omk.getClassByTerm('ke:Recipe');
        if (!recipeClass) {
            throw new Error('Recipe class not found');
        }

        allRecipes = await omk.getItems({
            resource_class_id: recipeClass['o:id'],
            per_page: 1000
        });

        // Check URL parameters
        const urlParams = new URLSearchParams(window.location.search);
        const searchQuery = urlParams.get('search');
        const difficulty = urlParams.get('difficulty');

        if (searchQuery) {
            document.getElementById('searchInput').value = searchQuery;
        }
        if (difficulty) {
            document.getElementById('difficultyFilter').value = difficulty;
        }

        applyFilters();
    } catch (error) {
        console.error('Error loading recipes:', error);
        document.getElementById('recipesGrid').innerHTML =
            '<div class="no-results"><div class="no-results-icon">😕</div><h3>Erreur lors du chargement</h3><p>Impossible de charger les recettes</p></div>';
    }
}

window.applyFilters = function () {
    const searchTerm = document.getElementById('searchInput').value.toLowerCase();
    const difficulty = document.getElementById('difficultyFilter').value;
    const maxPrepTime = document.getElementById('prepTimeFilter').value;
    const maxCalories = document.getElementById('caloriesFilter').value;

    filteredRecipes = allRecipes.filter(recipe => {
        // Search filter
        if (searchTerm) {
            const name = getPropertyValue(recipe, 'ke:name') || recipe['o:title'] || '';
            const description = getPropertyValue(recipe, 'ke:description') || '';
            if (!name.toLowerCase().includes(searchTerm) &&
                !description.toLowerCase().includes(searchTerm)) {
                return false;
            }
        }

        // Difficulty filter
        if (difficulty) {
            const recipeDifficulty = getPropertyValue(recipe, 'ke:difficulty') || '';
            if (recipeDifficulty !== difficulty) {
                return false;
            }
        }

        // Prep time filter
        if (maxPrepTime) {
            const prepTime = parseInt(getPropertyValue(recipe, 'ke:preparationTime') || '0');
            if (prepTime > parseInt(maxPrepTime)) {
                return false;
            }
        }

        // Calories filter
        if (maxCalories) {
            const calories = parseInt(getPropertyValue(recipe, 'ke:calories') || '0');
            if (calories > parseInt(maxCalories)) {
                return false;
            }
        }

        return true;
    });

    sortRecipes();
};

window.sortRecipes = function () {
    const sortBy = document.getElementById('sortSelect').value;

    const sorted = [...filteredRecipes].sort((a, b) => {
        switch (sortBy) {
            case 'name':
                const nameA = getPropertyValue(a, 'ke:name') || a['o:title'] || '';
                const nameB = getPropertyValue(b, 'ke:name') || b['o:title'] || '';
                return nameA.localeCompare(nameB);

            case 'prepTime':
                const prepA = parseInt(getPropertyValue(a, 'ke:preparationTime') || '999');
                const prepB = parseInt(getPropertyValue(b, 'ke:preparationTime') || '999');
                return prepA - prepB;

            case 'calories':
                const calA = parseInt(getPropertyValue(a, 'ke:calories') || '999999');
                const calB = parseInt(getPropertyValue(b, 'ke:calories') || '999999');
                return calA - calB;

            case 'recent':
            default:
                return b['o:id'] - a['o:id'];
        }
    });

    displayRecipes(sorted);
};

window.resetFilters = function () {
    document.getElementById('searchInput').value = '';
    document.getElementById('difficultyFilter').value = '';
    document.getElementById('prepTimeFilter').value = '';
    document.getElementById('caloriesFilter').value = '';
    document.getElementById('sortSelect').value = 'recent';

    // Clear URL parameters
    window.history.pushState({}, '', 'recipes.html');

    applyFilters();
};

function displayRecipes(recipes) {
    const container = document.getElementById('recipesGrid');
    const countElement = document.getElementById('resultsCount');

    countElement.textContent = `${recipes.length} recette${recipes.length !== 1 ? 's' : ''} trouvée${recipes.length !== 1 ? 's' : ''}`;

    if (!recipes || recipes.length === 0) {
        container.innerHTML = `
            <div class="no-results">
                <div class="no-results-icon">🔍</div>
                <h3>Aucune recette trouvée</h3>
                <p>Essayez de modifier vos critères de recherche</p>
            </div>
        `;
        return;
    }

    container.innerHTML = recipes.map(recipe => {
        const name = getPropertyValue(recipe, 'ke:name') || recipe['o:title'] || 'Sans titre';
        const description = getPropertyValue(recipe, 'ke:description') || '';
        const image = getMediaUrl(recipe) || 'https://images.unsplash.com/photo-1546548970-71785318a17b?w=400';
        const prepTime = getPropertyValue(recipe, 'ke:preparationTime') || '';
        const cookTime = getPropertyValue(recipe, 'ke:cookingTime') || '';
        const calories = getPropertyValue(recipe, 'ke:calories') || '';
        const difficulty = getPropertyValue(recipe, 'ke:difficulty') || '2';

        const difficultyLabels = { '1': 'Facile', '2': 'Moyen', '3': 'Difficile', '4': 'Expert' };

        return `
            <a href="recipe-detail.html?id=${recipe['o:id']}" class="recipe-card">
                <img src="${image}" alt="${name}" class="recipe-image" onerror="this.src='https://images.unsplash.com/photo-1546548970-71785318a17b?w=400'">
                <div class="recipe-content">
                    <h3 class="recipe-title">${name}</h3>
                    <p class="recipe-description">${description}</p>
                    <div class="recipe-meta">
                        ${prepTime ? `<span class="recipe-meta-item">⏱️ ${prepTime} min</span>` : ''}
                        ${calories ? `<span class="recipe-meta-item">🔥 ${calories} kcal</span>` : ''}
                    </div>
                    <span class="recipe-difficulty difficulty-${difficulty}">
                        ${difficultyLabels[difficulty] || 'Moyen'}
                    </span>
                </div>
            </a>
        `;
    }).join('');
}

// Helper functions
function getPropertyValue(item, propertyTerm) {
    if (!item || !item[propertyTerm]) return null;
    const prop = item[propertyTerm];
    if (Array.isArray(prop) && prop.length > 0) {
        return prop[0]['@value'] || prop[0]['o:label'] || null;
    }
    return null;
}

function getMediaUrl(item) {
    // First try thumbnail_display_urls (most reliable)
    if (item && item['thumbnail_display_urls'] && item['thumbnail_display_urls']['large']) {
        return item['thumbnail_display_urls']['large'];
    }

    // Then try o:primary_media
    if (item && item['o:primary_media'] && item['o:primary_media']['o:id']) {
        try {
            const mediaObj = omk.getMedia(item['o:primary_media']['o:id']);
            if (mediaObj && mediaObj['o:original_url']) {
                return mediaObj['o:original_url'];
            }
        } catch (e) {
            console.error('Error loading primary media:', e);
        }
    }

    // Fallback to first media item
    if (item && item['o:media'] && item['o:media'].length > 0) {
        const media = item['o:media'][0];
        if (media['o:original_url']) {
            return media['o:original_url'];
        } else if (media['o:id']) {
            try {
                const mediaObj = omk.getMedia(media['o:id']);
                return mediaObj['o:original_url'] || null;
            } catch (e) {
                console.error('Error loading media:', e);
                return null;
            }
        }
    }
    return null;
}

// Initialize
document.addEventListener('DOMContentLoaded', loadRecipes);
