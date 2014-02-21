$(document).ready(function() {
	$("a").click(function() {
	
	var vid = $(this).attr("vid");
	var title = $(this).attr("title");
	var artist = $(this).attr("artist"); 
	$(".youtube-player").attr("src", vid);
	$(".track-info").find("h5").text(title);

	});
});


	
