"use strict";

function resizeWindow() {
	var size = $('#navbar').outerHeight(true) + $('#vertical-center').outerHeight(true);
	var offset = Math.floor((($(window).height() - size)/2) * 0.85);
	if(offset > 0) {
		$('#vertical-center').css('margin-top', offset);
	}
};

function matchText(search) {
	results = [];
	search = search.toLowerCase();
	// run through songs
	for(var song of SONGS) {
		var lower = song[0].toLowerCase();
		// look for substring
		if(lower.indexOf(search) != -1) {
			// found a match
			results.push(song);
		}
	}
	return(results);
};

function clearResults() {
	$('#results-list').empty();
	$('#vertical-center').css('margin-top', 0);
	$('#results').show();
};

function clearSearchResults() {
	clearResults();
	// add the message "No results found"
	$('#results-message').html('No matches found');
};

function displaySearchResults(matches) {
	clearResults();
	var total = matches.length;
	if(total == 1) {
		$('#results-message').html('1 match found:');
	}
	else {
		$('#results-message').html(total.toString() + ' matches found');	
	}
	// now add the results
	for(var match of matches) {
		var element = '<p><a href="/songs/' + match[1] + '/">' + match[0] + '</a></p>';
		$('#results-list').append(element);
	}
};

function checkInput(event) {
	if(event.which === 13) {
        //Disable textbox to prevent multiple submit
		$(this).attr('disabled', 'disabled');
		// any matches?
		var results = matchText($('#search-box').val());
		if(results.length == 0) {
			clearSearchResults(); }
		else {
			displaySearchResults(results);
		}
	}
	 $(this).removeAttr('disabled');
};

$(document).ready(function() {
	resizeWindow();
	$(window).resize(resizeWindow);
	$('#search-box').on('keypress', checkInput);
	$('#search-box').removeAttr('disabled');
});
