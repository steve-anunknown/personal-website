// Web Audio API setup for visualizer
const audioCtx = new (window.AudioContext || window.webkitAudioContext)();
const audioElement = document.getElementById('audioPlayer');
const canvas = document.getElementById('visualizer');
const canvasCtx = canvas.getContext('2d');

let analyser = audioCtx.createAnalyser();
let audioSource = audioCtx.createMediaElementSource(audioElement);
audioSource.connect(analyser);
analyser.connect(audioCtx.destination);

// Visualization settings
analyser.fftSize = 256;
const bufferLength = analyser.frequencyBinCount;
const dataArray = new Uint8Array(bufferLength);

// Visualizer function
function drawVisualizer() {
    requestAnimationFrame(drawVisualizer);

    analyser.getByteFrequencyData(dataArray);

    canvasCtx.fillStyle = '#fafafa';
    canvasCtx.fillRect(0, 0, canvas.width, canvas.height);

    const barWidth = (canvas.width / bufferLength) * 2.5;
    let barHeight;
    let x = 0;

    for (let i = 0; i < bufferLength; i++) {
        barHeight = dataArray[i] / 1.2; // modify the number to adjust the bar height
        canvasCtx.fillStyle = `rgb(${barHeight + 100}, 50, 50)`;
        canvasCtx.fillRect(x, canvas.height - barHeight / 2, barWidth, barHeight);

        x += barWidth + 1;
    }
}

// Start visualizer when audio plays
audioElement.onplay = function() {
    audioCtx.resume().then(() => {
        drawVisualizer();
    });
};

