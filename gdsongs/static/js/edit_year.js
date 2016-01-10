"use strict";

function showSetList(e) {
	// show the setlist and swap the button display
	var id = $(e.currentTarget).attr('id').split('-');
	id = id[id.length - 1];
	$('#show-button-' + id).hide();
	$('#hide-button-' + id).show();
	$('#setlist-' + id).show();
};

function hideSetList(e) {	
	var id = $(e.currentTarget).attr('id').split('-');
	id = id[id.length - 1];
	$('#hide-button-' + id).hide();
	$('#setlist-' + id).hide();
	$('#show-button-' + id).show();
};

$(document).ready(function() {
	$('.show-button').click(showSetList);
	$('.hide-button').click(hideSetList);
});
