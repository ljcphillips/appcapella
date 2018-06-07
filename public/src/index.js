jQuery( document ).ready(function($) {
    $('#playButton').click(function() {
        $('#video1').get(0).play()
        $('#video2').get(0).play()
        $('#video3').get(0).play()
        $('#video4').get(0).play()
    });
});
jQuery( document ).ready(function($) {
    $('#pauseButton').click(function() {
        $('#video1').get(0).pause()
        $('#video2').get(0).pause()
        $('#video3').get(0).pause()
        $('#video4').get(0).pause()
    });
});

jQuery( document ).ready(function($) {
    $('#rewindButton').click(function() {
        $('#video1').get(0).currentTime = 0
        $('#video2').get(0).currentTime = 0
        $('#video3').get(0).currentTime = 0
        $('#video4').get(0).currentTime = 0
    });
});
