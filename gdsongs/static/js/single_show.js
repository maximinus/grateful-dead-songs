"use strict";

$(document).ready(function() {
	if (typeof SHOW_DATA == 'undefined') {
		// we couldn't load the data
		console.log('Data import error');
		return;
	}
	// show data exists
	// get the template html, compile it, add out context, put into DOM
	var template_data = $("#show-template").html();
	var show_template = Handlebars.compile(template_data);
	var compiled_html = show_template(SHOW_DATA);
	$('#show-display').html(compiled_html);
});
