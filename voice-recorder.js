import { Omk } from './modules/omk.js';
const KEY_INDENTITY = "gyNb6qkqdWSqX2kJD1z4cwBkKEYC37fa"
const KEY_CREDENTIAL = "GQmwLHVXR4oJmhO792ty3GOnVda7oLqA"
const BASE_URL = "http://localhost/omk_THyp_25-26_clone"
const MAIL = "benakchaihab@gmail.com"

let omk = new Omk({
    mail: MAIL,
    api: `${BASE_URL}/api/`,
    ident: KEY_INDENTITY,
    key: KEY_CREDENTIAL,
    vocabs: ['ke', 'dcterms', 'foaf']
})

const record = document.querySelector(".record");
const stop = document.querySelector(".stop");
const soundClips = document.querySelector(".sound-clips");
const canvas = document.querySelector(".visualizer");
const mainSection = document.querySelector(".main-controls");

// Disable stop button while not recording
stop.disabled = true;

// Visualiser setup - create web audio api context and canvas
let audioCtx;
const canvasCtx = canvas.getContext("2d");

// Main block for doing the audio recording
if (navigator.mediaDevices.getUserMedia) {
    console.log("The mediaDevices.getUserMedia() method is supported.");

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

    let frags = 1, durFrag = 180000;//3 minutes
    function saveRecord() {
        //enregistre toutes les durFrag
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

    function saveSound() {
        const clipContainer = document.createElement("article");
        const clipLabel = document.createElement("p");
        const audio = document.createElement("audio");
        const deleteButton = document.createElement("button");

        clipContainer.classList.add("clip");
        audio.setAttribute("controls", "");
        deleteButton.textContent = "Delete";
        deleteButton.className = "delete";

        clipLabel.textContent = "Fragment " + frags;
        frags++;

        clipContainer.appendChild(audio);
        clipContainer.appendChild(clipLabel);
        clipContainer.appendChild(deleteButton);
        soundClips.appendChild(clipContainer);

        audio.controls = true;
        const blob = new Blob(chunks, { type: mediaRecorder.mimeType });
        console.log(blob);
        console.log(mediaRecorder.mimeType);
        chunks = [];
        const audioURL = window.URL.createObjectURL(blob);
        audio.src = audioURL;
        console.log("recorder stopped");

        saveToOmk(blob, mediaRecorder.mimeType);

        deleteButton.onclick = function (e) {
            e.target.closest(".clip").remove();
        };

        clipLabel.onclick = function () {
            const existingName = clipLabel.textContent;
            const newClipName = prompt("Enter a new name for your sound clip?");
            if (newClipName === null) {
                clipLabel.textContent = existingName;
            } else {
                clipLabel.textContent = newClipName;
            }
        };

    }

    let onError = function (err) {
        console.log("The following error occured: " + err);
    };

    navigator.mediaDevices.getUserMedia(constraints).then(onSuccess, onError);
} else {
    console.log("MediaDevices.getUserMedia() not supported on your browser!");
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

        canvasCtx.fillStyle = "rgb(200, 200, 200)";
        canvasCtx.fillRect(0, 0, WIDTH, HEIGHT);

        canvasCtx.lineWidth = 2;
        canvasCtx.strokeStyle = "rgb(0, 0, 0)";

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


/**merci à  https://franzeus.medium.com/record-audio-in-js-and-upload-as-wav-or-mp3-file-to-your-backend-1a2f35dea7e8
 * Uploads audio blob to your server
 * @params {Blob} audioBlob - The audio blob data
 * @params {string} fileType - 'mp3' or 'wav'
 * @return {Promise<object>)
 */
async function saveToOmk(audioBlob, fileType) {
    let data = {
        "dcterms:title": "test",
        "file": 1,
    };
    //save image to omeka
    console.log(audioBlob)
    omk.createItem(data, i => {
        console.log(i);
    }, false, audioBlob);

}