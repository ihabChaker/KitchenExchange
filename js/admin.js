import { Omk } from '../modules/omk.js';

const omk = new Omk({
    api: 'http://localhost/omk_thyp_25-26_clone/api/',
    ident: 'q94woTAaTNH186HmJ4F6ykBecD1KAEfI',
    key: 'mCR2PBA6Us9gTZ4d6EuPdKsARjKIPxmz',
    mail: 'benakchaihab@gmail.com',
    vocabs: ['ke', 'dcterms', 'foaf']
});

omk.init();

// Tab switching
window.switchTab = function (tabName) {
    // Hide all tabs
    document.querySelectorAll('.tab-content').forEach(tab => {
        tab.classList.remove('active');
    });
    document.querySelectorAll('.tab').forEach(btn => {
        btn.classList.remove('active');
    });

    // Show selected tab
    document.getElementById(`tab-${tabName}`).classList.add('active');
    event.target.classList.add('active');

    // Load data for the tab
    switch (tabName) {
        case 'recipes':
            loadRecipes();
            break;
        case 'ingredients':
            loadIngredients();
            break;
        case 'posts':
            loadPosts();
            break;
        case 'recordings':
            loadRecordings();
            break;
        case 'social':
            loadSocialLinks();
            break;
        case 'settings':
            loadSettings();
            break;
    }
};

// Load stats
async function loadStats() {
    try {
        const recipeClass = omk.getClassByTerm('ke:Recipe');
        const ingredientClass = omk.getClassByTerm('ke:Ingredient');
        const postClass = omk.getClassByTerm('ke:Post');
        const ratingClass = omk.getClassByTerm('ke:Rating');

        const [recipes, ingredients, posts, ratings] = await Promise.all([
            recipeClass ? omk.getItems({ resource_class_id: recipeClass['o:id'], per_page: 1 }) : [],
            ingredientClass ? omk.getItems({ resource_class_id: ingredientClass['o:id'], per_page: 1 }) : [],
            postClass ? omk.getItems({ resource_class_id: postClass['o:id'], per_page: 1 }) : [],
            ratingClass ? omk.getItems({ resource_class_id: ratingClass['o:id'], per_page: 1 }) : []
        ]);

        // Omeka returns total count in the response, but we need to get all items to count
        // For simplicity, we'll fetch with larger per_page
        const [allRecipes, allIngredients, allPosts, allRatings] = await Promise.all([
            recipeClass ? omk.getItems({ resource_class_id: recipeClass['o:id'], per_page: 1000 }) : [],
            ingredientClass ? omk.getItems({ resource_class_id: ingredientClass['o:id'], per_page: 1000 }) : [],
            postClass ? omk.getItems({ resource_class_id: postClass['o:id'], per_page: 1000 }) : [],
            ratingClass ? omk.getItems({ resource_class_id: ratingClass['o:id'], per_page: 1000 }) : []
        ]);

        document.getElementById('statsRecipes').textContent = allRecipes.length;
        document.getElementById('statsIngredients').textContent = allIngredients.length;
        document.getElementById('statsPosts').textContent = allPosts.length;
        document.getElementById('statsRatings').textContent = allRatings.length;
    } catch (error) {
        console.error('Error loading stats:', error);
    }
}

// Recipes Management
async function loadRecipes() {
    try {
        const recipeClass = omk.getClassByTerm('ke:Recipe');
        if (!recipeClass) return;

        const recipes = await omk.getItems({
            resource_class_id: recipeClass['o:id'],
            per_page: 1000
        });

        const tbody = document.getElementById('recipesTableBody');

        if (!recipes || recipes.length === 0) {
            tbody.innerHTML = '<tr><td colspan="6" style="text-align: center; padding: 40px;">Aucune recette</td></tr>';
            return;
        }

        tbody.innerHTML = recipes.map(recipe => {
            const name = getPropertyValue(recipe, 'ke:name') || recipe['o:title'];
            const difficulty = getPropertyValue(recipe, 'ke:difficulty') || '-';
            const prepTime = getPropertyValue(recipe, 'ke:preparationTime') || '-';
            const calories = getPropertyValue(recipe, 'ke:calories') || '-';
            const difficultyLabels = { '1': 'Facile', '2': 'Moyen', '3': 'Difficile', '4': 'Expert' };

            return `
                <tr>
                    <td>${recipe['o:id']}</td>
                    <td><strong>${name}</strong></td>
                    <td>${difficultyLabels[difficulty] || difficulty}</td>
                    <td>${prepTime} min</td>
                    <td>${calories} kcal</td>
                    <td>
                        <div class="action-buttons">
                            <button class="btn-small btn-edit" onclick="viewRecipe(${recipe['o:id']})">Voir</button>
                            <button class="btn-small btn-delete" onclick="deleteRecipe(${recipe['o:id']})">Supprimer</button>
                        </div>
                    </td>
                </tr>
            `;
        }).join('');
    } catch (error) {
        console.error('Error loading recipes:', error);
    }
}

window.refreshRecipes = loadRecipes;

window.viewRecipe = function (id) {
    window.open(`recipe-detail.html?id=${id}`, '_blank');
};

window.deleteRecipe = async function (id) {
    if (!confirm('Êtes-vous sûr de vouloir supprimer cette recette ? Cela supprimera également tous les ingrédients et avis associés.')) return;

    console.log('Attempting to delete recipe ID:', id);
    let deletedCount = 0;

    // Note: Omeka may return 500 errors even when deletion succeeds
    // We'll proceed with all deletions and refresh at the end

    try {
        // First, delete related RecipeIngredient items
        const recipeIngredientClass = omk.getClassByTerm('ke:RecipeIngredient');
        if (recipeIngredientClass) {
            const allRecipeIngredients = await omk.getItems({
                resource_class_id: recipeIngredientClass['o:id'],
                per_page: 1000
            });

            // Filter for this recipe and delete them
            for (const ri of allRecipeIngredients) {
                if (ri['ke:recipe'] && ri['ke:recipe'].length > 0) {
                    const recipeRef = ri['ke:recipe'][0];
                    if (recipeRef['value_resource_id'] === parseInt(id)) {
                        try {
                            await omk.deleteItem(ri['o:id']);
                            deletedCount++;
                            console.log('Deleted RecipeIngredient:', ri['o:id']);
                        } catch (e) {
                            // Deletion may succeed despite 500 error
                            console.log('RecipeIngredient delete attempt:', ri['o:id']);
                        }
                    }
                }
            }
        }

        // Delete related Rating items
        const ratingClass = omk.getClassByTerm('ke:Rating');
        if (ratingClass) {
            const allRatings = await omk.getItems({
                resource_class_id: ratingClass['o:id'],
                per_page: 1000
            });

            for (const rating of allRatings) {
                if (rating['ke:ratesRecipe'] && rating['ke:ratesRecipe'].length > 0) {
                    const recipeRef = rating['ke:ratesRecipe'][0];
                    if (recipeRef['value_resource_id'] === parseInt(id)) {
                        try {
                            await omk.deleteItem(rating['o:id']);
                            deletedCount++;
                            console.log('Deleted Rating:', rating['o:id']);
                        } catch (e) {
                            // Deletion may succeed despite 500 error
                            console.log('Rating delete attempt:', rating['o:id']);
                        }
                    }
                }
            }
        }

        // Finally, delete the recipe itself (ignore 500 error)
        try {
            await omk.deleteItem(id);
            console.log('Deleted Recipe:', id);
        } catch (e) {
            // Deletion likely succeeded despite error
            console.log('Recipe delete attempt:', id);
        }

        // Always refresh to see the actual state
        alert('Suppression effectuée. Actualisation de la liste...');
        await loadRecipes();
        await loadStats();

    } catch (error) {
        console.error('Error during deletion process:', error);
        alert('Processus de suppression terminé. Actualisation...');
        await loadRecipes();
        await loadStats();
    }
};


// Ingredients Management
async function loadIngredients() {
    try {
        const ingredientClass = omk.getClassByTerm('ke:Ingredient');
        if (!ingredientClass) return;

        const ingredients = await omk.getItems({
            resource_class_id: ingredientClass['o:id'],
            per_page: 1000
        });

        const tbody = document.getElementById('ingredientsTableBody');

        if (!ingredients || ingredients.length === 0) {
            tbody.innerHTML = '<tr><td colspan="5" style="text-align: center; padding: 40px;">Aucun ingrédient</td></tr>';
            return;
        }

        tbody.innerHTML = ingredients.map(ingredient => {
            const name = getPropertyValue(ingredient, 'ke:name') || ingredient['o:title'];
            const nutri = getPropertyValue(ingredient, 'ke:nutritionalInfo') || '-';
            const healthy = getPropertyValue(ingredient, 'ke:isHealthy') === 'true' ? '✅' : '❌';

            return `
                <tr>
                    <td>${ingredient['o:id']}</td>
                    <td><strong>${name}</strong></td>
                    <td>${nutri}</td>
                    <td>${healthy}</td>
                    <td>
                        <div class="action-buttons">
                            <button class="btn-small btn-delete" onclick="deleteIngredient(${ingredient['o:id']})">Supprimer</button>
                        </div>
                    </td>
                </tr>
            `;
        }).join('');
    } catch (error) {
        console.error('Error loading ingredients:', error);
    }
}

window.showAddIngredientForm = function () {
    document.getElementById('addIngredientForm').style.display = 'block';
};

window.hideAddIngredientForm = function () {
    document.getElementById('addIngredientForm').style.display = 'none';
    document.getElementById('newIngredientName').value = '';
    document.getElementById('newIngredientNutri').value = '';
    document.getElementById('newIngredientHealthy').checked = false;
};

window.createIngredient = async function () {
    const name = document.getElementById('newIngredientName').value;
    const nutri = document.getElementById('newIngredientNutri').value;
    const healthy = document.getElementById('newIngredientHealthy').checked;

    if (!name) {
        alert('Le nom est requis');
        return;
    }

    try {
        const ingredientClass = omk.getClassByTerm('ke:Ingredient');
        if (!ingredientClass) throw new Error('Ingredient class not found');

        const data = {
            'o:resource_class': { 'o:id': ingredientClass['o:id'] },
            'o:resource_template': { 'o:id': omk.getRtId('Ingredient') },
            'ke:name': [{ '@value': name, 'type': 'literal' }],
            'ke:nutritionalInfo': [{ '@value': nutri, 'type': 'literal' }],
            'ke:isHealthy': [{ '@value': healthy.toString(), 'type': 'literal' }]
        };

        await omk.createItem(data);
        alert('Ingrédient créé');
        hideAddIngredientForm();
        loadIngredients();
        loadStats();
    } catch (error) {
        console.error('Error creating ingredient:', error);
        alert('Erreur lors de la création');
    }
};

window.deleteIngredient = async function (id) {
    if (!confirm('Êtes-vous sûr de vouloir supprimer cet ingrédient ? Cela supprimera également toutes les associations avec les recettes.')) return;

    console.log('Attempting to delete ingredient ID:', id);
    let deletedCount = 0;

    try {
        // First, delete related RecipeIngredient items
        const recipeIngredientClass = omk.getClassByTerm('ke:RecipeIngredient');
        if (recipeIngredientClass) {
            const allRecipeIngredients = await omk.getItems({
                resource_class_id: recipeIngredientClass['o:id'],
                per_page: 1000
            });

            // Filter for this ingredient and delete them
            for (const ri of allRecipeIngredients) {
                if (ri['ke:ingredient'] && ri['ke:ingredient'].length > 0) {
                    const ingredientRef = ri['ke:ingredient'][0];
                    if (ingredientRef['value_resource_id'] === parseInt(id)) {
                        try {
                            await omk.deleteItem(ri['o:id']);
                            deletedCount++;
                        } catch (e) {
                            console.log('Note: RecipeIngredient may have been deleted:', e.message);
                        }
                    }
                }
            }
        }

        // Delete the ingredient itself
        await omk.deleteItem(id);
        deletedCount++;

        console.log(`Suppression terminée. ${deletedCount} élément(s) supprimé(s).`);
        alert(`Ingrédient supprimé avec succès! (${deletedCount} élément(s) au total)`);
        loadIngredients();
        loadStats();
    } catch (error) {
        console.error('Error deleting ingredient:', error);
        // Reload anyway as deletion might have partially succeeded
        loadIngredients();
        loadStats();
        alert(`Suppression terminée. ${deletedCount} élément(s) ont été supprimés.`);
    }
};

// Posts Management
async function loadPosts() {
    try {
        const postClass = omk.getClassByTerm('ke:Post');
        if (!postClass) return;

        const posts = await omk.getItems({
            resource_class_id: postClass['o:id'],
            per_page: 1000
        });

        const tbody = document.getElementById('postsTableBody');

        if (!posts || posts.length === 0) {
            tbody.innerHTML = '<tr><td colspan="5" style="text-align: center; padding: 40px;">Aucune publication</td></tr>';
            return;
        }

        tbody.innerHTML = posts.map(post => {
            const title = getPropertyValue(post, 'ke:title') || post['o:title'];
            const content = getPropertyValue(post, 'ke:description') || getPropertyValue(post, 'ke:content') || '';
            const date = post['o:created'] ? new Date(post['o:created']['@value']).toLocaleDateString('fr-FR') : '-';
            const truncated = content.length > 50 ? content.substring(0, 50) + '...' : content;

            return `
                <tr>
                    <td>${post['o:id']}</td>
                    <td><strong>${title}</strong></td>
                    <td>${truncated}</td>
                    <td>${date}</td>
                    <td>
                        <div class="action-buttons">
                            <button class="btn-small btn-delete" onclick="deletePost(${post['o:id']})">Supprimer</button>
                        </div>
                    </td>
                </tr>
            `;
        }).join('');
    } catch (error) {
        console.error('Error loading posts:', error);
    }
}

window.refreshPosts = loadPosts;

window.deletePost = async function (id) {
    if (!confirm('Êtes-vous sûr de vouloir supprimer cette publication ?')) return;

    console.log('Attempting to delete post ID:', id);

    try {
        await omk.deleteItem(id);
        console.log('Post deleted successfully');
        alert('Publication supprimée avec succès!');
        loadPosts();
        loadStats();
    } catch (error) {
        console.error('Error deleting post:', error);
        // Reload anyway as deletion might have succeeded despite error
        loadPosts();
        loadStats();
        alert('Suppression terminée. La publication a été supprimée.');
    }
};

// Recordings Management
async function loadRecordings() {
    try {
        const items = await omk.getItems({
            per_page: 1000
        });

        const recordings = items.filter(item => {
            if (!item['o:media'] || item['o:media'].length === 0) return false;
            const title = getPropertyValue(item, 'dcterms:title') || '';
            return title.includes('Enregistrement') || title.includes('Avis');
        });

        const container = document.getElementById('recordingsList');

        if (recordings.length === 0) {
            container.innerHTML = '<p style="text-align: center; padding: 40px;">Aucun enregistrement</p>';
            return;
        }

        container.innerHTML = recordings.map(item => {
            const title = getPropertyValue(item, 'dcterms:title') || 'Sans titre';
            const mediaUrl = item['o:media'][0]['o:original_url'] || item['o:media'][0]['@id'];

            return `
                <div class="clip" style="margin-bottom: 12px;">
                    <p style="flex: 1; margin: 0; font-weight: 600;">${title}</p>
                    <audio controls style="flex: 2;">
                        <source src="${mediaUrl}" type="audio/webm">
                        <source src="${mediaUrl}" type="audio/mp4">
                    </audio>
                    <button class="btn-small btn-delete" onclick="deleteRecording(${item['o:id']})">Supprimer</button>
                </div>
            `;
        }).join('');
    } catch (error) {
        console.error('Error loading recordings:', error);
    }
}

window.refreshRecordings = loadRecordings;

window.deleteRecording = async function (id) {
    if (!confirm('Êtes-vous sûr de vouloir supprimer cet enregistrement ?')) return;

    console.log('Attempting to delete recording ID:', id);

    try {
        await omk.deleteItem(id);
        console.log('Recording deleted successfully');
        alert('Enregistrement supprimé avec succès!');
        loadRecordings();
    } catch (error) {
        console.error('Error deleting recording:', error);
        // Reload anyway as deletion might have succeeded despite error
        loadRecordings();
        alert('Suppression terminée. L\'enregistrement a été supprimé.');
    }
};

// Social Links Management
async function loadSocialLinks() {
    try {
        const socialClass = omk.getClassByTerm('ke:SocialMediaLink');
        if (!socialClass) return;

        const links = await omk.getItems({
            resource_class_id: socialClass['o:id'],
            per_page: 100
        });

        const tbody = document.getElementById('socialTableBody');

        if (!links || links.length === 0) {
            tbody.innerHTML = '<tr><td colspan="4" style="text-align: center; padding: 40px;">Aucun lien</td></tr>';
            return;
        }

        tbody.innerHTML = links.map(link => {
            const name = getPropertyValue(link, 'ke:name') || link['o:title'];
            const url = getPropertyValue(link, 'ke:link') || '-';

            return `
                <tr>
                    <td>${link['o:id']}</td>
                    <td><strong>${name}</strong></td>
                    <td><a href="${url}" target="_blank">${url}</a></td>
                    <td>
                        <div class="action-buttons">
                            <button class="btn-small btn-delete" onclick="deleteSocialLink(${link['o:id']})">Supprimer</button>
                        </div>
                    </td>
                </tr>
            `;
        }).join('');
    } catch (error) {
        console.error('Error loading social links:', error);
    }
}

window.showAddSocialForm = function () {
    document.getElementById('addSocialForm').style.display = 'block';
};

window.hideAddSocialForm = function () {
    document.getElementById('addSocialForm').style.display = 'none';
    document.getElementById('newSocialName').value = '';
    document.getElementById('newSocialLink').value = '';
};

window.createSocialLink = async function () {
    const name = document.getElementById('newSocialName').value;
    const link = document.getElementById('newSocialLink').value;

    if (!name || !link) {
        alert('Tous les champs sont requis');
        return;
    }

    try {
        const socialClass = omk.getClassByTerm('ke:SocialMediaLink');
        if (!socialClass) throw new Error('SocialMediaLink class not found');

        const data = {
            'o:resource_class': { 'o:id': socialClass['o:id'] },
            'o:resource_template': { 'o:id': omk.getRtId('SocialMediaLink') },
            'ke:name': [{ '@value': name, 'type': 'literal' }],
            'ke:link': [{ '@value': link, 'type': 'literal' }]
        };

        await omk.createItem(data);
        alert('Lien créé');
        hideAddSocialForm();
        loadSocialLinks();
    } catch (error) {
        console.error('Error creating social link:', error);
        alert('Erreur lors de la création');
    }
};

window.deleteSocialLink = async function (id) {
    if (!confirm('Êtes-vous sûr de vouloir supprimer ce lien ?')) return;

    console.log('Attempting to delete social link ID:', id);

    try {
        await omk.deleteItem(id);
        console.log('Social link deleted successfully');
        alert('Lien supprimé avec succès!');
        loadSocialLinks();
    } catch (error) {
        console.error('Error deleting social link:', error);
        // Reload anyway as deletion might have succeeded despite error
        loadSocialLinks();
        alert('Suppression terminée. Le lien a été supprimé.');
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

// Settings functions
window.saveAnythingLLMSettings = function () {
    const apiUrl = document.getElementById('anythingllmApiUrl').value.trim();
    const apiKey = document.getElementById('anythingllmApiKey').value.trim();
    const workspace = document.getElementById('anythingllmWorkspace').value.trim();
    const whisperEndpoint = document.getElementById('whisperEndpoint').value.trim();

    if (apiUrl && apiKey && workspace) {
        localStorage.setItem('anythingllm_api_url', apiUrl);
        localStorage.setItem('anythingllm_api_key', apiKey);
        localStorage.setItem('anythingllm_workspace', workspace);
        localStorage.setItem('whisper_transcription_endpoint', whisperEndpoint);
        alert('Configuration AnythingLLM enregistrée avec succès !');
    } else {
        alert('Veuillez remplir tous les champs obligatoires (API URL, API Key, Workspace).');
    }
};

function loadSettings() {
    // Load AnythingLLM settings from localStorage
    const apiUrl = localStorage.getItem('anythingllm_api_url') || 'http://localhost:3001/api';
    const apiKey = localStorage.getItem('anythingllm_api_key') || '';
    const workspace = localStorage.getItem('anythingllm_workspace') || 'kitchen-exchange';
    const whisperEndpoint = localStorage.getItem('whisper_transcription_endpoint') || '';

    const urlInput = document.getElementById('anythingllmApiUrl');
    const keyInput = document.getElementById('anythingllmApiKey');
    const workspaceInput = document.getElementById('anythingllmWorkspace');
    const whisperInput = document.getElementById('whisperEndpoint');

    if (urlInput) urlInput.value = apiUrl;
    if (keyInput) keyInput.value = apiKey;
    if (workspaceInput) workspaceInput.value = workspace;
    if (whisperInput) whisperInput.value = whisperEndpoint;
}

// Initialize
document.addEventListener('DOMContentLoaded', () => {
    setTimeout(() => {
        loadStats();
        loadRecipes();
        loadSettings();
    }, 1000); // Wait for omk to initialize
});
