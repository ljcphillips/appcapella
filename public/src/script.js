// A list of the elements, linking to index.erb with the classes (e.g. .record)
var record = document.querySelector('.record');
var stop = document.querySelector('.stop');
var videoClips = document.querySelector('.video-clips');

// Checking that getUserMedia is supported. Console logs if supported (line 8) or not supported (down the bottom). Success callback is where all the important stuff is.
if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
   console.log('getUserMedia supported.');
   navigator.mediaDevices.getUserMedia (
      // constraints, if you need them
      {  video: true,
         audio: true
      })

      // Success callback. Here is the stream of frames. Loads mediaRecorder web API.
      .then(function(stream) {
        var mediaRecorder = new MediaRecorder(stream);

        // When you click record (see top) this starts the recorder.
        record.onclick = function() {
          mediaRecorder.start();
          console.log(mediaRecorder.state);
          console.log("recorder started");
          record.style.background = "red";
          record.style.color = "black";
        }

        // Here is the array of frames
        var chunks = [];

        // data available (stream of frames) gets pushed into chunks array
        mediaRecorder.ondataavailable = function(e) {
          chunks.push(e.data);
        }

        // When you click stop (see top) it stops.
        stop.onclick = function() {
          mediaRecorder.stop();
          console.log(mediaRecorder.state);
          console.log("recorder stopped");
          record.style.background = "";
          record.style.color = "";
        }

        mediaRecorder.onstop = function(e) {
          console.log("recorder stopped");

          // Prompts for a name, creates elements for the video
          var clipName = prompt('Enter a name for your sound clip');

          var clipContainer = document.createElement('article');
          var clipLabel = document.createElement('p');
          var video = document.createElement('video');
          var deleteButton = document.createElement('button');
          
          clipContainer.classList.add('clip');
          video.setAttribute('controls', '');
          deleteButton.innerHTML = "Delete";
          clipLabel.innerHTML = clipName;

          // All the things just created get added to the container
          clipContainer.appendChild(video);
          clipContainer.appendChild(clipLabel);
          clipContainer.appendChild(deleteButton);

          // This container gets put in the videoClips at the top of the page, which is displayed
          videoClips.appendChild(clipContainer);

          // Here's our blob of chunks.
          var blob = new Blob(chunks, { 'type' : 'video/mp4' });
          chunks = [];

          // This form gets passed the name, data, and filename
          var formData = new FormData();
          formData.append("video_upload_1", blob, 'video.mp4');
          // Creates a new post request, sending it the form
          var request = new XMLHttpRequest();
          request.open("POST", "/upload_1");
          request.send(formData);

          // This creates a video URL; this is saved on the server with a URL you can get if you use the dev tools
          var videoURL = window.URL.createObjectURL(blob);
          // Sets the source of the video to the blob url (reverse engineer this in the dev tools)
          video.src = videoURL;

          deleteButton.onclick = function(e) {
            var evtTgt = e.target;
            evtTgt.parentNode.parentNode.removeChild(evtTgt.parentNode);


          }
        }

      })

      // Error callback
      .catch(function(err) {
         console.log('The following getUserMedia error occured: ' + err);
      }
   );
} else {
   console.log('getUserMedia not supported on your browser!');
}
