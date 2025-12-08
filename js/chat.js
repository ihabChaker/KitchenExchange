import { Omk } from '../modules/omk.js';

const omk = new Omk({
    api: 'http://localhost/omk_thyp_25-26_clone/api/',
    ident: 'neecG2mXbk1MDcdL4t2vnYx3BxtVL0OM',
    key: 'KrpZ7cl2tRCoYhpIC7zVkbLOpSKONsPx',
    mail: 'samuel.szoniecky@univ-paris8.fr',
    vocabs: ['ke', 'dcterms', 'foaf']
});

omk.init();

let currentUser = null;
let currentChatSession = null;
let messages = [];

// Check authentication
function checkAuth() {
    const userSession = localStorage.getItem('currentUser');
    if (!userSession) {
        window.location.href = 'auth.html';
        return false;
    }
    currentUser = JSON.parse(userSession);
    return true;
}

// Logout
window.logout = function () {
    localStorage.removeItem('currentUser');
    window.location.href = 'index.html';
};

// Load chat sessions
async function loadChatSessions() {
    if (!currentUser) return;

    try {
        const chatClass = omk.getClassByTerm('ke:ChatSession');
        if (!chatClass) {
            console.warn('ChatSession class not found');
            return;
        }

        const sessions = await omk.getItems({
            resource_class_id: chatClass['o:id'],
            per_page: 100
        });

        // Filter for current user's sessions
        const userSessions = sessions.filter(session => {
            const userId = getPropertyResourceId(session, 'ke:belongsToUser');
            return userId === currentUser.id;
        });

        displayChatSessions(userSessions);
    } catch (error) {
        console.error('Error loading chat sessions:', error);
    }
}

function displayChatSessions(sessions) {
    const container = document.getElementById('chatSessionsList');
    if (!container) return;

    if (!sessions || sessions.length === 0) {
        container.innerHTML = '<div style="padding: 20px; text-align: center; color: var(--muted);">Aucune conversation</div>';
        return;
    }

    container.innerHTML = sessions.map(session => {
        const title = getPropertyValue(session, 'dcterms:title') || 'Nouvelle conversation';
        const date = session['o:created'] ? new Date(session['o:created']['@value']).toLocaleDateString('fr-FR') : '';
        const isActive = currentChatSession && currentChatSession['o:id'] === session['o:id'];

        return `
            <div class="chat-session ${isActive ? 'active' : ''}" onclick="loadChatSession(${session['o:id']})">
                <div style="flex: 1;">
                    <div class="session-title">${title}</div>
                    <div class="session-date">${date}</div>
                </div>
                <button class="btn-ghost" style="padding: 4px 8px; font-size: 12px;" onclick="event.stopPropagation(); deleteChatSession(${session['o:id']})" title="Supprimer">
                    🗑️
                </button>
            </div>
        `;
    }).join('');
}

// Load specific chat session
window.loadChatSession = async function (sessionId) {
    try {
        currentChatSession = await omk.getItem(sessionId);
        await loadMessagesForSession(sessionId);
        await loadChatSessions(); // Refresh to show active state
    } catch (error) {
        console.error('Error loading chat session:', error);
    }
};

// Load messages for a session
async function loadMessagesForSession(sessionId) {
    try {
        const messageClass = omk.getClassByTerm('ke:ChatMessage');
        if (!messageClass) return;

        const allMessages = await omk.getItems({
            resource_class_id: messageClass['o:id'],
            per_page: 1000
        });

        // Filter messages for this session
        messages = allMessages.filter(msg => {
            const msgSessionId = getPropertyResourceId(msg, 'ke:belongsToSession');
            return msgSessionId === sessionId;
        }).sort((a, b) => {
            const timeA = new Date(a['o:created']['@value']).getTime();
            const timeB = new Date(b['o:created']['@value']).getTime();
            return timeA - timeB;
        });

        displayMessages();
    } catch (error) {
        console.error('Error loading messages:', error);
    }
}

function displayMessages() {
    const container = document.getElementById('chatMessages');
    if (!container) return;

    if (messages.length === 0) {
        container.innerHTML = `
            <div style="text-align: center; padding: 80px 20px; color: var(--muted);">
                <div style="font-size: 48px; margin-bottom: 16px;">💬</div>
                <h3>Commencez une conversation</h3>
                <p>Posez une question sur les recettes !</p>
            </div>
        `;
        return;
    }

    container.innerHTML = messages.map(msg => {
        const role = getPropertyValue(msg, 'ke:role') || 'user';
        const content = getPropertyValue(msg, 'ke:content') || '';
        const time = msg['o:created'] ? new Date(msg['o:created']['@value']).toLocaleTimeString('fr-FR', { hour: '2-digit', minute: '2-digit' }) : '';

        // Convert references to links (only for assistant messages)
        const formattedContent = role === 'assistant' ? convertReferencesToLinks(content) : content;

        // Check if message has audio media
        const hasAudio = msg['o:media'] && msg['o:media'].length > 0;
        let audioPlayer = '';

        if (hasAudio) {
            console.log('Message has audio media:', msg['o:media']);
            const media = msg['o:media'][0];
            // Media might be a reference object with @id, or a full object with o:original_url
            const audioUrl = media['o:original_url'] || (media['@id'] ? media['@id'].replace('/api/media/', '/files/original/') : null);

            if (audioUrl) {
                audioPlayer = `
                    <div class="audio-message" style="margin-top: 8px;">
                        <div style="display: flex; align-items: center; gap: 8px; padding: 8px; background: var(--bg); border-radius: 8px;">
                            <span style="font-size: 20px;">🎤</span>
                            <audio controls style="flex: 1; height: 32px;">
                                <source src="${audioUrl}" type="audio/webm">
                                <source src="${audioUrl}" type="audio/mp4">
                                Votre navigateur ne supporte pas la lecture audio.
                            </audio>
                        </div>
                    </div>
                `;
            } else {
                console.warn('Could not determine audio URL from media:', media);
            }
        }

        return `
            <div class="message ${role}">
                <div class="message-avatar">${role === 'user' ? '👤' : '🤖'}</div>
                <div class="message-content">
                    ${audioPlayer}
                    <div class="message-text">${formattedContent}</div>
                    <div class="message-time">${time}</div>
                </div>
            </div>
        `;
    }).join('');

    // Scroll to bottom
    container.scrollTop = container.scrollHeight;
}

// Create new chat session
window.createNewChat = async function () {
    if (!currentUser) return;

    try {
        const chatClass = omk.getClassByTerm('ke:ChatSession');
        if (!chatClass) {
            alert('ChatSession class not configured in Omeka');
            return;
        }

        // Generate unique thread slug for AnythingLLM
        const threadSlug = `chat_${currentUser.id}_${Date.now()}`;

        const sessionData = {
            'o:resource_class': { 'o:id': chatClass['o:id'] },
            'dcterms:title': [{ '@value': `Conversation ${new Date().toLocaleString('fr-FR')}`, 'type': 'literal' }],
            'ke:belongsToUser': [{ 'value_resource_id': currentUser.id, 'type': 'resource' }],
            'ke:threadSlug': [{ '@value': threadSlug, 'type': 'literal' }]
        };

        // Add resource template if exists
        const chatRT = omk.getRt('ChatSession');
        if (chatRT) {
            sessionData['o:resource_template'] = { 'o:id': chatRT['o:id'] };
        }

        currentChatSession = await omk.createItem(sessionData);
        messages = [];
        displayMessages();
        await loadChatSessions();
    } catch (error) {
        console.error('Error creating chat session:', error);
        alert('Erreur lors de la création de la conversation');
    }
};

// Delete chat session
window.deleteChatSession = async function (sessionId) {
    if (!confirm('Êtes-vous sûr de vouloir supprimer cette conversation et tous ses messages ?')) {
        return;
    }

    try {
        console.log('Deleting chat session:', sessionId);

        // First, delete all messages in this session
        const messageClass = omk.getClassByTerm('ke:ChatMessage');
        if (messageClass) {
            const allMessages = await omk.getItems({
                resource_class_id: messageClass['o:id'],
                per_page: 1000
            });

            const sessionMessages = allMessages.filter(msg => {
                const belongsTo = msg['ke:belongsToSession'];
                return belongsTo && belongsTo[0] && belongsTo[0]['value_resource_id'] === sessionId;
            });

            console.log(`Found ${sessionMessages.length} messages to delete`);

            for (const msg of sessionMessages) {
                try {
                    await omk.deleteItem(msg['o:id']);
                } catch (e) {
                    console.log('Note: message may have been deleted:', e.message);
                }
            }
        }

        // Delete the session itself
        await omk.deleteItem(sessionId);

        // If this was the current session, clear it
        if (currentChatSession && currentChatSession['o:id'] === sessionId) {
            currentChatSession = null;
            messages = [];
            displayMessages();
        }

        // Reload sessions list
        await loadChatSessions();

        alert('Conversation supprimée avec succès!');
    } catch (error) {
        console.error('Error deleting chat session:', error);
        // Reload anyway in case partial deletion succeeded
        await loadChatSessions();
        alert('Suppression terminée. La conversation a été supprimée.');
    }
};

// Send message
document.getElementById('chatForm')?.addEventListener('submit', async function (e) {
    e.preventDefault();

    if (!currentChatSession) {
        await createNewChat();
    }

    const input = document.getElementById('messageInput');
    const sendBtn = document.getElementById('sendBtn');
    const message = input.value.trim();

    if (!message) return;

    input.value = '';
    input.disabled = true;
    if (sendBtn) {
        sendBtn.disabled = true;
        sendBtn.textContent = 'Envoi...';
    }

    try {
        // Save user message
        await saveMessage(message, 'user');

        // Show loading indicator
        showLoadingIndicator();

        // Get AI response
        const aiResponse = await getAIResponse(message);

        // Remove loading indicator
        hideLoadingIndicator();

        // Save AI response
        await saveMessage(aiResponse, 'assistant');

    } catch (error) {
        console.error('Error sending message:', error);
        hideLoadingIndicator();
        alert('Erreur lors de l\'envoi du message');
    } finally {
        input.disabled = false;
        if (sendBtn) {
            sendBtn.disabled = false;
            sendBtn.textContent = 'Envoyer';
        }
        input.focus();
    }
});

// Handle Enter key in textarea
document.getElementById('messageInput')?.addEventListener('keydown', function (e) {
    if (e.key === 'Enter' && !e.shiftKey) {
        e.preventDefault();
        document.getElementById('chatForm').dispatchEvent(new Event('submit'));
    }
});

function showLoadingIndicator() {
    const container = document.getElementById('chatMessages');
    if (!container) return;

    const loadingDiv = document.createElement('div');
    loadingDiv.id = 'loadingIndicator';
    loadingDiv.className = 'loading-indicator';
    loadingDiv.innerHTML = `
        <div class="message-avatar">🤖</div>
        <div class="loading-dots">
            <div class="loading-dot"></div>
            <div class="loading-dot"></div>
            <div class="loading-dot"></div>
        </div>
    `;
    container.appendChild(loadingDiv);
    container.scrollTop = container.scrollHeight;
}

function hideLoadingIndicator() {
    const loadingDiv = document.getElementById('loadingIndicator');
    if (loadingDiv) {
        loadingDiv.remove();
    }
}

async function saveMessage(content, role, audioBlob = null) {
    try {
        const messageClass = omk.getClassByTerm('ke:ChatMessage');
        if (!messageClass) {
            throw new Error('ChatMessage class not found');
        }

        const messageData = {
            'o:resource_class': { 'o:id': messageClass['o:id'] },
            'ke:content': [{ '@value': content, 'type': 'literal' }],
            'ke:role': [{ '@value': role, 'type': 'literal' }],
            'ke:belongsToSession': [{ 'value_resource_id': currentChatSession['o:id'], 'type': 'resource' }]
        };

        // If there's audio, add file marker for formatData
        if (audioBlob) {
            messageData['file'] = 1;
        }

        // Add resource template if exists
        const msgRT = omk.getRt('ChatMessage');
        if (msgRT) {
            messageData['o:resource_template'] = { 'o:id': msgRT['o:id'] };
        }

        // If there's an audio blob, upload it as media
        let savedMessage;
        if (audioBlob) {
            console.log('Uploading audio to Omeka...', {
                blobSize: audioBlob.size,
                blobType: audioBlob.type
            });

            // Convert Blob to File with a proper filename
            // Omeka needs a File object with a name property to create media
            const timestamp = Date.now();
            const extension = audioBlob.type.includes('webm') ? 'webm' : 'mp3';
            const audioFile = new File([audioBlob], `voice_message_${timestamp}.${extension}`, {
                type: audioBlob.type,
                lastModified: timestamp
            });

            console.log('Created File object:', {
                name: audioFile.name,
                type: audioFile.type,
                size: audioFile.size
            });

            // The omk.createItem signature is: createItem(data, file, callback, verifDoublons)
            savedMessage = await new Promise((resolve, reject) => {
                omk.createItem(messageData, audioFile, (item) => {
                    console.log('Audio message created:', item);
                    resolve(item);
                }, null);
            });

            // Reload the message to get media information
            if (savedMessage && savedMessage['o:id']) {
                await new Promise(resolve => setTimeout(resolve, 1000)); // Wait for media to be processed
                savedMessage = await omk.getItem(savedMessage['o:id']);
                console.log('Reloaded message with media:', savedMessage);

                // If media exists, fetch the full media object(s)
                if (savedMessage['o:media'] && savedMessage['o:media'].length > 0) {
                    // Fetch full media details for each media item
                    const mediaPromises = savedMessage['o:media'].map(async (mediaRef) => {
                        const mediaId = mediaRef['o:id'] || (mediaRef['@id'] ? parseInt(mediaRef['@id'].split('/').pop()) : null);
                        if (mediaId) {
                            return await omk.getMedia(mediaId);
                        }
                        return mediaRef;
                    });
                    const fullMediaItems = await Promise.all(mediaPromises);
                    savedMessage['o:media'] = fullMediaItems;
                    console.log('Fetched full media details:', fullMediaItems);
                }
            }
        } else {
            savedMessage = await omk.createItem(messageData);
        }

        messages.push(savedMessage);
        displayMessages();
        return savedMessage;
    } catch (error) {
        console.error('Error saving message:', error);
        throw error;
    }
}

async function getAIResponse(userMessage) {
    const apiUrl = localStorage.getItem('anythingllm_api_url');
    const apiKey = localStorage.getItem('anythingllm_api_key');
    const workspace = localStorage.getItem('anythingllm_workspace');

    if (!apiUrl || !apiKey || !workspace) {
        return '⚠️ Configuration AnythingLLM manquante. Veuillez configurer l\'API dans le panneau d\'administration.';
    }

    // Get thread slug from current session
    let threadSlug = null;
    if (currentChatSession) {
        threadSlug = getPropertyValue(currentChatSession, 'ke:threadSlug');
    }

    try {
        const requestBody = {
            message: userMessage,
            mode: 'chat'
        };

        // Add thread slug if available to maintain conversation context
        if (threadSlug) {
            requestBody.sessionId = threadSlug;
        }

        const response = await fetch(`${apiUrl}/v1/workspace/${workspace}/chat`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${apiKey}`
            },
            body: JSON.stringify(requestBody)
        });

        if (!response.ok) {
            throw new Error(`API error: ${response.status}`);
        }

        const data = await response.json();
        return data.textResponse || 'Désolé, je n\'ai pas pu générer de réponse.';
    } catch (error) {
        console.error('AnythingLLM API error:', error);
        return `❌ Erreur de connexion à AnythingLLM: ${error.message}`;
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

function getPropertyResourceId(item, propertyTerm) {
    if (!item || !item[propertyTerm]) return null;
    const prop = item[propertyTerm];
    if (Array.isArray(prop) && prop.length > 0) {
        return prop[0]['value_resource_id'] || null;
    }
    return null;
}

// Initialize
document.addEventListener('DOMContentLoaded', async () => {
    if (!checkAuth()) return;

    // Display user name
    document.getElementById('userName').textContent = `${currentUser.firstName} ${currentUser.lastName}`;

    // Wait for omk to initialize
    setTimeout(async () => {
        await loadChatSessions();
        initVoiceRecorder();
    }, 1000);
});

// Voice Recording Implementation
let audioCtx;
let mediaRecorder;
let chunks = [];

window.toggleVoiceRecorder = function () {
    const recorderSection = document.getElementById('voiceRecorderSection');
    if (recorderSection.style.display === 'none') {
        recorderSection.style.display = 'block';
    } else {
        recorderSection.style.display = 'none';
    }
};

function initVoiceRecorder() {
    const record = document.querySelector('.record');
    const stop = document.querySelector('.stop');
    const soundClips = document.querySelector('.sound-clips');
    const canvas = document.querySelector('.visualizer');

    if (!record || !stop || !soundClips || !canvas) {
        console.warn('Voice recorder elements not found');
        return;
    }

    // Disable stop button initially
    stop.disabled = true;

    // Check for getUserMedia support
    if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
        console.log('MediaDevices.getUserMedia() is supported.');

        const constraints = { audio: true };

        navigator.mediaDevices.getUserMedia(constraints).then(
            function (stream) {
                mediaRecorder = new MediaRecorder(stream);

                visualize(stream, canvas);

                record.onclick = function () {
                    startRecording();
                };

                stop.onclick = function () {
                    stopRecording();
                };

                mediaRecorder.onstop = function (e) {
                    saveVoiceMessage();
                };

                mediaRecorder.ondataavailable = function (e) {
                    chunks.push(e.data);
                };
            },
            function (err) {
                console.error('The following error occurred: ' + err);
                alert('Impossible d\'accéder au microphone. Vérifiez les permissions.');
            }
        );
    } else {
        console.log('MediaDevices.getUserMedia() not supported on your browser!');
        alert('Votre navigateur ne supporte pas l\'enregistrement audio.');
    }
}

function startRecording() {
    const record = document.querySelector('.record');
    const stop = document.querySelector('.stop');

    if (!mediaRecorder) return;

    mediaRecorder.start();
    console.log('Recorder started');
    record.style.background = 'red';
    record.style.color = 'white';
    stop.disabled = false;
    record.disabled = true;
}

function stopRecording() {
    const record = document.querySelector('.record');
    const stop = document.querySelector('.stop');

    if (!mediaRecorder) return;

    mediaRecorder.stop();
    console.log('Recorder stopped');
    record.style.background = '';
    record.style.color = '';
    stop.disabled = true;
    record.disabled = false;
}

async function saveVoiceMessage() {
    if (!currentChatSession) {
        alert('Veuillez créer ou sélectionner une conversation d\'abord.');
        return;
    }

    const soundClips = document.querySelector('.sound-clips');
    const clipContainer = document.createElement('article');
    const clipLabel = document.createElement('p');
    const audio = document.createElement('audio');
    const sendButton = document.createElement('button');
    const deleteButton = document.createElement('button');

    clipContainer.classList.add('clip');
    clipContainer.style.cssText = 'display: flex; align-items: center; gap: 8px; padding: 8px; background: var(--bg); border-radius: 8px;';

    audio.setAttribute('controls', '');
    audio.style.cssText = 'flex: 1; height: 32px;';

    clipLabel.textContent = 'Message vocal';
    clipLabel.style.cssText = 'margin: 0; font-size: 12px; color: var(--muted);';

    sendButton.textContent = '📤 Envoyer';
    sendButton.className = 'btn-primary';
    sendButton.style.cssText = 'padding: 6px 12px; font-size: 12px;';

    deleteButton.textContent = '🗑️';
    deleteButton.className = 'btn-ghost';
    deleteButton.style.cssText = 'padding: 6px 12px; font-size: 12px;';

    clipContainer.appendChild(audio);
    clipContainer.appendChild(clipLabel);
    clipContainer.appendChild(sendButton);
    clipContainer.appendChild(deleteButton);
    soundClips.appendChild(clipContainer);

    const blob = new Blob(chunks, { type: mediaRecorder.mimeType });
    chunks = [];
    const audioURL = window.URL.createObjectURL(blob);
    audio.src = audioURL;

    // Delete button handler
    deleteButton.onclick = function (e) {
        e.target.closest('.clip').remove();
    };

    // Send button handler
    sendButton.onclick = async function () {
        sendButton.disabled = true;
        sendButton.textContent = '⏳ Envoi...';

        try {
            // Upload audio to Omeka and transcribe
            const transcription = await uploadAndTranscribeAudio(blob);

            if (transcription) {
                // Save user message with audio attachment
                await saveMessage(transcription, 'user', blob);

                // Show loading indicator
                showLoadingIndicator();

                // Get AI response (only send transcription text, not audio)
                const aiResponse = await getAIResponse(transcription);

                // Remove loading indicator
                hideLoadingIndicator();

                // Save AI response (without audio)
                await saveMessage(aiResponse, 'assistant');

                clipContainer.remove();
                toggleVoiceRecorder(); // Close recorder section
            }
        } catch (error) {
            console.error('Error sending voice message:', error);
            hideLoadingIndicator();
            alert('Erreur lors de l\'envoi du message vocal.');
            sendButton.disabled = false;
            sendButton.textContent = '📤 Envoyer';
        }
    };
}

async function uploadAndTranscribeAudio(audioBlob) {
    try {
        // Get Whisper endpoint from settings
        const whisperEndpoint = localStorage.getItem('whisper_transcription_endpoint');

        if (!whisperEndpoint) {
            alert('Le endpoint Whisper n\'est pas configuré. Veuillez le configurer dans les paramètres admin.');
            return null;
        }

        console.log('Starting transcription...', {
            endpoint: whisperEndpoint,
            blobSize: audioBlob.size,
            blobType: audioBlob.type
        });

        // Transcribe audio using Whisper API
        const formData = new FormData();
        // Use 'file' as the field name to match the FastAPI server's parameter
        // Keep the original blob type (usually audio/webm or audio/mp4)
        const filename = audioBlob.type.includes('webm') ? 'recording.webm' : 'recording.mp3';
        formData.append('file', audioBlob, filename);

        const transcribeResponse = await fetch(whisperEndpoint, {
            method: 'POST',
            body: formData
        });

        if (!transcribeResponse.ok) {
            const errorText = await transcribeResponse.text();
            console.error('Transcription failed:', errorText);
            throw new Error(`Transcription failed: ${errorText}`);
        }

        const transcriptionData = await transcribeResponse.json();
        // The server returns {"transcription": "text here"}
        const transcription = transcriptionData.transcription || '';

        if (!transcription) {
            throw new Error('No transcription text returned from server');
        }

        console.log('Transcription received:', transcription);
        return transcription;
    } catch (error) {
        console.error('Error in uploadAndTranscribeAudio:', error);
        throw error;
    }
}

async function sendMessage(content, role, audioBlob = null) {
    // This function will be updated to handle voice attachments
    // For now, it will just send the transcribed text
    const messageInput = document.getElementById('messageInput');
    messageInput.value = content;

    // Trigger the regular send message flow
    const event = new Event('submit', { bubbles: true, cancelable: true });
    document.getElementById('chatForm').dispatchEvent(event);
}

function visualize(stream, canvas) {
    if (!audioCtx) {
        audioCtx = new AudioContext();
    }

    const source = audioCtx.createMediaStreamSource(stream);
    const analyser = audioCtx.createAnalyser();
    analyser.fftSize = 2048;
    const bufferLength = analyser.frequencyBinCount;
    const dataArray = new Uint8Array(bufferLength);

    source.connect(analyser);

    const canvasCtx = canvas.getContext('2d');

    function draw() {
        const WIDTH = canvas.width;
        const HEIGHT = canvas.height;

        requestAnimationFrame(draw);

        analyser.getByteTimeDomainData(dataArray);

        canvasCtx.fillStyle = 'rgb(200, 200, 200)';
        canvasCtx.fillRect(0, 0, WIDTH, HEIGHT);

        canvasCtx.lineWidth = 2;
        canvasCtx.strokeStyle = 'rgb(0, 0, 0)';

        canvasCtx.beginPath();

        let sliceWidth = (WIDTH * 1.0) / bufferLength;
        let x = 0;

        for (let i = 0; i < bufferLength; i++) {
            let v = dataArray[i] / 128.0;
            let y = (v * HEIGHT) / 2;

            if (i === 0) {
                canvasCtx.moveTo(x, y);
            } else {
                canvasCtx.lineTo(x, y);
            }

            x += sliceWidth;
        }

        canvasCtx.lineTo(canvas.width, canvas.height / 2);
        canvasCtx.stroke();
    }

    draw();
}

// Convert references like RECIPE-123, INGREDIENT-45, etc. to clickable links
function convertReferencesToLinks(text) {
    if (!text) return text;

    // Escape HTML first to prevent XSS
    const escapeHtml = (str) => {
        const div = document.createElement('div');
        div.textContent = str;
        return div.innerHTML;
    };

    const escaped = escapeHtml(text);

    // Pattern to match references: RECIPE-123, INGREDIENT-45, USER-7, POST-89, etc.
    const referencePattern = /\b([A-Z]+)-(\d+)\b/g;

    return escaped.replace(referencePattern, (match, type, id) => {
        // Determine the target page based on type
        let url = '';
        let label = match;
        let icon = '';

        switch (type.toUpperCase()) {
            case 'RECIPE':
                url = `recipe-detail.html?id=${id}`;
                icon = '🍳';
                label = `${icon} ${match}`;
                break;
            case 'INGREDIENT':
                url = `#ingredient-${id}`; // Could link to ingredient detail if exists
                icon = '🥕';
                label = `${icon} ${match}`;
                break;
            case 'USER':
                url = `#user-${id}`; // Could link to user profile if exists
                icon = '👤';
                label = `${icon} ${match}`;
                break;
            case 'POST':
                url = `posts.html#post-${id}`;
                icon = '📝';
                label = `${icon} ${match}`;
                break;
            default:
                // Unknown type, just return the match without link
                return match;
        }

        return `<a href="${url}" class="reference-link" target="_blank" style="color: var(--accent); text-decoration: underline; font-weight: 600;">${label}</a>`;
    });
}
