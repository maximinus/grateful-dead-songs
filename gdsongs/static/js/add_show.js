"use strict";

function extractData() {
};

// functions below to handle the fron end

function getRow() {
	var html = '<tr><td><input list="songs" /></td>'
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
	$('#set-table').clone().appendTo('#set-two');
	$('#set-table').clone().appendTo('#set-three');
	$('#set-table').clone().appendTo('#set-four');
};

$(document).ready(function() {
	addSongs();
	copyTableToTabs();
	addCallbacks();
});

