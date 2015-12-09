"use strict";

function addDropdowns() {
	for(var i=0; i<COUNTRIES.length; i++) {
		$('#countries').append('<option value="' + COUNTRIES[i] + '">');
	};
	for(var i=0; i<STATES.length; i++) {
		$('#states').append('<option value="' + STATES[i] + '">');
	};
};

function addCallbacks() {
};

$(document).ready(function() {
	addDropdowns();
	addCallbacks();
});

