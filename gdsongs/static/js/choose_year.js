"use strict";

function selectYear() {
	var year = $(this).html();
	// ajax the year and get the shows
	var url = '/shows/year/' + year + '/';
	$.ajax(url,
		   {'type':'GET',
		    'success':yearOK,
		    'error':yearFail});
};

function getDataRow(data, index) {
	var row = '<div class="year-block">';
	for(var i=0; i<5; i++) {
		row += '<div class="col"><a href="/edit_show/' + data[index][1] + '">' + data[index][0] + '</a></div>';
		index += 1;
		if(index == data.length) {
			// finish early
			break;
		}
	}
	row += '</div>';
	return(row);
};

function yearOK(data) {
	// data is a list of [date, id] items
	// we need to sort that data into 5 columns, so how many rows?
	if(data.length == 0) {
		var block = '<h3>No shows found</h3>';
	}
	else {
		var rows = Math.floor(data.length / 5);
		var index = 0;
		var block = '<h3>Found ' + data.length.toString() + ' shows - click one to edit</h3>';
		for(var i=0; i<rows; i++) {
			// insert a year block and get a reference to it
			block += getDataRow(data, index);
			index += 5;
		}
		// if <5 items, we get here; if >5 items, maybe some left
		// arrange those
		if(data.length < 5) {
			// some left
			block += getDataRow(data, 0);
		}
		else if((data.length % 5) != 0) {
			// some left
			block += getDataRow(data, index);
		}
	}
	// delete all contents of the show display, add in the new data and display
	$('#list-shows').empty();
	$('#list-shows').append(block);
	$('#list-shows').show();
};

function yearFail() {
	console.log('Error: could not get year data from ajax call at /shows/year/');
};

$(document).ready(function() {
	$('.col').click(selectYear);
});
