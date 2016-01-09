"use strict";

function showSetList(e) {
	// show the setlist and swap the button display
	$(e.currentTarget).parent().children('.show-button').hide();
	$(e.currentTarget).parent().children('.hide-button').show();
	$(e.currentTarget).parent().children('.setlist').show();
};

function hideSetList(e) {	
	$(e.currentTarget).parent().children('.hide-button').hide();
	$(e.currentTarget).parent().children('.setlist').hide();
	$(e.currentTarget).parent().children('.show-button').show();
};

$(document).ready(function() {
	$('.show-button').click(showSetList);
	$('.hide-button').click(hideSetList);
});
