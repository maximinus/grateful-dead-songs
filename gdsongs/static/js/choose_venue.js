"use strict";

function addDropdowns() {
	for(var i=0; i<STATES.length; i++) {
		var option = '<option value"' + STATES[i] + '">' + STATES[i] + '</option>';
		$('#state-select').append(option);
	};
};

function countryChanged() {
	// it's either TO the USA, in which case we turn on the state,
	// or it's NOT the USA, in which case we turn ON the state.
};

function stateChanged() {
	// call the DB to get all cites in this state
};

function cityChanged() {
	// call the db to get all venues in this city and state
};

function addCallbacks() {
};

$(document).ready(function() {
	addDropdowns();
	addCallbacks();
});

