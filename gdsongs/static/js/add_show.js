"use strict";

// global consts and functions for date managment

var MONTH_DAYS = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

function isLeapYear(year) {
	return(((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0));
};

function validateDate(day, month, year) {
	if((year != -1) && ((year < 1965) || (year > 1995))) {
		return(false);
	}
	if((month != -1) && ((month < 1) || (month > 12))) {
		return(false); }
	if((day != -1) || (month != -1)) {
		// dates are harder
		var days_in_month = MONTH_DAYS[month - 1];
		if(isLeapYear(year) == true) {
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
		return(0) }
	var times = text.split(':');
	if(times.length == 1) {
		var minutes = 0; }
	else if(times.length == 2) {
		var minutes = getDigits(times[0]);
		if(minutes < 0) {
			return(-1); }
	}
	else {
		return(-1) }
	var seconds = getDigits(times[1]);
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
	console.log('Song does not exist');
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
	
	var seque = $(row).find('.seque-val')[0].value;
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
	var tabs = ['#set-one', '#set-two', '#set-three', '#set-four'];
	var sets = [];
	for(var i in tabs) {
		var rows = $(tabs[i]).find('.data-row');
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

function showMessage(text) {
	// show message in pop-up modal
	$('#modal-message').html(text);
	$('#message-dialog').modal('show');
};

function postOK(data) {
	$('#message-title').html('Show added!');
	showMessage(data.msg);
	//clearAllData();
};

function postFail(data) {
	$('#message-title').html('Error');
	showMessage(data.msg);
};

function splitDataForAjax(songs, date, encore) {
	// so here we should have an array of sets, in order
	var sdata = {'set1':JSON.stringify(songs[0]),
				 'set2':JSON.stringify(songs[1]),
				 'set3':JSON.stringify(songs[1]),
				 'set4':JSON.stringify(songs[1]),
				 'day':date[1],
				 'month':date[0],
				 'year':date[2],
				 'encore':JSON.stringify(encore),
				 'csrfmiddlewaretoken': CSRF};
	return(sdata);
};

function verifyEncore() {
	// go through the sets and look for encores
	// we can't have an encore followed by a non-encore
	var tabs = ['#set-one', '#set-two', '#set-three', '#set-four'];
	var sets = [];
	for(var i in tabs) {
		var data = $(tabs[i]).find('.encore-value').val();
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
	var tbody = $(event.currentTarget).parent().parent().parent();
	if($('#set1-table tr').length == 2) {
		// delete last row, add new row
		$('#set1-table tr:last').remove();
		// add the new row as a child of the tbody
		$(tbody).append(getRow());
		addCallbacks();
	}
	// delete the row
	var parent_row = ($(event.currentTarget).parent().parent());
	$(parent_row).remove();
};

function moveRowDown(event) {
	var row = $(event.currentTarget).parent().parent();
	$(row).next().after($(row));
};

function moveRowUp(event) {
	var row = $(event.currentTarget).parent().parent();
	$(row).prev().before($(row));
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
};

$(document).ready(function() {
	hideInitial();
	addDropdowns();
	addModalDropdowns();
	addSongs();
	clearAllData();
	copyTableToTabs();
	addCallbacks();
	$('#post-data').click(sendData);;
});

