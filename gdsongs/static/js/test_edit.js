'use strict'

var SET_NAMES = ['1st Set', '2nd Set', '3rd Set', '4th set', '5th Set', '6th Set'];

var choose_dialog = function() {
	var methods = {};

	var template = Handlebars.compile($('#dialog-confirm').html());

	methods.center = function() {
		var top = Math.max($(window).height() - $('#dialog').outerHeight(), 0) / 2;
		var left = Math.max($(window).width() - $('#dialog').outerWidth(), 0) / 2;
    	$('#dialog').css({
        	top: top + $(window).scrollTop(), 
        	left: left + $(window).scrollLeft()
		});
	};

	methods.open = function(data, ok, cancel) {
		// binding should be done by the calling function
		// when clicked, modal always closes
		$('body').append(template(data));
		methods.center();
		// add the callbacks
		$('#dialog-close').click(function() {
			methods.close();
		});
		$('#dialog-ok').click(function() {
			if(ok != null) {
				ok(); }
			methods.close();
		});
		$('#dialog-delete').click(function() {
			if(cancel != null) {
				cancel(); }
			methods.close();
		});
		// show everything
		$('#dialog').show();
		$('#overlay').show();
	};

	methods.close = function() {
		$('#dialog').remove();
		$('#overlay').remove();
	};

	return(methods);
}();

// dialog closure for the dialogs
var modal = function() {
	var methods = {};

	var dialog_template = Handlebars.compile($('#dialog-template').html());
	var song_template = Handlebars.compile($('#single-song').html());
	// we use these values to force out errors
	var element = null;

	methods.center = function() {
		var top = Math.max($(window).height() - $('#dialog').outerHeight(), 0) / 2;
		var left = Math.max($(window).width() - $('#dialog').outerWidth(), 0) / 2;
    	$('#dialog').css({
        	top: top + $(window).scrollTop(), 
        	left: left + $(window).scrollLeft()
		});
	};

	methods.open = function(data, node) {
		// store data for later
		element = node;
		// generate the html and add to the page
		$('body').append(dialog_template(data));
		methods.center();
		// add the callbacks
		$('#dialog-close').click(function() {
			methods.close();
		});
		$('#dialog-save').click(methods.save);
		$('#dialog-delete').click(methods.delete);
		// show everything
		$('#dialog').show();
		$('#overlay').show();
	};

	methods.save = function() {
		// There's no fancy model, we just need to change the particular element
		if(element != null) {
			// get the first class, grab the text, trim the whitespace and convert to an int
			var index = parseInt($(element).find('.song-index').first().text().trim());
			// grab the data
			var song = {'name':$('#dialog-song-name').val(),
						'length':$('#dialog-song-length').val(),
						// carry over the index number
						'index':index,
						'trans':'/',};
			if($('#dialog-song-seque').is(':checked')) {
				song.trans = '>'; }
			// add new element to row past this element, then delete the old element
			$(song_template(song)).insertAfter(element);
			$(element).remove();
			addSongDoubleClick();
		}
		methods.close();
	};

	methods.delete = function() {
		// delete this node if it exists
		if(element != null) {
			$(element).remove();
		}
		methods.close();
		updateIndexOrder();
	};

	methods.close = function() {
		$('#dialog').remove();
		$('#overlay').remove();
	};

	return(methods);
}();

function updateIndexOrder(event, ui) {
	// we are not interested in the callback methods
	// we just scan through every set and re-order internally if needed
	// also, we need to update the numbers
	$('.sortable').each(function(i) { 
		updateSet(this);
	});
};

function removeSet(set_element) {
	// deleting the set is easy

};

function getSongData(element) {
	// given the element that contains the song row, return the data
	var details = $(element).find('.song-name').first().text();
	var length = $(element).find('.song-timing').first().text();
	// details is a string with both song name and the trans
	// if the last char is a '>' than trans is true
	if(details.slice(-1) == '>') {
		var trans = 'checked'; }
	else {
		var trans = ''; }
	var name = details.substring(0, details.length - 2);
	return({'name':name, 'trans':trans, 'length':length});
};

function updateSet(set) {
	// scan through the songs
	var songs = $(set).find('li').each(function(i) {
		$(this).find('.song-index').html((i + 1).toString());
	});
};

function editSong(event) {
	var data = getSongData(event.currentTarget);
	data.title = 'Edit song';
	modal.open(data, event.currentTarget);
};

function addSong(event) {
	//the current target must be manually created
	// to do this, the fathers fathers first ul
	var song_list = ($(event.currentTarget).parent().parent().find('ul').first());
	var song_template = Handlebars.compile($('#single-song').html());
	var data = {length:'0:01', trans:'/', name:'Drums', 'index':song_list.children().length + 1};
	$(song_list).append(song_template(data));
	$(song_list).children().last()[0];
	data.title = 'Add Song';
	// don't show the cancel button
	data.create = true;
	// set the li to be sortable and clickable
	$('.sortable').sortable({update: updateIndexOrder});
	addSongDoubleClick();
	modal.open(data, $(song_list).children().last()[0]);
};

function addSongDoubleClick() {
	$(document).off('dblclick', ',song').on('dblclick', '.song', editSong);
};

function deleteSet(event) {
	// the event is from the button, so let's move that to the set
	var set = $(event.currentTarget).parent().parent();
	var message = 'Delete this set? Changes to database will not be made until you save.'
	choose_dialog.open({'title':'Delete Set', 'message':message}, function() {
		set.remove();
		// now loop through the sets and rename them
		$('.set-title').each(function(index, element) {
			$(element).html(SET_NAMES[index]);
		});
	}, null);
};

// add helper for songs index counting
Handlebars.registerHelper('counter', function(index){
    return(index + 1);
});

$(document).ready(function() {
	Handlebars.registerPartial('song', $('#song-display').html());
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
	addSongDoubleClick();
	$('.add-song').click(addSong);
	$('.set-delete-button').click(deleteSet);
});
