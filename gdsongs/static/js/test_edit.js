'use strict'

// dialog closure for the dialogs
var modal = function() {
	var method = {};

	var template_data = $('#dialog-template').html();
	var dialog_template = Handlebars.compile(template_data);

	method.center = function() {
		var top = Math.max($(window).height() - $('#dialog').outerHeight(), 0) / 2;
		var left = Math.max($(window).width() - $('#dialog').outerWidth(), 0) / 2;
    	$('#dialog').css({
        	top: top + $(window).scrollTop(), 
        	left: left + $(window).scrollLeft()
		});
	};

	method.open = function(title) {
		// generate the html and add to the page
		$('body').append(dialog_template({'title':title}));
		method.center();
		// add the callbacks
		$('#dialog-close').click(function() {
			$('#dialog').remove();
			$('#overlay').remove();			
		});
		// show everything
		$('#dialog').show();
		$('#overlay').show();
	};

	return(method);
}();

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

function editSong() {
	modal.open('Edit Song');
};

// add helper for songs index counting
Handlebars.registerHelper('counter', function (index){
    return(index + 1);
});

$(document).ready(function() {
	// prepare the dialog - first build the datalist and add it
	var template_data = $('#datalist-template').html();
	var template = Handlebars.compile(template_data);
	$('body').append(template({'songs':SONGS}));
	// get the template html, compile it, add out context, put into DOM
	template_data = $('#show-display').html();
	var show_template = Handlebars.compile(template_data);
	var compiled_html = show_template(SHOW_DATA);
	$('#show-show').html(compiled_html);
	// setup the drag and drop for songs
	$('.sortable').sortable({update: updateIndexOrder});
	// allow double-clicking ona song
	$('.song').dblclick(editSong);
});
