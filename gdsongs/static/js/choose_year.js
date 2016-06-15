"use strict";

var SHOWS_TEMPLATE;

function selectYear() {
	var year = $(this).html();
	// ajax the year and get the shows
	var url = '/shows/year/' + year + '/';
	$.ajax(url,
		   {'type':'GET',
		    'success':yearOK,
		    'error':yearFail});
};

function yearOK(data) {
	// data is a list of [date, id] items
	// we need to sort that data into 5 columns, so how many rows?
	if(data.total != 0) {
		data.title = 'Found ' + data.total.toString() + ' shows - click one to edit'; }
	else {
		data.title = 'No shows found'; }
	$('#list-shows').html(SHOWS_TEMPLATE(data));
};

function yearFail() {
	console.log('Error: could not get year data from ajax call at /shows/year/');
};

$(document).ready(function() {
	var template_data = $('#shows-in-year').html();
	SHOWS_TEMPLATE = Handlebars.compile(template_data);
	$('.col').click(selectYear);
});
