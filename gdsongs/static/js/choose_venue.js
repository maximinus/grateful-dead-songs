"use strict";

function getOption(text, value) {
	value = value || text;
	return('<option value="' + value + '">' + text + '</option>');
}

function checkcoordsError(number) {
	// returns false if sent the empty string as well, since that is valid (it is null)
	if(number == '') {
		return(false); }
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

function clearAllErrors() {
	// remove errors in the modal form
	$('#modal-country-error').html('');
	$('#modal-country-div').removeClass('has-error')
	$('#modal-state-error').html('');
	$('#modal-state-div').removeClass('has-error')
	$('#modal-city-error').html('');
	$('#modal-city-div').removeClass('has-error');
	$('#modal-venue-error').html('');
	$('#modal-venue-div').removeClass('has-error')
	$('#modal-longitude-error').html('');
	$('#modal-long-div').removeClass('has-error');
	$('#modal-latitude-error').html('');
	$('#modal-lat-div').removeClass('has-error');
}

function submitVenue() {
	// get the information and send it to the system
	clearAllErrors();
	var country = $('#modalCountry-select').val();
	var state = $('#modalState-select').val();
	var city = $('#modalCity-select').val();
	var venue = $('#modalVenue-select').val();
	var longitude = $('#longitude-select').val();
	var latitude = $('#latitude-select').val();
	// we can do some cusomt checks before we send. They are:
	// city must be filled in
	// venure must be filled in
	// longitude and latitide must be XXX.XXXXX all digits or empty
	var error = false;
	if(city == '') {
		error = true;
		$('#modal-city-error').html('You must enter a city name');
		$('#modal-city-div').addClass('has-error')
	}
	if(venue == '') {
		error = true;
		$('#modal-venue-error').html('You must enter a venue name');
		$('#modal-venue-div').addClass('has-error');
	}
	if(checkcoordsError(longitude)) {
		error = true;
		$('#modal-long-error').html('Format must be of type xxx.xxxx');
		$('#modal-long-div').addClass('has-error');
	}
	if(checkcoordsError(longitude)) {
		error = true;
		$('#modal-lat-error').html('Format must be of type xxx.xxxx');
		$('#modal-lat-div').addClass('has-error');
	}
	// another error is one co-ord empty and the other not
	if((longitude == '') && (latitude != '')) {
		error = true;
		$('#modal-long-error').html("Longitude can't be empty if latitude isn't");
		$('#modal-long-div').addClass('has-error');
	}
	if((longitude != '') && (latitude == '')) {
		error = true;
		$('#modal-lat-error').html("Latitude can't be empty if longitude isn't");
		$('#modal-lat-div').addClass('has-error');
	}	
	if(error == true) {
		return; }
	// now we can do the real post
	var data = {'country':country,
				'state':state,
				'city':city,
				'venue':venue,
				'longitude':longitude,
				'latitude':latitude,
				'csrfmiddlewaretoken':CSRF};				
	$.ajax('../venues/add_new_venue/',
		   {'data':data,
		    'type':'POST',
		    'success':venueAddedOk,
		    'error':venueAddedFail});
};

function venueAddedOk(data) {
	// close the modal and apply the data we got to the venue select area
	// the values we get on callback are:
	// country - country name
	// state - state name (or N/A)
	// cities - new city options
	// city_index - the option to highlight
	// venues / venue_index: as above
	// clear the cities and venues options
	$('#city-select').find('option').remove().end();
	$('#venue-select').find('option').remove().end();
	// add back the given options
	for(var i in data.cities) {
		$('#city-select').append(getOption(data.cities[i])); }
	for(var i in data.venues) {
		$('#venue-select').append(getOption(data.venues[i])); }
	// make the given option the current one
	$('#city-select').val(data.city_index);
	$('#venue-select').val(data.venue_index);
	$('#country-select').val(data.country);
	if(data.country == 'USA') {
		// show the state and select the right one
		$('#state-select').show();
		$('#state-select').val(data.state);
	}
	else {
		// hide the state
		$('#state-select').hide();
	}
	// close the modal
	$('#venue-dialog').modal('hide');
};

function venueAddedFail(data) {
	// go through the possible errors and apply them
	if(data.hasOwnProperty('country')) {
		$('#modal-country-error').html(data['country']);
		$('#modal-country-div').addClass('error')
	}
	if(data.hasOwnProperty('state')) {
		$('#modal-state-error').html(data['state']);
		$('#modal-state-div').addClass('error')
	}
	if(data.hasOwnProperty('longitude')) {
		$('#modal-longitude-error').html(data['longitude']);
		$('#modal-long-div').addClass('error')
	}
	if(data.hasOwnProperty('latitude')) {
		$('#modal-latitude-error').html(data['latitude']);
		$('#modal-lat-div').addClass('error')
	}
};

function changeCityOptions(data) {
	// clear all current cities
	$('#city-select').show();
	$('#city-select').find('option').remove().end();
	for(var i in data.cities) {
		$('#city-select').append(getOption(data.cities[i]));
	}
	// update venue here as well
	updateCity(data.cities[0]);
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
	$.ajax('/venues/get_country_cities/',
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
	$.ajax('/venues/get_cities/',
		   {'data':data,
		    'type':'POST',
		    'success':changeCityOptions,
		    'error':cityOptionsFail});
};

function updateCity(city) {
	var data = {'city':city, 'csrfmiddlewaretoken':CSRF};
	$.ajax('/venues/get_venues/',
		  {'data':data,
		   'type':'POST',
		   'success':changeVenueOptions,
		   'error':venueOptionsFail});
};

function cityChanged(new_city) {
	updateCity($('#city-select').val());
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
