"use strict";

var SHOWS_TEMPLATE;

// dialog closure for the dialogs
var modal = function() {
	var methods = {};
	var dialog_template = Handlebars.compile($('#dialog-template').html());
	var node = null;

	methods.center = function() {
		var top = Math.max($(window).height() - $('#dialog').outerHeight(), 0) / 2;
		var left = Math.max($(window).width() - $('#dialog').outerWidth(), 0) / 2;
    	$('#dialog').css({
        	top: top + $(window).scrollTop(), 
        	left: left + $(window).scrollLeft()
		});
	};

	methods.open = function(data, element) {
		node = element;
		// generate the html and add to the page
		$('body').append(dialog_template(data));
		methods.center();
		// add the callbacks
		$('#dialog-edit').click(methods.edit);
		$('#dialog-delete').click(methods.delete);
		$('#dialog-close').click(methods.close);
		// show everything
		$('#dialog').show();
		$('#overlay').show();
	};

	methods.edit = function() {
		// node should be a link. Go there
		if(node == null) {
			console.log('Error: node is null in methods.edit');
			return;
		}
		// node is a link. Go there
		window.location.href = $(node).attr('href');
	};

	methods.delete = function() {
		// node is a link with a href of "/shows/edit/{{id}}/". Get the id
		if(node == null) {
			console.log('Error: no node set in methods.delete');
			methods.close();
			return;
		}
		var link = $(node).attr('href').split('/');
		var id = link[link.length - 2];
		// ajax this to the server and wait
		var url = '/shows/year/delete/' + id + '/';
		$.ajax(url,
		   {'type':'GET',
		    'success':yearOK,
		    'error':yearFail});
		methods.close();
	};

	methods.close = function() {
		$('#dialog').remove();
		$('#overlay').remove();
	};

	return(methods);
}();

function selectYear() {
	var year = $(this).html();
	// ajax the year and get the shows
	var url = '/shows/year/' + year + '/';
	$.ajax(url,
		   {'type':'GET',
		    'success':yearOK,
		    'error':yearFail});
};

function confirmAction(event) {
	event.preventDefault();
	var node = event.currentTarget;
	// get the data to ask
	modal.open({'title':$(node).text()}, node);
};

function yearOK(data) {
	// data is a list of [date, id] items
	// we need to sort that data into 5 columns, so how many rows?
	if(data.total != 0) {
		data.title = 'Found ' + data.total.toString() + ' shows - click one to edit'; }
	else {
		data.title = 'No shows found'; }
	$('#list-shows').html(SHOWS_TEMPLATE(data));
	$('.show').click(confirmAction);
};

function yearFail() {
	console.log('Error: could not get year data from ajax call at /shows/year/');
};

$(document).ready(function() {
	var template_data = $('#shows-in-year').html();
	SHOWS_TEMPLATE = Handlebars.compile(template_data);
	$('.col').click(selectYear);
});
