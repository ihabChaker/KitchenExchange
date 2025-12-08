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

let allIngredients = [];
let selectedIngredients = new Map(); // Map of ingredient ID -> {ingredient, quantity}

// Load ingredients
async function loadIngredients() {
    try {
        const ingredientClass = omk.getClassByTerm('ke:Ingredient');
        if (!ingredientClass) {
            throw new Error('Ingredient class not found');
        }

        allIngredients = await omk.getItems({
            resource_class_id: ingredientClass['o:id'],
            per_page: 1000
        });

        displayIngredientSelector(allIngredients);
    } catch (error) {
        console.error('Error loading ingredients:', error);
        document.getElementById('ingredientsSelector').innerHTML =
            '<div style="text-align: center; padding: 20px; color: var(--danger);">Erreur lors du chargement des ingrédients</div>';
    }
}

function displayIngredientSelector(ingredients) {
    const container = document.getElementById('ingredientsSelector');

    if (!ingredients || ingredients.length === 0) {
        container.innerHTML = '<div style="text-align: center; padding: 20px;">Aucun ingrédient disponible</div>';
        return;
    }

    container.innerHTML = ingredients.map(ingredient => {
        const name = getPropertyValue(ingredient, 'ke:name') || ingredient['o:title'] || 'Sans nom';
        const id = ingredient['o:id'];

        return `
            <div class="ingredient-checkbox">
                <input type="checkbox" id="ing_${id}" value="${id}" onchange="toggleIngredient(${id}, '${name.replace(/'/g, "\\'")}')">
                <label for="ing_${id}">${name}</label>
                <input type="text" 
                       class="quantity-input" 
                       id="qty_${id}" 
                       placeholder="Quantité" 
                       style="display: none;"
                       onchange="updateQuantity(${id})">
            </div>
        `;
    }).join('');
}

window.toggleIngredient = function (ingredientId, ingredientName) {
    const checkbox = document.getElementById(`ing_${ingredientId}`);
    const quantityInput = document.getElementById(`qty_${ingredientId}`);

    if (checkbox.checked) {
        quantityInput.style.display = 'block';
        quantityInput.focus();

        const ingredient = allIngredients.find(ing => ing['o:id'] === ingredientId);
        selectedIngredients.set(ingredientId, {
            ingredient: ingredient,
            quantity: ''
        });
    } else {
        quantityInput.style.display = 'none';
        quantityInput.value = '';
        selectedIngredients.delete(ingredientId);
    }

    updateSelectedIngredientsDisplay();
};

window.updateQuantity = function (ingredientId) {
    const quantityInput = document.getElementById(`qty_${ingredientId}`);
    const data = selectedIngredients.get(ingredientId);

    if (data) {
        data.quantity = quantityInput.value;
        updateSelectedIngredientsDisplay();
    }
};

function updateSelectedIngredientsDisplay() {
    const container = document.getElementById('selectedIngredients');

    if (selectedIngredients.size === 0) {
        container.innerHTML = '';
        return;
    }

    const html = Array.from(selectedIngredients.entries()).map(([id, data]) => {
        const name = getPropertyValue(data.ingredient, 'ke:name') || data.ingredient['o:title'];
        const quantity = data.quantity || '?';

        return `
            <div class="ingredient-chip">
                <span>${name} (${quantity})</span>
                <span class="chip-remove" onclick="removeIngredient(${id})">×</span>
            </div>
        `;
    }).join('');

    container.innerHTML = html;
}

window.removeIngredient = function (ingredientId) {
    const checkbox = document.getElementById(`ing_${ingredientId}`);
    const quantityInput = document.getElementById(`qty_${ingredientId}`);

    checkbox.checked = false;
    quantityInput.style.display = 'none';
    quantityInput.value = '';

    selectedIngredients.delete(ingredientId);
    updateSelectedIngredientsDisplay();
};

window.previewImage = function (event) {
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function (e) {
            const preview = document.getElementById('imagePreview');
            preview.src = e.target.result;
            preview.style.display = 'block';
        };
        reader.readAsDataURL(file);
    }
};

// Form submission
document.getElementById('recipeForm').addEventListener('submit', async function (e) {
    e.preventDefault();

    if (selectedIngredients.size === 0) {
        alert('Veuillez sélectionner au moins un ingrédient');
        return;
    }

    const submitBtn = document.getElementById('submitBtn');
    submitBtn.disabled = true;
    submitBtn.textContent = 'Publication en cours...';

    try {
        // Get form data
        const name = document.getElementById('recipeName').value;
        const description = document.getElementById('recipeDescription').value;
        const prepTime = document.getElementById('prepTime').value;
        const cookTime = document.getElementById('cookTime').value;
        const calories = document.getElementById('calories').value;
        const difficulty = document.getElementById('difficulty').value;
        const steps = document.getElementById('steps').value;
        const imageFile = document.getElementById('recipeImage').files[0];

        // Get recipe class
        const recipeClass = omk.getClassByTerm('ke:Recipe');
        if (!recipeClass) {
            throw new Error('Recipe class not found');
        }

        // Prepare recipe data
        const recipeData = {
            'o:resource_class': { 'o:id': recipeClass['o:id'] },
            'o:resource_template': { 'o:id': omk.getRtId('Recipe') },
            'ke:name': [{ '@value': name, 'type': 'literal' }],
            'ke:description': [{ '@value': description, 'type': 'literal' }],
            'ke:steps': [{ '@value': steps, 'type': 'literal' }],
            'ke:difficulty': [{ '@value': difficulty, 'type': 'literal' }]
        };

        if (prepTime) {
            recipeData['ke:preparationTime'] = [{ '@value': prepTime, 'type': 'literal' }];
        }
        if (cookTime) {
            recipeData['ke:cookingTime'] = [{ '@value': cookTime, 'type': 'literal' }];
        }
        if (calories) {
            recipeData['ke:calories'] = [{ '@value': calories, 'type': 'literal' }];
        }

        // Create recipe with image if provided
        let recipe;
        if (imageFile) {
            console.log('Creating recipe with image file:', imageFile);
            // Add file marker so formatData adds the media upload structure
            recipeData['file'] = 1;
            recipe = await omk.createItem(recipeData, imageFile);
        } else {
            console.log('Creating recipe without image');
            recipe = await omk.createItem(recipeData);
        }

        console.log('Created recipe:', recipe);
        if (!recipe || !recipe['o:id']) {
            throw new Error('Failed to create recipe');
        }

        // Create RecipeIngredient junction items
        const recipeIngredientClass = omk.getClassByTerm('ke:RecipeIngredient');
        console.log('RecipeIngredient class:', recipeIngredientClass);
        console.log('Selected ingredients:', selectedIngredients);
        if (recipeIngredientClass) {
            for (const [ingredientId, data] of selectedIngredients.entries()) {
                try {
                    const riData = {
                        'o:resource_class': { 'o:id': recipeIngredientClass['o:id'] },
                        'ke:recipe': [{ 'value_resource_id': recipe['o:id'], 'type': 'resource' }],
                        'ke:ingredient': [{ 'value_resource_id': ingredientId, 'type': 'resource' }],
                        'ke:quantity': [{ '@value': data.quantity || '', 'type': 'literal' }]
                    };

                    // Add resource template if it exists
                    const recipeIngredientRT = omk.getRt('RecipeIngredient');
                    if (recipeIngredientRT) {
                        riData['o:resource_template'] = { 'o:id': recipeIngredientRT['o:id'] };
                    }

                    console.log('Creating RecipeIngredient with data:', riData);

                    const createdRI = await omk.createItem(riData);
                    console.log('Created RecipeIngredient:', createdRI);
                } catch (error) {
                    console.error('Error creating RecipeIngredient:', error);
                }
            }
        }

        // Success!
        alert('Recette publiée avec succès !');
        console.log('Recipe created with ID:', recipe['o:id']);
        window.location.href = `recipe-detail.html?id=${recipe['o:id']}`;

    } catch (error) {
        console.error('Error creating recipe:', error);
        alert('Erreur lors de la publication de la recette. Veuillez réessayer.');
        submitBtn.disabled = false;
        submitBtn.textContent = 'Publier la recette';
    }
});

// Helper functions
function getPropertyValue(item, propertyTerm) {
    if (!item || !item[propertyTerm]) return null;
    const prop = item[propertyTerm];
    if (Array.isArray(prop) && prop.length > 0) {
        return prop[0]['@value'] || prop[0]['o:label'] || null;
    }
    return null;
}

// Initialize
document.addEventListener('DOMContentLoaded', loadIngredients);
