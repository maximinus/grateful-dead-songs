"use strict";

var cities_in_states = {};

var cities_in_countries = {};

function getOption(option) {
	return('<option value"' + option + '">' + option + '</option>');
}

function changeCityOptions(data) {

	console.log(data);
	console.log(data['cities']);

	// clear all current cities
	$('#city-select').find('option').remove().end();
	for(var i in data.cities) {
	
		console.log(data.cities[i]);
	
		$('#city-select').append(getOption(data.cities[i]));
	}
};

function cityOptionsFail() {
	console.log('Ajax Error');
};

function updateCitesFromCountry(country) {
	// change cities depending on country
	var data = {'country':country, 'csrfmiddlewaretoken': CSRF};
	$.ajax('../venues/get_country_cities/',
		   {'data':data,
		    'type':'POST',
		    'success':changeCityOptions,
		    'error':cityOptionsFail});
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
		updateCitesFromCountry(new_value);
	}
};

function stateChanged() {
	// call the DB to get all cites in this state
};

function addDropdowns() {
	for(var i=0; i<STATES.length; i++) {
		$('#state-select').append(getOption(STATES[i]));
	};
	$('#country-select').val('USA');
};

function addCallbacks() {
	$('#country-select').change(countryChanged);
	$('#state-select').change(stateChanged);
};

$(document).ready(function() {
	addDropdowns();
	addCallbacks();
});

