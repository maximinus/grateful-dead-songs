"use strict";

$(document).ready(function() {
    $('[data-toggle="tooltip"]').tooltip();
    // ensure center
    var size = $('#navbar').outerHeight(true) + $('#center-content').outerHeight(true) + $('#vertical-fill').outerHeight(true);
	var offset = (($(window).height() / 100) * 45) - size;
	$('#vertical-fill').height(offset);
});

