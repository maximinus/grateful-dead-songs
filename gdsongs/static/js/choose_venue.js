"use strict";

function getOption(text, value) {
	value = value || text;
	return('<option value"' + value + '">' + text + '</option>');
}

function checkcoordsError(number) {
	// return true if there is an error
	var strings = number.split('.');
	// must be 2
	if(strings.length !== 2) {
		return(true); }
	// both be non-empty
	if((strings[0] == '') || (strings[1] == '')) {
		return(true);
	}
	// and must be all digits on both sides
	if(/^\d+$/.test(strings[0]) && (/^\d+$/.test(strings[1]))) {
		// passed all tests
		return(false);
	}
	return(true);
};

function submitVenue() {
	// get the information and send it to the system
	var country = $('#modelCountry-select').val();
	var state = $('#modelState-select').val();
	var city = $('#modelCity-select').val();
	var venue = $('#modelVenue-select').val();
	var longitude = $('#longitude-select').val();
	var latitude = $('#latitude-select').val();
	// we can do some cusomt checks before we send. They are:
	// city must be filled in
	// venure must be filled in
	// longitude and latitide must be XXX.XXXXX all digits or empty
	var error = false
	if(city == '') {
		error = true;
		$('#modal-city-error').html('You must enter a city name');
		$('#modal-city-div').addClass('error')
	}
	else {
		$('#modal-city-error').html('');
		$('#modal-city-div').removeClass('error')
	}
	if(venue == '') {
		error = true;
		$('#modal-venue-error').html('You must enter a venue name');
		$('#modal-venue-div').addClass('error');
	}
	else {
		$('#modal-venue-error').html('');
		$('#modal-venue-div').removeClass('error')
	}
	if(checkcoordsError(longitude)) {
		error = true;
		$('#modal-longitude-error').html('Format must be of type xxx.xxxx');
		$('#modal-long-div').addClass('error');
	}
	else {
		$('#modal-longitude-error').html('');
		$('#modal-long-div').removeClass('error');
	}
	if(checkcoordsError(longitude)) {
		error = true;
		$('#modal-latitude-error').html('Format must be of type xxx.xxxx');
		$('#modal-lat-div').addClass('error');
	}
	else {
		$('#modal-latitude-error').html('');
		$('#modal-lat-div').removeClass('error');
	}
	if(error == true) {
		return; }
	// now we can do the real post
	var data = {'country':country,
				'state':state,
				'city':city,
				'venue':venue,
				'longitude':longitude
				'latitide':latitude
				'csrfmiddlewaretoken':CSRF};
	$.ajax('../venues/add_new_venue/',
		   {'data':data,
		    'type':'POST',
		    'success':venueAddedOk,
		    'error':venueAddedFail});
};

function venueAddedOk(data) {
	// close the modal and apply the data we got to the venue select area
	console.log(data);
};

function venueAddedFail(data) {
	// show the errors
	console.log(data);
};

function changeCityOptions(data) {
	// clear all current cities
	$('#city-select').show();
	$('#city-select').find('option').remove().end();
	for(var i in data.cities) {
		$('#city-select').append(getOption(data.cities[i]));
	}
	// update venue here as well
	cityChanged(data.cities[0]);
};

function cityOptionsFail() {
	console.log('Ajax Error on city options');
};

function changeVenueOptions(data) {
	// clear all current venues
	$('#venue-select').find('option').remove().end();
	for(var i in data.venues) {
		$('#venue-select').append(getOption(data.venues[i][0], data.venues[i][1]));
	}
	$('#venue-select').show();
};

function venueOptionsFail() {
	console.log('Ajax Error on venue options');
};

function updateCitesFromCountry(country) {
	// change cities depending on country
	var data = {'country':country, 'csrfmiddlewaretoken':CSRF};
	$.ajax('../venues/get_country_cities/',
		   {'data':data,
		    'type':'POST',
		    'success':changeCityOptions,
		    'error':cityOptionsFail});
};

function countryChanged() {
	// it's either TO the USA, in which case we turn on the state,
	// or it's NOT the USA, in which case we turn ON the state.
	$('#venue-select').hide();
	var new_value = $('#country-select').val();
	if(new_value == 'USA') {
		$('#state-select').show();
		addDropdowns();
	}
	else {
		$('#state-select').hide();
		updateCitesFromCountry(new_value);
	}
	$('#city-select').show();
};

function modalCountryChanged() {
	// similar logic to function countryChanged
	var country = $('#modalCountry-select').val();
	if(country == 'USA') {
		$('#modalState-select').show();
	}
	else {
		$('modalState-select').hide();
	}
};

function stateChanged() {
	var state = $('#state-select').val();
	// call the DB to get all cites in this state
	var data = {'state':state, 'csrfmiddlewaretoken':CSRF};
	$.ajax('../venues/get_cities/',
		   {'data':data,
		    'type':'POST',
		    'success':changeCityOptions,
		    'error':cityOptionsFail});
};

function cityChanged(new_city) {
	var city = new_city || $('#city-select').val();
	var data = {'city':city, 'csrfmiddlewaretoken':CSRF};
	$.ajax('../venues/get_venues/',
		  {'data':data,
		   'type':'POST',
		   'success':changeVenueOptions,
		   'error':venueOptionsFail});
};

function showVenueDialog() {
	$('#venue-dialog').modal('show');
};

function hideInitial() {
	$('#city-select').hide();
	$('#venue-select').hide();
	$('#state-select').prop('disabled', false);
};

function addDropdowns() {
	$('#state-select').find('option').remove().end();
	for(var i=0; i<STATES.length; i++) {
		$('#state-select').append(getOption(STATES[i]));
	};
	$('#country-select').val('USA');
	stateChanged();
};

function addModalDropdowns() {
	$('#modalState-select').find('option').remove().end();
	for(var i=0; i<STATES.length; i++) {
		$('#modalState-select').append(getOption(STATES[i]));
	}
	$('#modalCountry-select').val('USA');
};

function addCallbacks() {
	$('#country-select').change(countryChanged);
	$('#state-select').change(stateChanged);
	$('#city-select').change(cityChanged);
	$('#add-venue').click(showVenueDialog);
	// connections for the modal box, which is a lot simpler
	$('#modalCountry-select').change(modalCountryChanged);
	$('#submit-venue').click(submitVenue);
};

$(document).ready(function() {
	hideInitial();
	addDropdowns();
	addModalDropdowns();
	addCallbacks();
});

