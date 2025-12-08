import { Omk } from '../modules/omk.js';

const omk = new Omk({
    api: 'http://localhost/omk_thyp_25-26_clone/api/',
    ident: 'neecG2mXbk1MDcdL4t2vnYx3BxtVL0OM',
    key: 'KrpZ7cl2tRCoYhpIC7zVkbLOpSKONsPx',
    mail: 'samuel.szoniecky@univ-paris8.fr',
    vocabs: ['ke', 'dcterms', 'foaf']
});

omk.init();

//Tab switching
window.switchAuthTab = function (tab) {
    document.querySelectorAll('.auth-tab').forEach(t => t.classList.remove('active'));
    document.querySelectorAll('.auth-form').forEach(f => f.classList.remove('active'));

    event.target.classList.add('active');
    document.getElementById(tab + 'Form').classList.add('active');

    hideMessages();
};

function showError(message) {
    const errorDiv = document.getElementById('errorMessage');
    errorDiv.textContent = message;
    errorDiv.style.display = 'block';
    document.getElementById('successMessage').style.display = 'none';
}

function showSuccess(message) {
    const successDiv = document.getElementById('successMessage');
    successDiv.textContent = message;
    successDiv.style.display = 'block';
    document.getElementById('errorMessage').style.display = 'none';
}

function hideMessages() {
    document.getElementById('errorMessage').style.display = 'none';
    document.getElementById('successMessage').style.display = 'none';
}

// Hash password (simple - in production use bcrypt or similar)
async function hashPassword(password) {
    const encoder = new TextEncoder();
    const data = encoder.encode(password);
    const hash = await crypto.subtle.digest('SHA-256', data);
    return Array.from(new Uint8Array(hash)).map(b => b.toString(16).padStart(2, '0')).join('');
}

// Register
document.getElementById('registerForm').addEventListener('submit', async function (e) {
    e.preventDefault();
    hideMessages();

    const firstName = document.getElementById('registerFirstName').value.trim();
    const lastName = document.getElementById('registerLastName').value.trim();
    const email = document.getElementById('registerEmail').value.trim().toLowerCase();
    const password = document.getElementById('registerPassword').value;
    const passwordConfirm = document.getElementById('registerPasswordConfirm').value;

    if (password !== passwordConfirm) {
        showError('Les mots de passe ne correspondent pas');
        return;
    }

    try {
        // Check if user already exists
        const userClass = omk.getClassByTerm('ke:User');
        if (!userClass) {
            throw new Error('User class not found');
        }

        const existingUsers = await omk.getItems({
            resource_class_id: userClass['o:id'],
            per_page: 1000
        });

        const userExists = existingUsers.some(user => {
            const userEmail = getPropertyValue(user, 'ke:email');
            return userEmail && userEmail.toLowerCase() === email;
        });

        if (userExists) {
            showError('Un compte avec cet email existe déjà');
            return;
        }

        // Hash password
        const passwordHash = await hashPassword(password);

        // Create user
        const userData = {
            'o:resource_class': { 'o:id': userClass['o:id'] },
            'o:resource_template': { 'o:id': omk.getRtId('User') },
            'dcterms:title': [{ '@value': `${firstName} ${lastName}`, 'type': 'literal' }],
            'ke:firstName': [{ '@value': firstName, 'type': 'literal' }],
            'ke:lastName': [{ '@value': lastName, 'type': 'literal' }],
            'ke:email': [{ '@value': email, 'type': 'literal' }],
            'ke:password': [{ '@value': passwordHash, 'type': 'literal' }]
        };

        const user = await omk.createItem(userData);

        if (user && user['o:id']) {
            showSuccess('Compte créé avec succès ! Vous pouvez maintenant vous connecter.');
            setTimeout(() => {
                switchAuthTab('login');
                document.getElementById('loginEmail').value = email;
            }, 2000);
        }
    } catch (error) {
        console.error('Registration error:', error);
        showError('Erreur lors de la création du compte');
    }
});

// Login
document.getElementById('loginForm').addEventListener('submit', async function (e) {
    e.preventDefault();
    hideMessages();

    const email = document.getElementById('loginEmail').value.trim().toLowerCase();
    const password = document.getElementById('loginPassword').value;

    try {
        const userClass = omk.getClassByTerm('ke:User');
        if (!userClass) {
            throw new Error('User class not found');
        }

        const users = await omk.getItems({
            resource_class_id: userClass['o:id'],
            per_page: 1000
        });

        const user = users.find(u => {
            const userEmail = getPropertyValue(u, 'ke:email');
            return userEmail && userEmail.toLowerCase() === email;
        });

        if (!user) {
            showError('Email ou mot de passe incorrect');
            return;
        }

        // Verify password
        const passwordHash = await hashPassword(password);
        const storedHash = getPropertyValue(user, 'ke:password');

        if (passwordHash !== storedHash) {
            showError('Email ou mot de passe incorrect');
            return;
        }

        // Store user session
        const userSession = {
            id: user['o:id'],
            email: getPropertyValue(user, 'ke:email'),
            firstName: getPropertyValue(user, 'ke:firstName'),
            lastName: getPropertyValue(user, 'ke:lastName')
        };

        localStorage.setItem('currentUser', JSON.stringify(userSession));

        showSuccess('Connexion réussie ! Redirection...');
        setTimeout(() => {
            window.location.href = 'chatbot.html';
        }, 1500);

    } catch (error) {
        console.error('Login error:', error);
        showError('Erreur lors de la connexion');
    }
});

function getPropertyValue(item, propertyTerm) {
    if (!item || !item[propertyTerm]) return null;
    const prop = item[propertyTerm];
    if (Array.isArray(prop) && prop.length > 0) {
        return prop[0]['@value'] || prop[0]['o:label'] || null;
    }
    return null;
}
