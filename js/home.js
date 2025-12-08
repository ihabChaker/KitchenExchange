import { Omk } from '../modules/omk.js';

// Initialize Omeka client
const omk = new Omk({
    api: 'http://localhost/omk_thyp_25-26_clone/api/',
    ident: 'q94woTAaTNH186HmJ4F6ykBecD1KAEfI',
    key: 'mCR2PBA6Us9gTZ4d6EuPdKsARjKIPxmz',
    mail: 'benakchaihab@gmail.com',
    vocabs: ['ke', 'dcterms', 'foaf']
});

// Initialize
omk.init();

// Slideshow functionality
let currentSlide = 0;
const slides = document.querySelectorAll('.slide');
const totalSlides = slides.length;

// Create dots
const dotsContainer = document.querySelector('.slide-dots');
for (let i = 0; i < totalSlides; i++) {
    const dot = document.createElement('div');
    dot.className = i === 0 ? 'dot active' : 'dot';
    dot.onclick = () => goToSlide(i);
    dotsContainer.appendChild(dot);
}

function changeSlide(direction) {
    currentSlide += direction;
    if (currentSlide >= totalSlides) currentSlide = 0;
    if (currentSlide < 0) currentSlide = totalSlides - 1;
    updateSlideshow();
}

function goToSlide(index) {
    currentSlide = index;
    updateSlideshow();
}

function updateSlideshow() {
    slides.forEach((slide, index) => {
        slide.classList.toggle('active', index === currentSlide);
    });

    document.querySelectorAll('.dot').forEach((dot, index) => {
        dot.classList.toggle('active', index === currentSlide);
    });
}

// Auto-advance slideshow
setInterval(() => changeSlide(1), 5000);

// Make changeSlide global for inline onclick
window.changeSlide = changeSlide;

// Search functionality
window.searchRecipes = function () {
    const query = document.getElementById('searchInput').value;
    if (query.trim()) {
        window.location.href = `recipes.html?search=${encodeURIComponent(query)}`;
    }
};

// Load featured recipes
async function loadFeaturedRecipes() {
    try {
        const recipeClass = omk.getClassByTerm('ke:Recipe');
        if (!recipeClass) {
            console.error('Recipe class not found');
            return;
        }

        const recipes = await omk.getItems({
            resource_class_id: recipeClass['o:id'],
            per_page: 6
        });

        displayRecipes(recipes);
        updateCategoryCounts();
    } catch (error) {
        console.error('Error loading recipes:', error);
        document.getElementById('featuredRecipes').innerHTML =
            '<div class="loading">Erreur lors du chargement des recettes</div>';
    }
}

function displayRecipes(recipes) {
    const container = document.getElementById('featuredRecipes');

    if (!recipes || recipes.length === 0) {
        container.innerHTML = '<div class="loading">Aucune recette disponible</div>';
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

async function updateCategoryCounts() {
    try {
        const recipeClass = omk.getClassByTerm('ke:Recipe');
        if (!recipeClass) return;

        // In a real implementation, you would filter by actual categories
        // For now, using difficulty as a proxy for categories
        const allRecipes = await omk.getItems({
            resource_class_id: recipeClass['o:id'],
            per_page: 1000
        });

        // Count recipes by difficulty (1=Entrées, 2=Plats, 3=Desserts, 4=Boissons)
        const counts = { 1: 0, 2: 0, 3: 0, 4: 0 };
        allRecipes.forEach(recipe => {
            const difficulty = getPropertyValue(recipe, 'ke:difficulty') || '2';
            counts[difficulty] = (counts[difficulty] || 0) + 1;
        });

        document.getElementById('cat-entrees').textContent = `${counts[1]} recettes`;
        document.getElementById('cat-plats').textContent = `${counts[2]} recettes`;
        document.getElementById('cat-desserts').textContent = `${counts[3]} recettes`;
        document.getElementById('cat-boissons').textContent = `${counts[4]} recettes`;
    } catch (error) {
        console.error('Error updating category counts:', error);
    }
}

// Load social media links
async function loadSocialLinks() {
    try {
        const socialClass = omk.getClassByTerm('ke:SocialMediaLink');
        if (!socialClass) return;

        const links = await omk.getItems({
            resource_class_id: socialClass['o:id']
        });

        const container = document.getElementById('socialLinks');
        if (links && links.length > 0) {
            container.innerHTML = links.map(link => {
                const name = getPropertyValue(link, 'ke:name') || link['o:title'];
                const url = getPropertyValue(link, 'ke:link') || '#';
                return `<a href="${url}" class="social-link" title="${name}" target="_blank">📱</a>`;
            }).join('');
        }
    } catch (error) {
        console.error('Error loading social links:', error);
    }
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

// Initialize page
document.addEventListener('DOMContentLoaded', () => {
    loadFeaturedRecipes();
    loadSocialLinks();
});
