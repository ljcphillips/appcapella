
var record = document.querySelector('.record');
var stop = document.querySelector('.stop');
var videoClips = document.querySelector('.video-clips');

if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
   console.log('getUserMedia supported.');
   navigator.mediaDevices.getUserMedia (
      // constraints - only audio needed for this app
      {  video: true,
         audio: true
      })

      // Success callback
      .then(function(stream) {
        var mediaRecorder = new MediaRecorder(stream);

        record.onclick = function() {
          mediaRecorder.start();
          console.log(mediaRecorder.state);
          console.log("recorder started");
          record.style.background = "red";
          record.style.color = "black";
        }

        var chunks = [];

        mediaRecorder.ondataavailable = function(e) {
          chunks.push(e.data);
        }

        stop.onclick = function() {
          mediaRecorder.stop();
          console.log(mediaRecorder.state);
          console.log("recorder stopped");
          record.style.background = "";
          record.style.color = "";
        }

        mediaRecorder.onstop = function(e) {
          console.log("recorder stopped");

          var clipName = prompt('Enter a name for your sound clip');

          var clipContainer = document.createElement('article');
          var clipLabel = document.createElement('p');
          var video = document.createElement('video');
          var deleteButton = document.createElement('button');

          clipContainer.classList.add('clip');
          video.setAttribute('controls', '');
          deleteButton.innerHTML = "Delete";
          clipLabel.innerHTML = clipName;

          clipContainer.appendChild(video);
          clipContainer.appendChild(clipLabel);
          clipContainer.appendChild(deleteButton);
          videoClips.appendChild(clipContainer);

          var blob = new Blob(chunks, { 'type' : 'video/mp4' });
          chunks = [];

          var formData = new FormData();
          formData.append("video_upload_5", blob, 'video.mp4');
          var request = new XMLHttpRequest();
          request.open("POST", "/upload_5");
          request.send(formData);


          var videoURL = window.URL.createObjectURL(blob);
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
