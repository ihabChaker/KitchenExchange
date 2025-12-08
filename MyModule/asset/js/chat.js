(function () {
    'use strict';

    const chatMessages = document.getElementById('chat-messages');
    const userInput = document.getElementById('user-input');
    const sendBtn = document.getElementById('send-btn');

    if (!chatMessages || !userInput || !sendBtn) {
        return; // Not on a chat page
    }

    const chatId = window.chatId;
    const queryUrl = window.queryUrl;
    const loadMessagesUrl = window.loadMessagesUrl;

    // Load existing messages on page load
    loadMessages();

    // Send message on button click
    sendBtn.addEventListener('click', sendMessage);

    // Send message on Enter (Shift+Enter for new line)
    userInput.addEventListener('keydown', function (e) {
        if (e.key === 'Enter' && !e.shiftKey) {
            e.preventDefault();
            sendMessage();
        }
    });

    function loadMessages() {
        fetch(loadMessagesUrl + '?chat_id=' + chatId)
            .then(response => response.json())
            .then(data => {
                if (data.error) {
                    console.error('Error loading messages:', data.error);
                    return;
                }

                chatMessages.innerHTML = '';
                if (data.messages && data.messages.length > 0) {
                    data.messages.forEach(msg => {
                        addMessageToChat(msg.role, msg.content, false);
                    });
                    scrollToBottom();
                }
            })
            .catch(error => {
                console.error('Error:', error);
            });
    }

    function sendMessage() {
        const message = userInput.value.trim();

        if (!message) {
            return;
        }

        // Disable input while processing
        userInput.disabled = true;
        sendBtn.disabled = true;
        sendBtn.textContent = 'Sending...';

        // Add user message to chat
        addMessageToChat('user', message);
        userInput.value = '';
        scrollToBottom();

        // Send to server
        fetch(queryUrl, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                message: message,
                chat_id: chatId
            })
        })
            .then(response => response.json())
            .then(data => {
                if (data.error) {
                    addMessageToChat('error', 'Error: ' + data.error);
                } else {
                    addMessageToChat('assistant', data.reply);
                }
                scrollToBottom();
            })
            .catch(error => {
                addMessageToChat('error', 'Connection error: ' + error.message);
                scrollToBottom();
            })
            .finally(() => {
                userInput.disabled = false;
                sendBtn.disabled = false;
                sendBtn.textContent = 'Send';
                userInput.focus();
            });
    }

    function addMessageToChat(role, content, animate = true) {
        const messageDiv = document.createElement('div');
        messageDiv.className = 'message message-' + role;

        const roleLabel = document.createElement('div');
        roleLabel.className = 'message-role';
        roleLabel.textContent = role === 'user' ? 'You' : (role === 'assistant' ? 'Assistant' : 'System');

        const contentDiv = document.createElement('div');
        contentDiv.className = 'message-content';
        contentDiv.textContent = content;

        messageDiv.appendChild(roleLabel);
        messageDiv.appendChild(contentDiv);

        if (animate) {
            messageDiv.style.opacity = '0';
            messageDiv.style.transform = 'translateY(10px)';
        }

        chatMessages.appendChild(messageDiv);

        if (animate) {
            setTimeout(() => {
                messageDiv.style.transition = 'opacity 0.3s, transform 0.3s';
                messageDiv.style.opacity = '1';
                messageDiv.style.transform = 'translateY(0)';
            }, 10);
        }
    }

    function scrollToBottom() {
        chatMessages.scrollTop = chatMessages.scrollHeight;
    }
})();
