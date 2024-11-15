// js/shuffle.js

// Function to shuffle and play a random audio file
function shuffleAudio() {
    var randomIndex = Math.floor(Math.random() * audioFiles.length);
    var audioPlayer = document.getElementById('audioPlayer');
    var source = audioPlayer.getElementsByTagName('source')[0];
    var currentSongElement = document.getElementById('currentSong');
    var currentArtistElement = document.getElementById('currentArtist');
    var currentAlbumElement = document.getElementById('currentAlbum');

    var selectedFile = audioFiles[randomIndex]; // Randomly selected audio file
    var jsmediatags = window.jsmediatags;

    // Set the source of the audio player
    source.src = selectedFile;
    audioPlayer.load();
    audioPlayer.play();

    var baseUrl = window.location.origin;
    selectedFile = selectedFile.replace('./audio', baseUrl + '/audio');   
    // Use jsmediatags to extract and display metadata
    jsmediatags.read(selectedFile, {
        onSuccess: function(tag) {
            var title = tag.tags.title || "Unknown Title";
            var artist = tag.tags.artist || "Unknown Artist";
            var album = tag.tags.album || "Unknown Album";

            // Update the displayed metadata
            currentSongElement.textContent = "Currently playing: " + title;
            currentArtistElement.textContent = "Artist: " + artist;
            currentAlbumElement.textContent = "Album: " + album;
        },
        onError: function(error) {
            console.log('Error reading tags: ', error);
            // In case of error, update with "Unknown" values
            currentSongElement.textContent = "Currently playing: Unknown Title";
            currentArtistElement.textContent = "Artist: Unknown Artist";
            currentAlbumElement.textContent = "Album: Unknown Album";
        }
    });
}

// Attach the event listener to the button after the document loads
document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('shuffleButton').addEventListener('click', shuffleAudio);
});

