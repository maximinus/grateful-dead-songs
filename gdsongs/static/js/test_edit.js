'use strict'

// dummy data

var SHOW = {'venue':'Spartan Stadium, San Jose, CA',
			'date':'22nd April 1979',
			'sets':[[["Jack Straw", 348, 0],
					 ["Mama Tried", 321, 0],
					 ["Mexicali Blues", 390, 0],
					 ["Sugaree", 571, 0],
					 ["Looks Like Rain", 417, 0],
					 ["Brown-Eyed Women", 392, 0],
					 ["New Minglewood Blues", 308, 0],
					 ["Stagger Lee", 513, 0],
					 ["Passenger", 359, 1],
					 ["Deal", 582, 0]],
					[["I Need A Miracle", 412, 0],
					 ["Bertha", 483, 1],
					 ["Good Lovin'", 374, 0],
					 ["Scarlet Begonias", 705, 1],
					 ["Fire On The Mountain", 633, 0],
					 ["Estimated Prophet", 648, 1],
					 ["He's Gone", 531, 1],
					 ["Drums", 638, 1],
					 ["The Other One", 844, 1],
					 ["Wharf Rat", 530, 1],
					 ["Around And Around", 304, 0]],
					[["U.S. Blues", 347, 0],
					 ["Shakedown Street", 782, 0]]]};

var TRANSITIONS = ['', ' >'];
var SET_NAMES = ['First', 'Second', 'Third', 'Fourth'];

function updateIndexOrder(event, ui) {
	// we are not interested in the callback methods
	// we just scan through every set and re-order internally if needed
	// also, we need to update the numbers
	$('.sortable').each(function(i) { 
		updateSet(this);
	});
};

function updateSet(set) {
	// scan through the songs
	var songs = $(set).find('li').each(function(i) {
		$(this).find('.song-index').html((i + 1).toString());
	});
};

function getShowTitle() {
	return('Editing ' + SHOW.venue + ', ' + SHOW.date);
};

function getTimeString(time) {
	// time is in seconds. Return in m/s
	if(time < 60) {
		return(time.toString() + 's'); }
	var minutes = Math.floor(time / 60);
	var seconds = time - (minutes * 60);
	return(minutes.toString() + 'm ' + seconds.toString() + 's');
};

function getTransString(transition) {
	if((transition < 0) || (transition >= TRANSITIONS.length)) {
		return('');
	}
	return(TRANSITIONS[transition]);
};

function getSongTitle(name, transition) {
	return(name + getTransString(transition));
};

function buildSongHTML(name, time, index) {
	// get a copy of the nodes we need
	var html_string = '<li class="song ui-state-default">';
	html_string += '<div class="song-index">' + index.toString() + '</div>';
	html_string += '<div class="song-name">' + name + '</div>';
	html_string += '<div class="song-timing">' + time + '</div></li>';
	return(html_string);
};

function getSongNode(song, index) {
	// first get the data to display
	var name = getSongTitle(song[0], song[2]);
	var time = getTimeString(song[1]);
	return(buildSongHTML(name, time, index));
};

function addSet(set_data, set_index) {
	// make a new set node
	var set_title = SET_NAMES[set_index];
	var set_id = '#' + set_title.toLowerCase() + '_set';
	set_title = set_title + ' Set';
	var set_node = '<div class="set"><div class="set-header">' + set_title;
	set_node += '</div><ul class="set-body sortable" id="' + set_id + '">'
	var song_index = 1;
	// add the song strings to the set
	for(var i of set_data) {
		set_node += getSongNode(i, song_index);
		song_index += 1;
	}
	// finish the HTML and then add to the document
	set_node += '</ul></div>';
	$('.instructions').before($.parseHTML(set_node));
};

function addShow(sets) {
	var set_count = 0;
	for(var i of SHOW.sets) {
		addSet(i, set_count.toString());
		set_count += 1;
	}
};

$(document).ready(function() {
	addShow();
	$('.sortable').sortable({update: updateIndexOrder});
});
