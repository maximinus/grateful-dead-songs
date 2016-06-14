'use strict'

function updateIndexOrder(event, ui) {
	// we are not interested in the callback methods
	// we just scan through every set and re-order internally if needed
	// also, we need to update the numbers
	$('.sortable').each(function(i) { 
		updateSet(this);
	});
};

function updateSet(set) {
	// scan through the songs
	var songs = $(set).find('li').each(function(i) {
		$(this).find('.song-index').html((i + 1).toString());
	});
};

// add helper for songs index counting
Handlebars.registerHelper('counter', function (index){
    return(index + 1);
});

$(document).ready(function() {
	// get the template html, compile it, add out context, put into DOM
	var template_data = $('#show-display').html();
	var show_template = Handlebars.compile(template_data);
	var compiled_html = show_template(SHOW_DATA);
	$('#show-show').html(compiled_html);
	$('.sortable').sortable({update: updateIndexOrder});
});
