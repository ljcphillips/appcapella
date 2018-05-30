jQuery( document ).ready(function($) {
    $('#playButton').click(function() {
        $('#video1').get(0).play()
        $('#video2').get(0).play()
    });
});
