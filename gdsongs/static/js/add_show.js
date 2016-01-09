"use strict";

// global consts and functions for date managment

var MONTH_DAYS = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
var NUMBERS = ['one', 'two', 'three', 'four', 'five', 'six']

function isLeapYear(year) {
	return(((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0));
};

function validateDate(day, month, year) {
	// -1 means "unknown time"
	if((year != -1) && ((year < 1965) || (year > 1995))) {
		return(false);
	}
	if((month != -1) && ((month < 1) || (month > 12))) {
		return(false); }
	if((day != -1) || (month != -1)) {
		// dates are harder
		var days_in_month = MONTH_DAYS[month - 1];
		if((isLeapYear(year) == true) && (month == 2)) {
			days_in_month += 1; }
		if((day < 1) || (day > days_in_month)) {
			return(false);
		}
	}
	return(true);
};

function verifyDate() {
	var text = $('#show-date').val();
	// we split the date up by '/'
	var dates = text.split('/');
	if(dates.length != 3) {
		return(null);
	}
	// either each one is XX or xx, or is all digits
	for(var i in dates) {
		if(((dates[i] != 'xx') && (dates[i] != 'XX')) && (getDigits(dates[i]) == -1)) {
			return(null);
		}
	}
	if(dates[2].length == 2) {
		dates[2] = '19' + dates[2];
	}
	var final_dates = [];
	for(i in dates) {
		if((dates[i] == 'xx') || (dates[i] == 'XX')) {
			final_dates.push(-1); }
		else {
			final_dates.push(dates[i]);
		}
	}
	// check in range
	if(validateDate(final_dates[1], final_dates[0], final_dates[2]) == false) {
		return(null); }
	return(final_dates);
};

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
	showMessage(data.msg, 'Show added');
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

function splitDataForAjax(songs, date, encore) {
	// so here we should have an array of sets, in order
	var sdata = {'sets':JSON.stringify(songs),
				 'day':date[1],
				 'month':date[0],
				 'year':date[2],
				 'venue':$('#venue-select').val(),
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
	var date = verifyDate();
	if(date == null) {
		// display error
		$('#date-error').addClass('has-error');
		return;
	}
	else {
		// clear error
		$('#date-error').removeClass('has-error');
	}
	var encore = verifyEncore();
	var show_data = splitDataForAjax(songs, date, encore)
	// now AJAX the data the data
	$.ajax('../shows/upload_show/',
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
	// for the modal
	$('#country-select').change(countryChanged);
	$('#state-select').change(stateChanged);
	$('#city-select').change(cityChanged);
	$('#add-venue').click(showVenueDialog);
	// connections for the modal box, which is a lot simpler
	$('#modalCountry-select').change(modalCountryChanged);
	$('#submit-venue').click(submitVenue);
};

function copyTableToTabs() {
	// take the exisiting table and add it to the other tabs
	$('#set-table').clone(false).appendTo('#set-two');
	$('#set-table').clone(false).appendTo('#set-three');
	$('#set-table').clone(false).appendTo('#set-four');
};


function clearAllData() {
	$('input').val('');
	$('input:checkbox').removeAttr('checked');
	// remove all sets
	$('#set-tab-holder').empty();
	// clear all set tabs as well
	for(var i in NUMBERS) {
		var id_name = '#set-' + NUMBERS[i] + '-link';
		if($(id_name).length > 0) {
			$(id_name).parent().remove();
		}
	}
};

$(document).ready(function() {
	hideInitial();
	addDropdowns();
	addModalDropdowns();
	addSongs();
	clearAllData();
	copyTableToTabs();
	addCallbacks();
	addStaticCallbacks()
	$('#post-data').click(sendData);;
});
