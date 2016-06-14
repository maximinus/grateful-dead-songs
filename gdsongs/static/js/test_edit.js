'use strict'

var DIALOG_TEMPLATE;

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
	// render first and then show the dialog
	$('#dialog').html(DIALOG_TEMPLATE({'title':'Edit song'}));
	$('#dialog').dialog({
		dialogClass: 'no-close',
		draggable: false,
		modal: true,
		resizeable: false,
		buttons: [
			{text: 'Cancel',
			 click: function() {
			 	$(this).dialog('close'); },
			},
			{text: 'Save',
			 click: function() {
				$(this).dialog('close'); }
			},
		]
	});
};

// add helper for songs index counting
Handlebars.registerHelper('counter', function (index){
    return(index + 1);
});

$(document).ready(function() {
	// prepare the dialog;
	var template_data = $('#dialog-display').html();
	DIALOG_TEMPLATE = Handlebars.compile(template_data);
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
