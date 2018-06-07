// A list of the elements, linking to index.erb with the classes (e.g. .record)
var record = document.querySelector('.record');
var stop = document.querySelector('.stop');

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
          $('#playButton').click();
        }

        // Here is the array of frames
        var chunks = [];
        // data available (stream of frames) gets pushed into chunks array
        mediaRecorder.ondataavailable = function(e) {
          chunks.push(e.data);
        }

        // When you click stop (see top) it stops mediarecorder.
        stop.onclick = function() {
          mediaRecorder.stop();
          record.style.background = "";
          record.style.color = "";
        }

        // Because MediaRecorder was just stopped, it executes the following:
        mediaRecorder.onstop = function(e) {
          console.log("recorder stopped");

          // Prompts for a number, creates elements for the video
          var number = prompt('Fab, now which video would you like to replace? Enter 1, 2, 3 or 4');

          // Here's our blob of chunks.
          var blob = new Blob(chunks, { 'type' : 'video/mp4' });
          chunks = [];

          // This form gets passed the name, data, and filename
          var formData = new FormData();
          formData.append(("video_upload_" + number), blob, ('video_' + number + '.mp4'));

          // Creates a new post request, sending it the form
          var request = new XMLHttpRequest();
          request.open("POST", ("upload_" + number), false);
          request.send(formData);

          // Reloads the page
          location = location;
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
