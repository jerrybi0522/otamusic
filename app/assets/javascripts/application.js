// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){
	if ($("#song_title").data('cat') == 1){
		$('body').css({
			"background-color": "#ffcce6"
		});
		$('.youtube_video').css({
			"padding": "10px",
			"background-color" : "#F887CB",
			"width": "67.5%",
			"margin": "auto"
		});
	} else if ($("#song_title").data('cat') == 2){
		$('body').css({
			"background-color": "#fff0b3"
		});
		$('.youtube_video').css({
			"padding": "10px",
			"background-color" : "#FFC809",
			"width": "67.5%",
			"margin": "auto"
		});
	} else if ($("#song_title").data('cat') == 3){
		$('body').css({
			"background-color": "#b3ecff"
		});
		$('.youtube_video').css({
			"padding": "10px",
			"background-color" : "#0DB7FF",
			"width": "67.5%",
			"margin": "auto"
		});
	} else if ($("#song_title").data('cat') == 4){
		$('body').css({
			"background-color": "#ff9999"
		});
		$('.youtube_video').css({
			"padding": "10px",
			"background-color" : "#0DB7FF",
			"width": "67.5%",
			"margin": "auto"
		});
	} else if ($("#song_title").data('cat') == 5){
		$('body').css({
			"background-color": "#c6ffb3"
		});
		$('.youtube_video').css({
			"padding": "10px",
			"background-color" : "#80FF00",
			"width": "67.5%",
			"margin": "auto"
		});
	}
});