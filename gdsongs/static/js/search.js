"use strict";

function resizeWindow() {
    var size = $('#navbar').outerHeight(true) + $('#center-content').outerHeight(true) + $('#vertical-fill').outerHeight(true);
	var offset = (($(window).height() / 100) * 45) - size;
	$('#vertical-fill').height(offset);
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
    $('[data-toggle="tooltip"]').tooltip();
    resizeWindow();
    $(window).resize(resizeWindow);
    $('#search-box').on('input', searchChange);
});

