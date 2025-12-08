import { Omk } from '../modules/omk.js';

// Initialize Omeka client
const omk = new Omk({
    api: 'http://localhost/omk_thyp_25-26_clone/api/',
    ident: 'neecG2mXbk1MDcdL4t2vnYx3BxtVL0OM',
    key: 'KrpZ7cl2tRCoYhpIC7zVkbLOpSKONsPx',
    mail: 'samuel.szoniecky@univ-paris8.fr',
    vocabs: ['ke', 'dcterms', 'foaf']
});

omk.init();

let currentRecipe = null;
let currentRating = 0;

// Get recipe ID from URL
const urlParams = new URLSearchParams(window.location.search);
const recipeId = urlParams.get('id');

if (!recipeId) {
    window.location.href = 'recipes.html';
}

// Load recipe
async function loadRecipe() {
    try {
        currentRecipe = await omk.getItem(recipeId);
        if (!currentRecipe) {
            throw new Error('Recipe not found');
        }

        displayRecipe(currentRecipe);
        loadIngredients(currentRecipe);
        loadRatings(currentRecipe);
        loadVoiceRecordings(currentRecipe);
    } catch (error) {
        console.error('Error loading recipe:', error);
        document.getElementById('recipeContent').innerHTML = `
            <div class="no-results">
                <div class="no-results-icon">😕</div>
                <h3>Recette introuvable</h3>
                <p>Cette recette n'existe pas ou a été supprimée</p>
                <a href="recipes.html" class="btn-primary" style="margin-top: 20px;">Retour aux recettes</a>
            </div>
        `;
    }
}

function displayRecipe(recipe) {
    console.log('Recipe object:', recipe);
    const name = getPropertyValue(recipe, 'ke:name') || recipe['o:title'] || 'Sans titre';
    const description = getPropertyValue(recipe, 'ke:description') || '';
    console.log('Recipe media:', recipe['o:media']);
    const image = getMediaUrl(recipe) || 'https://images.unsplash.com/photo-1546548970-71785318a17b?w=800';
    console.log('Extracted image URL:', image);
    const prepTime = getPropertyValue(recipe, 'ke:preparationTime') || '-';
    const cookTime = getPropertyValue(recipe, 'ke:cookingTime') || '-';
    const calories = getPropertyValue(recipe, 'ke:calories') || '-';
    const difficulty = getPropertyValue(recipe, 'ke:difficulty') || '2';
    const steps = getPropertyValue(recipe, 'ke:steps') || '';

    const difficultyLabels = { '1': 'Facile', '2': 'Moyen', '3': 'Difficile', '4': 'Expert' };

    // Parse steps (assuming they're separated by newlines or numbers)
    const stepsList = steps.split(/\n+/).filter(s => s.trim());

    const html = `
        <div class="recipe-header">
            <div class="recipe-hero">
                <img src="${image}" alt="${name}" class="recipe-hero-image" onerror="this.src='https://images.unsplash.com/photo-1546548970-71785318a17b?w=800'">
                <div class="recipe-info">
                    <h1>${name}</h1>
                    <p style="color: var(--muted); font-size: 16px; margin-bottom: 16px;">${description}</p>
                    
                    <div class="rating-display" id="ratingDisplay">
                        <div class="stars">
                            ${generateStars(0)}
                        </div>
                        <span class="rating-count">(0 avis)</span>
                    </div>
                    
                    <div class="recipe-stats">
                        <div class="stat-item">
                            <span class="stat-label">Préparation</span>
                            <span class="stat-value">${prepTime} min</span>
                        </div>
                        <div class="stat-item">
                            <span class="stat-label">Cuisson</span>
                            <span class="stat-value">${cookTime} min</span>
                        </div>
                        <div class="stat-item">
                            <span class="stat-label">Calories</span>
                            <span class="stat-value">${calories}</span>
                        </div>
                        <div class="stat-item">
                            <span class="stat-label">Difficulté</span>
                            <span class="stat-value">${difficultyLabels[difficulty]}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="content-section">
            <h2 class="section-title">🥘 Ingrédients</h2>
            <div class="ingredients-list" id="ingredientsList">
                <div class="loading">Chargement des ingrédients...</div>
            </div>
        </div>
        
        <div class="content-section">
            <h2 class="section-title">📝 Étapes de préparation</h2>
            <div class="steps-list">
                ${stepsList.map((step, index) => `
                    <div class="step-item">
                        <div class="step-number">${index + 1}</div>
                        <div class="step-content">${step}</div>
                    </div>
                `).join('')}
            </div>
        </div>
        
        <div class="add-rating-section">
            <h3 class="add-rating-title">⭐ Noter cette recette</h3>
            <div class="rating-input" id="ratingInput">
                ${generateClickableStars()}
            </div>
            <button class="btn-primary" onclick="submitRating()" id="submitRatingBtn" disabled>
                Envoyer ma note
            </button>
        </div>
    `;

    document.getElementById('recipeContent').innerHTML = html;
}

async function loadIngredients(recipe) {
    try {
        // Check if recipe has direct ke:hasIngredient properties
        if (recipe['ke:hasIngredient'] && recipe['ke:hasIngredient'].length > 0) {
            console.log('Using direct ke:hasIngredient properties');
            const ingredientsHtml = await Promise.all(recipe['ke:hasIngredient'].map(async ing => {
                let ingredientName = ing['display_title'] || 'Ingrédient';
                let isHealthy = false;

                // Try to load full ingredient details
                if (ing['value_resource_id']) {
                    try {
                        const ingredient = await omk.getItem(ing['value_resource_id']);
                        ingredientName = getPropertyValue(ingredient, 'ke:name') || ingredient['o:title'] || ingredientName;
                        isHealthy = getPropertyValue(ingredient, 'ke:isHealthy') === 'true';
                    } catch (e) {
                        console.error('Error loading ingredient details:', e);
                    }
                }

                return `
                    <div class="ingredient-item">
                        <span class="ingredient-icon">${isHealthy ? '🥬' : '🧂'}</span>
                        <div class="ingredient-details">
                            <div class="ingredient-name">${ingredientName}</div>
                        </div>
                    </div>
                `;
            }));

            document.getElementById('ingredientsList').innerHTML = ingredientsHtml.join('');
            return;
        }

        // Otherwise, try to find RecipeIngredient junction items
        const recipeIngredientClass = omk.getClassByTerm('ke:RecipeIngredient');
        console.log('RecipeIngredient class:', recipeIngredientClass);
        if (!recipeIngredientClass) {
            console.error('RecipeIngredient class not found!');
            document.getElementById('ingredientsList').innerHTML = '<p>Aucun ingrédient trouvé</p>';
            return;
        }

        // Get all RecipeIngredient items
        console.log('Fetching all RecipeIngredient items with class ID:', recipeIngredientClass['o:id']);
        const allRecipeIngredients = await omk.getItems({
            resource_class_id: recipeIngredientClass['o:id'],
            per_page: 1000
        });
        console.log('All RecipeIngredient items:', allRecipeIngredients);

        // Filter for this recipe
        const recipeIngredients = allRecipeIngredients.filter(ri => {
            console.log('RecipeIngredient item:', ri);
            console.log('ke:recipe property:', ri['ke:recipe']);
            const recipeLink = getPropertyResource(ri, 'ke:recipe');
            console.log('Parsed recipe link:', recipeLink, 'Looking for ID:', recipeId);
            return recipeLink && recipeLink['o:id'] === parseInt(recipeId);
        });
        console.log('Filtered RecipeIngredients for this recipe:', recipeIngredients);

        if (recipeIngredients.length === 0) {
            document.getElementById('ingredientsList').innerHTML = '<p>Aucun ingrédient spécifié</p>';
            return;
        }

        // Load ingredient details
        const ingredientsHtml = await Promise.all(recipeIngredients.map(async ri => {
            console.log('Processing RecipeIngredient:', ri);
            const ingredientLink = getPropertyResource(ri, 'ke:ingredient');
            console.log('Ingredient link:', ingredientLink);
            const quantity = getPropertyValue(ri, 'ke:quantity') || '';
            const note = getPropertyValue(ri, 'ke:note') || '';

            let ingredientName = 'Ingrédient';
            let isHealthy = false;

            if (ingredientLink && ingredientLink['o:id']) {
                try {
                    const ingredient = await omk.getItem(ingredientLink['o:id']);
                    ingredientName = getPropertyValue(ingredient, 'ke:name') || ingredient['o:title'] || 'Ingrédient';
                    isHealthy = getPropertyValue(ingredient, 'ke:isHealthy') === 'true';
                } catch (e) {
                    console.error('Error loading ingredient:', e);
                }
            }

            return `
                <div class="ingredient-item">
                    <span class="ingredient-icon">${isHealthy ? '🥬' : '🧂'}</span>
                    <div class="ingredient-details">
                        <div class="ingredient-name">${ingredientName}</div>
                        <div class="ingredient-quantity">${quantity}${note ? ` - ${note}` : ''}</div>
                    </div>
                </div>
            `;
        }));

        document.getElementById('ingredientsList').innerHTML = ingredientsHtml.join('');
    } catch (error) {
        console.error('Error loading ingredients:', error);
        document.getElementById('ingredientsList').innerHTML = '<p>Erreur lors du chargement des ingrédients</p>';
    }
}

async function loadRatings(recipe) {
    try {
        const ratingClass = omk.getClassByTerm('ke:Rating');
        if (!ratingClass) return;

        const allRatings = await omk.getItems({
            resource_class_id: ratingClass['o:id'],
            per_page: 1000
        });

        // Filter ratings for this recipe
        const recipeRatings = allRatings.filter(rating => {
            const ratesRecipe = getPropertyResource(rating, 'ke:ratesRecipe');
            return ratesRecipe && ratesRecipe['o:id'] === parseInt(recipeId);
        });

        if (recipeRatings.length === 0) {
            return;
        }

        // Calculate average rating
        const total = recipeRatings.reduce((sum, rating) => {
            const value = parseInt(getPropertyValue(rating, 'ke:ratingValue') || '0');
            return sum + value;
        }, 0);

        const average = total / recipeRatings.length;

        // Update rating display
        document.getElementById('ratingDisplay').innerHTML = `
            <div class="stars">
                ${generateStars(average)}
            </div>
            <span class="rating-count">(${recipeRatings.length} avis - ${average.toFixed(1)}/5)</span>
        `;
    } catch (error) {
        console.error('Error loading ratings:', error);
    }
}

async function loadVoiceRecordings(recipe) {
    try {
        // Voice recordings are stored as media items with title starting with recipe ID or linked to recipe
        const mediaItems = recipe['o:media'] || [];

        if (mediaItems.length === 0) {
            document.getElementById('voiceRecordings').innerHTML = '<p>Aucun avis vocal pour le moment</p>';
            return;
        }

        const voiceHtml = mediaItems.map((media, index) => {
            const mediaUrl = media['o:original_url'] || media['@id'];
            const title = media['o:title'] || `Avis vocal ${index + 1}`;

            return `
                <div class="voice-item">
                    <span>🎙️</span>
                    <div style="flex: 1;">
                        <div style="font-weight: 600; margin-bottom: 4px;">${title}</div>
                        <audio controls style="width: 100%;">
                            <source src="${mediaUrl}" type="audio/webm">
                            <source src="${mediaUrl}" type="audio/mp4">
                            Votre navigateur ne supporte pas l'audio.
                        </audio>
                    </div>
                </div>
            `;
        }).join('');

        document.getElementById('voiceRecordings').innerHTML = voiceHtml || '<p>Aucun avis vocal pour le moment</p>';
    } catch (error) {
        console.error('Error loading voice recordings:', error);
        document.getElementById('voiceRecordings').innerHTML = '<p>Erreur lors du chargement des avis vocaux</p>';
    }
}

function generateStars(rating) {
    let html = '';
    for (let i = 1; i <= 5; i++) {
        html += `<span class="star ${i <= Math.round(rating) ? '' : 'empty'}">★</span>`;
    }
    return html;
}

function generateClickableStars() {
    let html = '';
    for (let i = 1; i <= 5; i++) {
        html += `<span class="star empty" data-rating="${i}" onclick="selectRating(${i})">★</span>`;
    }
    return html;
}

window.selectRating = function (rating) {
    currentRating = rating;

    // Update visual
    document.querySelectorAll('#ratingInput .star').forEach((star, index) => {
        if (index < rating) {
            star.classList.remove('empty');
        } else {
            star.classList.add('empty');
        }
    });

    // Enable submit button
    document.getElementById('submitRatingBtn').disabled = false;
};

window.submitRating = async function () {
    if (currentRating === 0) return;

    try {
        const ratingClass = omk.getClassByTerm('ke:Rating');
        if (!ratingClass) {
            throw new Error('Rating class not found');
        }

        const ratingData = {
            'o:resource_class': { 'o:id': ratingClass['o:id'] },
            'o:resource_template': { 'o:id': omk.getRtId('Rating') },
            'ke:ratingValue': [{ '@value': currentRating.toString(), 'type': 'literal' }],
            'ke:ratesRecipe': [{ 'value_resource_id': parseInt(recipeId), 'type': 'resource' }]
        };

        await omk.createItem(ratingData);

        // Show success message
        alert('Merci pour votre avis !');

        // Reload ratings
        loadRatings(currentRecipe);

        // Reset rating input
        currentRating = 0;
        document.querySelectorAll('#ratingInput .star').forEach(star => {
            star.classList.add('empty');
        });
        document.getElementById('submitRatingBtn').disabled = true;
    } catch (error) {
        console.error('Error submitting rating:', error);
        alert('Erreur lors de l\'envoi de votre avis');
    }
};

// Helper functions
function getPropertyValue(item, propertyTerm) {
    if (!item || !item[propertyTerm]) return null;
    const prop = item[propertyTerm];
    if (Array.isArray(prop) && prop.length > 0) {
        return prop[0]['@value'] || prop[0]['o:label'] || null;
    }
    return null;
}

function getPropertyResource(item, propertyTerm) {
    if (!item || !item[propertyTerm]) return null;
    const prop = item[propertyTerm];
    if (Array.isArray(prop) && prop.length > 0) {
        const first = prop[0];
        // Handle different formats: value_resource_id, @id reference, or direct o:id
        if (first['value_resource_id']) {
            return { 'o:id': first['value_resource_id'] };
        } else if (first['@id']) {
            // Extract ID from URL like "http://localhost/omk/api/items/123"
            const match = first['@id'].match(/\/(\d+)$/);
            return match ? { 'o:id': parseInt(match[1]) } : null;
        } else if (first['o:id']) {
            return { 'o:id': first['o:id'] };
        }
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
document.addEventListener('DOMContentLoaded', loadRecipe);
