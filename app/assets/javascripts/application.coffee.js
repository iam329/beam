// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .

$(document).ready(function() {
        
        $(".feature").find("button").click(function() {

            var episode = $(this).attr("episode");
            $(".track-info").find("#episode-number").text("Episode "+episode);

            var track = Number($(this).attr("track"));
            //$(".youtube-player").attr("src", vid);
            changeStageInfo(this);
            player.playVideoAt(track);
        
        });

        $(".home-feature").find("button").click(function() {

            var track = Number($(this).attr("track"));
            //$(".youtube-player").attr("src", vid);
            changeStageInfo(this);
		    player.playVideoAt(track);
        });
});

// Ran asychronously with the script in home
var player;
function onYouTubePlayerAPIReady() {
	player = new YT.Player('ytplayer', {
    events: {
      'onStateChange': onPlayerStateChange,
      'onReady': onPlayerReady
    }
 });
};

function onPlayerStateChange(event) {
	if(event.data == -1) {
		var gem = document.getElementById("button"+player.getPlaylistIndex());
		changeStageInfo(gem);
        turnOffAllButtons();
        // Turn on Button
        turnOnButton(gem);
	}
};

function onPlayerReady(event) {
    var gem = document.getElementById("button0");
    // Turn on Button
    turnOnButton(gem);
};

function changeStageInfo(gem) {

	$(".track-info").find("#track-title").find("h4").text(gem.getAttribute("title"));
	//window.alert(gem.artist);
    $(".track-info").find("#artist-name").text(gem.getAttribute("artist"));
    $(".track-info").find("#timestamp").find("#username").find("a").text(gem.getAttribute("user"));
    $(".track-info").find("#timestamp").find("#username").find("a").attr("href", "/"+gem.getAttribute("user"));
    $(".track-info").find("#timestamp").find("#time").text("Posted "+gem.getAttribute("created")+ " ago by ");
    $(".track-info").find("#profile-photo").find("img").attr("src", gem.getAttribute("photo"));
    $(".track-info").find("#profile-photo").find("a").attr("href", "/"+gem.getAttribute("user"));

    if(gem.getAttribute("episode"))
        $(".track-info").find("#episode-number").text("Episode "+gem.getAttribute("episode"));

    $(".track-info").find("#blurb").find("#blurb-text").text(gem.getAttribute("blurb"));
    var fill = generateBlurbFill(gem.getAttribute("blurb"));
    $(".track-info").find("#blurb").find("#blurb-fill").text(fill);

};

function turnOnButton(gem) {
    // Turn on Button
    gem.style.opacity = 1.0;
    //gem.style.filter = alpha(opacity=100);

}

function turnOffButton(gem) {
    gem.style.opacity = 0.60;
    //gem.style.filter = alpha(opacity=50);
}

function turnOffAllButtons() {
    var all = document.getElementsByClassName('menu-item');
    // turn off all buttons
    for (var i = 0; i < all.length; i++) {
        turnOffButton(all[i]);
    }
}
