"use strict";

var cities_in_states = {};

var cities_in_countries = {};

function getOption(option) {
	return('<option value"' + option + '">' + option + '</option>');
}

function changeCityOptions(data) {
	// clear all current cities
	$('#city-select').find('option').remove().end();
	for(var i in data.cities) {
		$('#city-select').append(getOption(data.cities[i]));
	}
};

function cityOptionsFail() {
	console.log('Ajax Error on city options');
};

function changeVenueOptions(data) {
	// clear all current venues
	$('#venue-select').find('option').remove().end();
	for(var i in data.venues) {
		$('#venue-select').append(getOption(data.venues[i]));
	}
};

function venueOptionsFail() {
	console.log('Ajax Error on venue options');
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
	var state = $('#state-select').val();
	// call the DB to get all cites in this state
	var data = {'state':state, 'csrfmiddlewaretoken': CSRF};
	$.ajax('../venues/get_cities/',
		   {'data':data,
		    'type':'POST',
		    'success':changeCityOptions,
		    'error':cityOptionsFail});
};

function cityChanged() {
	var city = $('#city-select').val();
	var data = {'city':city, 'csrfmiddlewaretoken': CSRF};
	$.ajax('../venues/get_venues/',
		  {'data':data,
		   'type':'POST',
		   'success':changeVenueOptions,
		   'error':venueOptionsFail});
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
	$('#city-select').change(cityChanged);
};

$(document).ready(function() {
	addDropdowns();
	addCallbacks();
});

