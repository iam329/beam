$(document).ready(function() {
        
        $(".feature").find("button").click(function() {

        var vid = $(this).attr("vid");
        var title = $(this).attr("title");
        var artist = $(this).attr("artist");
        var episode = $(this).attr("episode");
        var created = $(this).attr("created");

        $(".youtube-player").attr("src", vid);
        $(".track-info").find("#episode-number").text("Episode "+episode);
        $(".track-info").find("#track-title").find("h4").text(title);
        $(".track-info").find("#artist-name").text(artist);
        $(".track-info").find("#timestamp").text(created+" ago");
        });

        $(".home-feature").find("button").click(function() {

            var track = Number($(this).attr("track"));
            //$(".youtube-player").attr("src", vid);
            changeHomeStageInfo(this);
            player.playVideoAt(track);
        });
      
});

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
        changeHomeStageInfo(gem);
    }
};

function onPlayerReady(event) {
  //window.alert(player.getPlaylistIndex());
};

function changeHomeStageInfo(gem) { 
    $(".track-info").find("#track-title").find("h4").text(gem.getAttribute("title"));
    //window.alert(gem.artist);
    $(".track-info").find("#artist-name").text(gem.getAttribute("artist"));
    $(".track-info").find("#timestamp").find("#username").find("a").text(gem.getAttribute("user"));
    $(".track-info").find("#timestamp").find("#time").text("Posted "+gem.getAttribute("created")+ " ago by ");
    $(".track-info").find("#profile-photo").find("img").attr("src", gem.getAttribute("photo"));
};
