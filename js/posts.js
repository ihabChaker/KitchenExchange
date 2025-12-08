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

// Load posts
async function loadPosts() {
    try {
        const postClass = omk.getClassByTerm('ke:Post');
        if (!postClass) {
            throw new Error('Post class not found');
        }

        const posts = await omk.getItems({
            resource_class_id: postClass['o:id'],
            per_page: 100,
            sort_by: 'created',
            sort_order: 'desc'
        });

        displayPosts(posts);
    } catch (error) {
        console.error('Error loading posts:', error);
        document.getElementById('postsFeed').innerHTML = `
            <div class="no-results">
                <div class="no-results-icon">😕</div>
                <h3>Erreur lors du chargement</h3>
                <p>Impossible de charger les publications</p>
            </div>
        `;
    }
}

function displayPosts(posts) {
    const container = document.getElementById('postsFeed');

    if (!posts || posts.length === 0) {
        container.innerHTML = `
            <div class="no-results">
                <div class="no-results-icon">📝</div>
                <h3>Aucune publication</h3>
                <p>Soyez le premier à partager une publication !</p>
            </div>
        `;
        return;
    }

    container.innerHTML = posts.map(post => {
        const title = getPropertyValue(post, 'ke:title') || post['o:title'] || 'Sans titre';
        const content = getPropertyValue(post, 'ke:description') || getPropertyValue(post, 'ke:content') || '';
        const createdDate = post['o:created'] ? formatDate(post['o:created']['@value']) : 'Date inconnue';
        const postId = post['o:id'];

        // Get author initials (for now, use generic user)
        const authorInitials = '👤';

        return `
            <div class="post-card">
                <div class="post-header">
                    <div class="post-avatar">${authorInitials}</div>
                    <div class="post-author-info">
                        <div class="post-author">Utilisateur</div>
                        <div class="post-date">${createdDate}</div>
                    </div>
                </div>
                
                <h3 class="post-title">${title}</h3>
                <div class="post-content">${content}</div>
                
            </div>
        `;
    }).join('');
}

// Create post
document.getElementById('createPostForm').addEventListener('submit', async function (e) {
    e.preventDefault();

    const title = document.getElementById('postTitle').value;
    const content = document.getElementById('postContent').value;
    const publishBtn = document.getElementById('publishBtn');

    publishBtn.disabled = true;
    publishBtn.textContent = 'Publication...';

    try {
        const postClass = omk.getClassByTerm('ke:Post');
        if (!postClass) {
            throw new Error('Post class not found');
        }

        // Normalize values: accept plain strings or already-shaped literals
        function ensureLiteralArray(val) {
            if (val === undefined || val === null) return [];
            // If already an array of literal-like objects, return as-is
            if (Array.isArray(val) && val.length && val[0] && (val[0]['@value'] !== undefined || val[0]['o:label'] !== undefined)) return val;
            // If array of strings
            if (Array.isArray(val)) return val.map(v => ({ '@value': String(v), 'type': 'literal' }));
            // Plain string -> wrap
            if (typeof val === 'string') return [{ '@value': val, 'type': 'literal' }];
            // other types -> stringify
            return [{ '@value': String(val), 'type': 'literal' }];
        }

        const postData = {
            'o:resource_class': { 'o:id': postClass['o:id'] },
            'o:resource_template': { 'o:id': omk.getRtId('Post') },
            'ke:title': ensureLiteralArray(title),
            'ke:description': ensureLiteralArray(content)
        };

        try {
            const created = await omk.createItem(postData);
            console.log('Created post item:', created);

            // Clear form
            document.getElementById('postTitle').value = '';
            document.getElementById('postContent').value = '';

            // Reload posts
            loadPosts();

            alert('Publication partagée avec succès !');
        } catch (err) {
            console.error('Error creating post (createItem):', err);
            alert('Erreur lors de la publication');
        }
    } catch (error) {
        console.error('Error creating post:', error);
        alert('Erreur lors de la publication');
    } finally {
        publishBtn.disabled = false;
        publishBtn.textContent = 'Publier';
    }
});

// Share menu toggle
window.toggleShareMenu = function (postId) {
    const menu = document.getElementById(`share_${postId}`);

    // Close all other menus
    document.querySelectorAll('.share-dropdown').forEach(dropdown => {
        if (dropdown.id !== `share_${postId}`) {
            dropdown.classList.remove('active');
        }
    });

    menu.classList.toggle('active');
};

// Close share menus when clicking outside
document.addEventListener('click', function (e) {
    if (!e.target.closest('.share-menu')) {
        document.querySelectorAll('.share-dropdown').forEach(dropdown => {
            dropdown.classList.remove('active');
        });
    }
});

// Share functions
window.shareToFacebook = function (title) {
    const url = window.location.href;
    window.open(`https://www.facebook.com/sharer/sharer.php?u=${encodeURIComponent(url)}&quote=${title}`, '_blank');
};

window.shareToTwitter = function (title) {
    const url = window.location.href;
    window.open(`https://twitter.com/intent/tweet?text=${title}&url=${encodeURIComponent(url)}`, '_blank');
};

window.copyLink = function (postId) {
    const url = `${window.location.origin}/posts.html#post_${postId}`;
    navigator.clipboard.writeText(url).then(() => {
        alert('Lien copié dans le presse-papiers !');
    }).catch(err => {
        console.error('Error copying link:', err);
    });
};

window.likePost = function (postId) {
    // In a real app, this would save the like to Omeka
    alert('Fonctionnalité "J\'aime" - À implémenter avec le système d\'authentification');
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

function formatDate(dateString) {
    const date = new Date(dateString);
    const now = new Date();
    const diffMs = now - date;
    const diffMins = Math.floor(diffMs / 60000);
    const diffHours = Math.floor(diffMs / 3600000);
    const diffDays = Math.floor(diffMs / 86400000);

    if (diffMins < 1) return 'À l\'instant';
    if (diffMins < 60) return `Il y a ${diffMins} minute${diffMins > 1 ? 's' : ''}`;
    if (diffHours < 24) return `Il y a ${diffHours} heure${diffHours > 1 ? 's' : ''}`;
    if (diffDays < 7) return `Il y a ${diffDays} jour${diffDays > 1 ? 's' : ''}`;

    return date.toLocaleDateString('fr-FR', { day: 'numeric', month: 'long', year: 'numeric' });
}

// Initialize
document.addEventListener('DOMContentLoaded', loadPosts);
