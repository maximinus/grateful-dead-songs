"use strict";

var NUMBERS = ['one', 'two', 'three', 'four', 'five', 'six']

function getDigits(text) {
	if(/^[0-9]+$/.test(text) == true) {
		return(parseInt(text))
	}
	else {
		return(-1);
	}
};

function checkLength(text) {
	// we expect a string of these formats, given d=some digit
	// d or dd or d:dd or dd:dd
	// if empty string, return as 0
	if(text == '') {
		return(-1) }
	var times = text.split(':');
	if(times.length == 1) {
		var minutes = 0;
		var seconds = getDigits(times[0]); }
	else if(times.length == 2) {
		var minutes = getDigits(times[0]);
		if((minutes < 0) || (minutes > 60)) {
			return(-1); }
		var seconds = getDigits(times[1]);
	}
	else {
		return(-1) }
	if((seconds > 59) || (seconds < 0)) {
		return(-1)
	}
	// finally, return the real value
	return((minutes * 60) + seconds);
};

function getSongID(text) {
	for(var i in SONGS) {
		if(SONGS[i][0] == text) {
			return(SONGS[i][1]); }
	}	
	console.log('Song "' + text + '"does not exist');
	return(null);
};

function getRowData(row) {
	// we have a <tr> instance
	// find all the instances of an input in this
	var song = $(row).find('.song-val')[0].value;
	// turn the song into it's id if we have a string
	if(song != '') {
		song = getSongID(song); }
	if(song == null) {
		$(row).find('.song-val').parent().addClass('has-error');
		return(null); }
	else {
		$(row).find('.song-val').parent().removeClass('has-error');
	}
	var seque_input = $(row).find('.seque-val')[0];
	var seque = $(seque_input).prop('checked')
	var len = $(row).find('.length-val')[0].value;
	var comment = $(row).find('.comment-val')[0].value;
	
	var seconds = checkLength(len);
	if(seconds == -1) {
		// highlight the error and then exit immediatly
		$(row).find('.length-val').parent().addClass('has-error');
		return(null)
	}
	else {
		// no error, so remove error
		$(row).find('.length-val').parent().removeClass('has-error');
	}
	return([song, seque, seconds, comment]);
};

function verifyData() {
	// so we have to check that things are ok
	// firstly, we have to look through all the tabs
	var sets = [];
	for(var i in NUMBERS) {
		var set_id = '#set-' + NUMBERS[i];
		// does the set exist?
		if($(set_id).length == 0) {
			// set does not exist, we are done
			return(sets); }
		var rows = $(set_id).find('.data-row');
		var rdata = [];
		for(var j=0; j<rows.length; j++) {
			var check = getRowData(rows[j]);
			if(check == null) {
				return(null);
			}
			rdata.push(check)
		}
		sets.push(rdata);
	}
	return(sets);
};

function showMessage(text, title) {
	// show message in pop-up modal
	title = title || "Message";
	$('#modal-title').html(title);
	$('#modal-message').html(text);
	$('#message-dialog').modal('show');
};

function postOK(data) {
	showMessage(data.msg, 'Show edits uploaded');
	clearAllData();
};

function postFail(data) {
	if(data.hasOwnProperty('responseJSON'))
		if(data.responseJSON.hasOwnProperty('msg')) {
			showMessage(data.responseJSON.msg, 'Server Error');
		}
		else {
			showMessage('Internal server error', 'Server Error');
		}
	else {
		// severe error on server
		showMessage('Server fault - contact admins!', 'Server Error');
	}
};

function splitDataForAjax(songs, encore) {
	// so here we should have an array of sets, in order
	var sdata = {'sets':JSON.stringify(songs),
				 'encore':JSON.stringify(encore),
				 'csrfmiddlewaretoken': CSRF};
	return(sdata);
};

function verifyEncore() {
	// go through the sets and look for encores
	// we can't have an encore followed by a non-encore
	var sets = [];
	for(var i in NUMBERS) {
		var set_id = '#set-' + NUMBERS[i];
		// does the set exist?
		if($(set_id).length == 0) {
			// set does not exist, we are done
			return(sets); }
		var data = $(set_id).find('.encore-value').val();
		if(data != '') {
			sets.push(true); }
		else {
			sets.push(false); }
	}
	return(sets);
};

function sendData() {
	var songs = verifyData();
	if(songs == null) {
		return; }
	else {
		// clear error
		$('#date-error').removeClass('has-error');
	}
	var encore = verifyEncore();
	var show_data = splitDataForAjax(songs, encore)
	// now AJAX the data the data
	show_data['show_id'] = SHOW_ID;
	console.log(show_data);
	$.ajax('../shows/upload_edited_show/',
		   {'data':show_data,
		    'type':'POST',
		    'success':postOK,
		    'error':postFail});
};

// functions below to handle the front end

function getRow() {
	var html = '<tr class="data-row">';
	html += '<td><div class="form-group"><input list="songs" class="form-control song-val" /></div></td>';
	html += '<td><div class="form-group"><input type="checkbox" class="form-control seque-val" value="seque" /></div></td>';
	html += '<td><div class="form-group"><input type="text" class="form-control length-val" /></div></td>';
	html += '<td><div class="form-group"><input type="text" class="form-control comment-val" /></div></td>';
	html += '<td><button type="button" class="btn btn-default move-up-button" aria-label="Left Align" data-toggle="tooltip" title="Move up">';
	html += '<span class="glyphicon glyphicon-arrow-up" aria-hidden="true"></span></td></button>';
	html += '<td><button type="button" class="btn btn-default move-down-button" aria-label="Left Align" data-toggle="tooltip" title="Move down">';
	html += '<span class="glyphicon glyphicon-arrow-down" aria-hidden="true"></span></td></button>';
	html += '<td><button type="button" class="btn btn-danger delete-button" aria-label="Left Align" data-toggle="tooltip" title="Delete song">';
	html += '<span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span></td></button>';
	html += '<td><button type="button" class="btn btn-primary add-row-button" aria-label="Left Align"  data-toggle="tooltip" title="Add row">';
	html += '<span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></td></button></td></tr>';
	return(html);
};

function addSongs() {
	for(var i=0; i<SONGS.length; i++) {
		$('#songs').append('<option value="' + SONGS[i][0] + '">');
	};
};

function addRow(event) {
	// event.currentTarget is the button
	// the parent is the td, the tr is grandparent
	var parent_row = ($(event.currentTarget).parent().parent());
	var new_row = getRow();
	$(new_row).insertAfter(parent_row);
	// update callbacks
	addCallbacks();
};

function deleteRow(event) {
	// most important: if there are only two rows, delete the last one and add a new empty row to the table
	var trow = $(event.currentTarget).parent().parent();
	var tbody = $(trow).parent();
	var all_rows = $(tbody).find('.data-row');
	if(all_rows.length == 1) {
		// delete row, add new row
		$(all_rows[2]).remove();
		// add the new row as a child of the tbody
		$(tbody).append(getRow());
		addCallbacks();
	}
	// delete the row
	$(trow).remove();
};

function deleteAllRows(element) {
	// delete all rows in the element and then add one empty one
	var rows = $(element).find('.data-row');
	// there is ALWAYS a row, since you can't delete the last one
	// keep a reference to the parent
	var parent = $(rows[0]).parent();
	// delete these rows
	$(rows).each(function(i, e) {
		$(e).remove(); });
	// add the empty row and update callbacks
	$(parent).append(getRow());
	addCallbacks();
};

function moveRowDown(event) {
	var row = $(event.currentTarget).parent().parent();
	$(row).next().after($(row));
};

function moveRowUp(event) {
	var row = $(event.currentTarget).parent().parent();
	$(row).prev().before($(row));
};

function addNewSet() {
	// count current tabs
	var total_tabs = $('.tab-pane').length;
	if(total_tabs >= NUMBERS.length) {
		return; }
	var id_name = 'set-' + NUMBERS[total_tabs];
	var html = '<div class="tab-pane fade in" id="' + id_name + '"></div>';
	var li_html = '<li><a data-toggle="tab" href="#' + id_name + '"';
	li_html += ' id="' + id_name + '-link">Set ' + (total_tabs + 1).toString() + '</a></li>';
	// now insert this html
	$('#new-set-insert').before(li_html);
	$('#set-tab-holder').append(html);
	// clone the data from the previous set
	id_name = '#' + id_name;
	var new_set_table = $('#set-table').clone(false);
	$(new_set_table).appendTo(id_name);
	$(new_set_table).show()
	//appendTo(id_name);
	deleteAllRows(id_name);
	// we need to activate the <a> that we activated earlier
	var link_name = id_name + '-link';
	$(link_name).tab('show');
	return(id_name);
};

function addCallbacks() {
	// remove callbacks first!
	$('.add-row-button').unbind();
	$('.delete-button').unbind();
	$('.move-up-button').unbind();
	$('.move-down-button').unbind();
	$('.add-row-button').click(addRow);
	$('.delete-button').click(deleteRow);
	$('.move-up-button').click(moveRowUp);
	$('.move-down-button').click(moveRowDown);
};

function addStaticCallbacks() {
	// these only exist in one place
	$('#add-set-button').click(addNewSet);
	$('#submit-venue').click(submitVenue);
	$('#post-data').click(sendData);
};

function getSongData() {
	$.ajax('../../data/' + SHOW_ID.toString() + '/',
		  {'data':{'csrfmiddlewaretoken': CSRF},
		   'type':'POST',
		   'success':songDataOK,
		   'error':songDataFail});
};

function songDataOK(data) {
	// display the data and then finish the wiring of the callbacks
	displayData(data);
	addCallbacks();
	addStaticCallbacks();
};

function songDataFail(data) {
	// Any error like this means a fail
	// show the messagebox and advise a refresh
	showMessage('Could not load song: please refresh page', 'Server Error');
};

function displayData(data) {
	// we must have venue, songs, data
	for(var prop of ['venue', 'sets', 'date']) {
		if(data.hasOwnProperty(prop) == false) {
			showMessage('Missing property "' + prop + '" from server.', 'Server Error');
			return;
		}
	}
	// so we have the data, let's do it
	updateTitle(data.date, data.venue);
	addSets(data.sets);
}

function updateTitle(date, venue) {
	$('#title-date').html(date);
	$('#title-venue').html(venue);
};

function addSets(sets) {
	// add the songs in the sets
	for(var i in sets) {
		// add an empty set object
		var set_id = addNewSet();
		// each set is a list of songs
		addSongsToSet(sets[i], set_id);
	}
};

function addSongsToSet(songs, set_id) {
	if(songs.length == 0) {
		return;	}
	// get the row we never fill. We just insert rows before this
	var last_row = $(set_id).find('.data-row');
	for(var i in songs) {
		var new_row = addSingleSong($(getRow()), songs[i]);
		$(last_row).before(new_row);
	}
	// erase the final row
	$(last_row).remove();
};

function addSingleSong(row, song) {
	$(row).find('.song-val').val(getSongTitle(song[0]));
	$(row).find('.seque-val').prop('checked', song[2]);
	$(row).find('.length-val').val(song[1]);
	$(row).find('.comments-val').val(song[3]);
	return(row);
};

function getSongTitle(id) {
	for(var i in SONGS) {
		if(SONGS[i][1] == id) {
			return(SONGS[i][0])
		}
	}
	// some error
	return('Error');
};

$(document).ready(function() {
	addSongs();
	getSongData();
});
