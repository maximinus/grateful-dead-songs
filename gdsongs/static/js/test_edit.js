'use strict'

// dummy data

var SHOW = {'venue':'Spartan Stadium, San Jose, CA',
			'date':'22nd April 1979',
			'sets':[[["Jack Straw", 420, 0],
					 ["Mama Tried", 420, 0],
					 ["Mexicali Blues", 420, 0],
					 ["Sugaree", 420, 0],
					 ["Looks Like Rain", 420, 0],
					 ["Brown-Eyed Women", 420, 0],
					 ["New Minglewood Blues", 420, 0],
					 ["Stagger Lee", 420, 0],
					 ["Passenger", 420, 0],
					 ["Deal", 420, 0]],
					[["I Need A Miracle", 420, 0],
					 ["Bertha", 420, 0],
					 ["Good Lovin'", 420, 0],
					 ["Scarlet Begonias", 420, 0],
					 ["Fire On The Mountain", 420, 0],
					 ["Estimated Prophet", 420, 0],
					 ["He's Gone", 420, 0],
					 ["Drums", 420, 0],
					 ["The Other One", 420, 0],
					 ["Wharf Rat", 420, 0],
					 ["Around And Around", 420, 0]],
					[["U.S. Blues", 420, 0],
					 ["Shakedown Street", 420, 0]]]};

var TRANSITIONS = [' /', ' >'];

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

function buildSongHTML(name, time, transition) {
	// get a copy of the nodes we need
	var html_string = '<div class="song">';
	html_string += '<div class="song-name">' + name + transition + '</div>';
	html_string += '<div class="song-time">' + time + '</div>';
	html_string += '<div class="song-buttons"></div></div>';
	return($.parseHTML(html_string));
};

function getSongNode(song) {
	// first get the data to display
	var name = song[0];
	var time = getTimeString(song[1]);
	var transition = getTransString(song[2]);
	return(buildSongHTML(name, time, transition));
};

function addSet(set_data, set_index) {
	// make a new set node
	var set_node = $.parseHTML('<div class="set"><p class="set-name">Set ' + set_index + '</p></div>');
	for(var i of set_data) {
		$(set_node).append(getSongNode(i)); 
	}
	$('#show-base').append(set_node);
};

function addShow(sets) {
	var set_count = 1;
	for(var i of SHOW.sets) {
		addSet(i, set_count.toString());
		set_count += 1;
	}
};

$(document).ready(function() {
	$('#show-title').html(getShowTitle());
	addShow();
});
