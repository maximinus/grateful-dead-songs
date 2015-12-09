"use strict";

var cities_in_states = {};

var cities_in_countries = {};

function changeCityOptions(data) {
	console.log('OK');
};

function cityOptionsFail() {
	console.log('Ajax Error');
};

function updateCitesFromCountry(country) {
	// change cities depending on country
	$.ajax('../venues/get_cities/',
		   {'data':country,
		    'type':'POST',
		    'success':changeCityOptions,
		    'error':cityOptionsFail});
};

function updateCitiesFromState() {
};

function addDropdowns() {
	for(var i=0; i<STATES.length; i++) {
		var option = '<option value"' + STATES[i] + '">' + STATES[i] + '</option>';
		$('#state-select').append(option);
	};
};

function countryChanged() {
	// it's either TO the USA, in which case we turn on the state,
	// or it's NOT the USA, in which case we turn ON the state.
	var new_value = $('#country-select').val();
	if(new_value == 'USA') {
		$('#state-select').prop('disabled', false);
	}
	else {
		$('#state-select').prop('disabled', true);
	}
	updateCites(new_value);
};

function stateChanged() {
	// call the DB to get all cites in this state
};

function addCallbacks() {
	$('#country-select').change(countryChanged);
	$('#state-select').change(stateChanged);
};

$(document).ready(function() {
	addDropdowns();
	addCallbacks();
});

