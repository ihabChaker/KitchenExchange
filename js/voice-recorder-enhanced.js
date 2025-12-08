import { Omk } from '../modules/omk.js';

const omk = new Omk({
    api: 'http://localhost/omk_thyp_25-26_clone/api/',
    ident: 'neecG2mXbk1MDcdL4t2vnYx3BxtVL0OM',
    key: 'KrpZ7cl2tRCoYhpIC7zVkbLOpSKONsPx',
    mail: 'samuel.szoniecky@univ-paris8.fr',
    vocabs: ['ke', 'dcterms', 'foaf']
});

omk.init();

const record = document.querySelector(".record");
const stop = document.querySelector(".stop");
const soundClips = document.querySelector(".sound-clips");
const canvas = document.querySelector(".visualizer");
const mainSection = document.querySelector(".main-controls");

// Get recipe ID from URL if provided
const urlParams = new URLSearchParams(window.location.search);
const recipeId = urlParams.get('recipeId');

// Update info if linked to a recipe
if (recipeId) {
    loadRecipeInfo(recipeId);
}

async function loadRecipeInfo(id) {
    try {
        const recipe = await omk.getItem(id);
        const name = getPropertyValue(recipe, 'ke:name') || recipe['o:title'];
        document.getElementById('recipeInfo').innerHTML = `
            <strong>Enregistrement pour:</strong> ${name}
        `;
    } catch (error) {
        console.error('Error loading recipe:', error);
    }
}

// Disable stop button while not recording
stop.disabled = true;

// Visualiser setup
let audioCtx;
const canvasCtx = canvas.getContext("2d");

// Main block for audio recording
if (navigator.mediaDevices.getUserMedia) {
    console.log("MediaDevices.getUserMedia() is supported.");

    const constraints = { audio: true };
    let chunks = [], mediaRecorder, intervalId;

    let onSuccess = function (stream) {
        mediaRecorder = new MediaRecorder(stream);

        visualize(stream);

        record.onclick = function () {
            startRecord();
            saveRecord();
        };

        stop.onclick = function () {
            stopRecord();
            clearInterval(intervalId);
        };

        mediaRecorder.onstop = function (e) {
            saveSound();
        };

        mediaRecorder.ondataavailable = function (e) {
            chunks.push(e.data);
        };
    };

    let frags = 1, durFrag = 180000; // 3 minutes

    function saveRecord() {
        intervalId = setInterval(recordStopStart, durFrag);
    }

    function recordStopStart() {
        stopRecord();
        startRecord();
    }

    function startRecord() {
        mediaRecorder.start();
        console.log(mediaRecorder.state);
        console.log("Recorder started.");
        record.style.background = "red";
        record.style.color = "white";

        stop.disabled = false;
        record.disabled = true;
    }

    function stopRecord() {
        mediaRecorder.stop();
        console.log(mediaRecorder.state);
        console.log("Recorder stopped.");
        record.style.background = "";
        record.style.color = "";
        stop.disabled = true;
        record.disabled = false;
    }

    async function saveSound() {
        const clipContainer = document.createElement("article");
        const clipLabel = document.createElement("p");
        const audio = document.createElement("audio");
        const deleteButton = document.createElement("button");
        const renameButton = document.createElement("button");

        clipContainer.classList.add("clip");
        audio.setAttribute("controls", "");
        deleteButton.textContent = "Supprimer";
        deleteButton.className = "delete";
        renameButton.textContent = "Renommer";
        renameButton.className = "rename";

        clipContainer.appendChild(clipLabel);
        clipContainer.appendChild(audio);
        clipContainer.appendChild(renameButton);
        clipContainer.appendChild(deleteButton);
        soundClips.appendChild(clipContainer);

        const blob = new Blob(chunks, { type: mediaRecorder.mimeType });
        chunks = [];

        const audioURL = window.URL.createObjectURL(blob);
        audio.src = audioURL;

        let clipName = `Enregistrement ${new Date().toLocaleString('fr-FR')}`;
        if (recipeId) {
            clipName = `Avis recette #${recipeId} - ${new Date().toLocaleString('fr-FR')}`;
        }
        clipLabel.textContent = clipName;

        // Save to Omeka
        try {
            console.log("Saving to Omeka...");

            // Create a File object from the Blob
            const file = new File([blob], `${clipName}.webm`, { type: blob.type });

            // Prepare item data
            const itemData = {
                'dcterms:title': [{ '@value': clipName, 'type': 'literal' }],
                'dcterms:description': [{ '@value': 'Enregistrement vocal', 'type': 'literal' }]
            };

            // If linked to a recipe, add the relation
            if (recipeId) {
                itemData['dcterms:relation'] = [{ 'value_resource_id': parseInt(recipeId), 'type': 'resource' }];
            }

            const result = await omk.createItem(itemData, file);
            console.log("Saved to Omeka:", result);

            // Store the Omeka item ID for later deletion
            clipContainer.dataset.omekaId = result['o:id'];

        } catch (error) {
            console.error("Error saving to Omeka:", error);
            alert("Erreur lors de la sauvegarde de l'enregistrement");
        }

        deleteButton.onclick = async function (e) {
            if (!confirm("Êtes-vous sûr de vouloir supprimer cet enregistrement ?")) {
                return;
            }

            // Delete from Omeka if it has an ID
            if (clipContainer.dataset.omekaId) {
                try {
                    await omk.deleteItem(clipContainer.dataset.omekaId);
                    console.log("Deleted from Omeka");
                } catch (error) {
                    console.error("Error deleting from Omeka:", error);
                }
            }

            let evtTgt = e.target;
            evtTgt.parentNode.parentNode.removeChild(evtTgt.parentNode);
        };

        renameButton.onclick = function (e) {
            const newName = prompt("Nouveau nom:", clipLabel.textContent);
            if (newName) {
                clipLabel.textContent = newName;

                // Update in Omeka
                if (clipContainer.dataset.omekaId) {
                    omk.updateItem(clipContainer.dataset.omekaId, {
                        'dcterms:title': [{ '@value': newName, 'type': 'literal' }]
                    }).catch(err => console.error("Error updating title:", err));
                }
            }
        };

        clipLabel.onclick = function () {
            const existingName = clipLabel.textContent;
            const newClipName = prompt("Entrer un nouveau nom:", existingName);

            if (newClipName === null || newClipName === existingName) {
                clipLabel.textContent = existingName;
            } else {
                clipLabel.textContent = newClipName;

                // Update in Omeka
                if (clipContainer.dataset.omekaId) {
                    omk.updateItem(clipContainer.dataset.omekaId, {
                        'dcterms:title': [{ '@value': newClipName, 'type': 'literal' }]
                    }).catch(err => console.error("Error updating title:", err));
                }
            }
        };
    }

    let onError = function (err) {
        console.log("The following error occurred: " + err);
        alert("Erreur d'accès au microphone. Veuillez autoriser l'accès au microphone.");
    };

    navigator.mediaDevices.getUserMedia(constraints).then(onSuccess, onError);

} else {
    console.log("getUserMedia not supported on your browser!");
    alert("Votre navigateur ne supporte pas l'enregistrement audio.");
}

function visualize(stream) {
    if (!audioCtx) {
        audioCtx = new AudioContext();
    }

    const source = audioCtx.createMediaStreamSource(stream);

    const analyser = audioCtx.createAnalyser();
    analyser.fftSize = 2048;
    const bufferLength = analyser.frequencyBinCount;
    const dataArray = new Uint8Array(bufferLength);

    source.connect(analyser);

    draw();

    function draw() {
        const WIDTH = canvas.width;
        const HEIGHT = canvas.height;

        requestAnimationFrame(draw);

        analyser.getByteTimeDomainData(dataArray);

        canvasCtx.fillStyle = "rgb(245, 247, 251)";
        canvasCtx.fillRect(0, 0, WIDTH, HEIGHT);

        canvasCtx.lineWidth = 2;
        canvasCtx.strokeStyle = "rgb(43, 122, 120)";

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
}

// Load existing recordings from Omeka
async function loadExistingRecordings() {
    try {
        // Query for items with audio media
        const items = await omk.getItems({
            per_page: 100,
            sort_by: 'created',
            sort_order: 'desc'
        });

        // Filter items that have media and are audio recordings
        const audioItems = items.filter(item => {
            if (!item['o:media'] || item['o:media'].length === 0) return false;
            const title = getPropertyValue(item, 'dcterms:title') || '';
            return title.includes('Enregistrement') || title.includes('Avis');
        });

        // Display existing recordings
        audioItems.forEach(item => {
            const clipContainer = document.createElement("article");
            const clipLabel = document.createElement("p");
            const audio = document.createElement("audio");
            const deleteButton = document.createElement("button");
            const renameButton = document.createElement("button");

            clipContainer.classList.add("clip");
            audio.setAttribute("controls", "");
            deleteButton.textContent = "Supprimer";
            deleteButton.className = "delete";
            renameButton.textContent = "Renommer";
            renameButton.className = "rename";

            const title = getPropertyValue(item, 'dcterms:title') || 'Enregistrement';
            clipLabel.textContent = title;

            // Get media URL
            if (item['o:media'] && item['o:media'].length > 0) {
                const mediaUrl = item['o:media'][0]['o:original_url'] || item['o:media'][0]['@id'];
                audio.src = mediaUrl;
            }

            clipContainer.dataset.omekaId = item['o:id'];

            clipContainer.appendChild(clipLabel);
            clipContainer.appendChild(audio);
            clipContainer.appendChild(renameButton);
            clipContainer.appendChild(deleteButton);
            soundClips.appendChild(clipContainer);

            deleteButton.onclick = async function (e) {
                if (!confirm("Êtes-vous sûr de vouloir supprimer cet enregistrement ?")) {
                    return;
                }

                try {
                    await omk.deleteItem(item['o:id']);
                    clipContainer.remove();
                } catch (error) {
                    console.error("Error deleting from Omeka:", error);
                    alert("Erreur lors de la suppression");
                }
            };

            renameButton.onclick = function (e) {
                const newName = prompt("Nouveau nom:", clipLabel.textContent);
                if (newName) {
                    clipLabel.textContent = newName;

                    omk.updateItem(item['o:id'], {
                        'dcterms:title': [{ '@value': newName, 'type': 'literal' }]
                    }).catch(err => console.error("Error updating title:", err));
                }
            };
        });

    } catch (error) {
        console.error('Error loading existing recordings:', error);
    }
}

// Helper function
function getPropertyValue(item, propertyTerm) {
    if (!item || !item[propertyTerm]) return null;
    const prop = item[propertyTerm];
    if (Array.isArray(prop) && prop.length > 0) {
        return prop[0]['@value'] || prop[0]['o:label'] || null;
    }
    return null;
}

// Load existing recordings when page loads
window.addEventListener('DOMContentLoaded', () => {
    setTimeout(loadExistingRecordings, 1000); // Wait for omk to initialize
});
