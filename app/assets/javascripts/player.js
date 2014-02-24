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
	
	var vid = $(this).attr("vid");
	var title = $(this).attr("title");
	var artist = $(this).attr("artist"); 
	var created = $(this).attr("created");
	var photo = $(this).attr("photo");
	var username = $(this).attr("user");
	
	$(".youtube-player").attr("src", vid);
	$(".track-info").find("#track-title").find("h4").text(title);
	$(".track-info").find("#artist-name").text(artist);
	$(".track-info").find("#timestamp").find("#username").text(username);
	$(".track-info").find("#timestamp").find("#time").text("Posted "+created+ " ago by ");
	$(".track-info").find("#profile-photo").find("img").attr("src", photo);

	});

});


	
