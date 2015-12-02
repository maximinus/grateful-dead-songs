"use strict";

function checkDigitString() {
	// given a string 'XXX' ensure all digits and return the integer result
	
};

function checkLength(text) {
	// we expect a string of these formats, given d=some digit
	// d or dd or d:dd or dd:dd
	// split by ':' first
	// if empty string, return as 0
	if(text == '') {
		return(0) }
	var times = text.split(':');
	if(times.length == 1) {
		var minutes = 0;
		var seconds = parseInt(times[0]);
	}
	else if(time.length == 2) {
		var minutes = parseInt(time[0])
		if((isNaN(minutes) == true) || (minutes < 0)) {
			return(-1); }
		var seconds = parseInt(times[1])
	}
	else {
		// some error
		return(-1) 
	}
	if((isNaN(seconds) == true) || (seconds > 59) || (seconds < 0)) {
		return(-1)
	}
	// finally, return the real value
	return((minutes * 60) + seconds);
};

function getRowData(row) {
	// we have a <tr> instance
	// the first 4 instances of <td> are, in order:
	// the song, seque, length, comments
	var cells = $(row).children();
	// each cell has a child, we need to get that, and then the value of the input
	// songs can never be wrong, they are just taken from the db
	var song = $(cells[0]).children()[0].value;
	// a seque can also never be wrong
	var seque = $(cells[1]).children()[0].value;
	// timings can be wrong
	var len = $(cells[2]).children()[0].value;
	seconds = checkLength(len);
	if(seconds == -1) {
		// highlight the error and then exit immediatly
		return(null)
	}
	else {
		// no error, so remove error
	}
	var comment = $(cells[3]).children()[0].value;
	return([song, seque, len, comment]);
};

function verifyData() {
	// so we have to check that things are ok
	// firstly, we have to look through all the tabs
	var tabs = ['#set-one', '#set-two', '#set-three', '#set-four']
	var sets = [];
	for(var i in tabs) {
		var rows = $(tabs[i]).find('.data-row');
		var rdata = [];
		for(var j=0; j<rows.length; j++) {
			rdata.push(getRowData(rows[j]))
		}
		sets.push(rdata);
	}
};

function extractData() {
	verifyData();
};

// functions below to handle the fron end

function getRow() {
	var html = '<tr class="data-row"><td><input list="songs" /></td>'
	html += '<td><input type="checkbox" value="seque" /></td>'
	html += '<td><input type="text" /></td>'
	html += '<td><input type="text" /></td>'
	html += '<td><button type="button" class="btn btn-default add-row-button" aria-label="Left Align"  data-toggle="tooltip" title="Add row">'
	html += '<span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></td></button>'
	html += '<td><button type="button" class="btn btn-default move-up-button" aria-label="Left Align" data-toggle="tooltip" title="Move up">'
	html += '<span class="glyphicon glyphicon-arrow-up" aria-hidden="true"></span></td></button>'
	html += '<td><button type="button" class="btn btn-default move-down-button" aria-label="Left Align" data-toggle="tooltip" title="Move down">'
	html += '<span class="glyphicon glyphicon-arrow-down" aria-hidden="true"></span></td></button>'
	html += '<td><button type="button" class="btn btn-default delete-button" aria-label="Left Align" data-toggle="tooltip" title="Delete song">'
	html += '<span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span></td></button></tr>'
	return(html);
};

function addSongs() {
	for(var i=0; i<SONGS.length; i++) {
		$('#songs').append('<option value="' + SONGS[i] + '">');
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
};

function copyTableToTabs() {
	// take the exisiting table and add it to the other tabs
	$('#set-table').clone(false).appendTo('#set-two');
	$('#set-table').clone(false).appendTo('#set-three');
	$('#set-table').clone(false).appendTo('#set-four');
};

function clearAllData() {
};

$(document).ready(function() {
	addSongs();
	copyTableToTabs();
	addCallbacks();
	$('#post-data').click(extractData);
});

