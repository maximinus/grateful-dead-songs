"use strict";

function resizeWindow() {
	var size = $('#navbar').outerHeight(true) + $('#vertical-center').outerHeight(true) + $('#footer').outerHeight(true);
	var offset = Math.floor(($(window).height() - size)/2);
	if(offset < 1) {
		return; }
	console.log(offset);
	$('#vertical-center').css('margin-top', offset);

    //var size = $('#navbar').outerHeight(true) + $('#center-content').outerHeight(true) + $('#vertical-fill').outerHeight(true);
	//var offset = (($(window).height() / 100) * 45) - size;
	//$('#vertical-fill').height(offset);
};

function searchChange() {
	var text = $('#search-box').val();
	if(text == '') {
		text = 'Enter a search term'; }
	else {
		text = 'Search for: ' + text; }
	$('#search-text').html(text);
};

$(document).ready(function() {
    resizeWindow();
    $(window).resize(resizeWindow);
    $('#search-box').on('input', searchChange);
});
