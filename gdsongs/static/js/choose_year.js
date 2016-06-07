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

function showResults(block) {
	//$('#results-block').empty();
	$('#results-block').append(block);
};

function yearOK(data) {
	// we have the date
	console.log(data);
	ReactDOM.render('ShowsInYear', document.getElementById('results-block'));
	return;
	// data is a list of [date, id] items
	// we need to sort that data into 5 columns, so how many rows?
	if(data.length == 0) {
		block = '<h3 class="results-title">No shows found</h3>'; }
	else {
		// sort into groups of five
		var block = '<div class="results-table">';
		block += '<h3 class="results-title">Found ' + data.length.toString() + ' shows - click one to edit</h3>';
		for(var show of data) {
			block += '<a class="result" href="/edit_show/' + show[1] + '/">' + show[0] + '</a>'; }
		block += '</div>';
	}
	showResults(block);
};

function yearFail() {
	console.log('Error: could not get year data from ajax call at /shows/year/');
};

$(document).ready(function() {
	$('.year').click(selectYear);
});
