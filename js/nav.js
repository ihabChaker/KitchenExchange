// Navigation user status management
(function () {
    function updateNavigation() {
        const currentUserJson = localStorage.getItem('currentUser');
        const navActions = document.querySelector('.nav-actions');

        if (!navActions) return;

        if (currentUserJson) {
            try {
                const user = JSON.parse(currentUserJson);
                navActions.innerHTML = `
                    <span style="color: var(--text); margin-right: 16px; font-weight: 600;">
                        ${user.firstName}
                    </span>
                    <button class="btn-ghost" onclick="logout()">Déconnexion</button>
                    <a href="add-recipe.html" class="btn-primary">Ajouter une recette</a>
                `;
            } catch (e) {
                console.error('Error parsing user session:', e);
                localStorage.removeItem('currentUser');
                showLoginButton();
            }
        } else {
            showLoginButton();
        }
    }

    function showLoginButton() {
        const navActions = document.querySelector('.nav-actions');
        if (!navActions) return;

        navActions.innerHTML = `
            <a href="auth.html" class="btn-ghost">Connexion</a>
            <a href="add-recipe.html" class="btn-primary">Ajouter une recette</a>
        `;
    }

    window.logout = function () {
        localStorage.removeItem('currentUser');
        window.location.href = 'index.html';
    };

    // Update on page load
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', updateNavigation);
    } else {
        updateNavigation();
    }

    // Update when storage changes (e.g., login in another tab)
    window.addEventListener('storage', function (e) {
        if (e.key === 'currentUser') {
            updateNavigation();
        }
    });
})();
