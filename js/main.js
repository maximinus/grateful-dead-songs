window.addEventListener('load', eventWindowLoaded, false);

function eventWindowLoaded() {
	$('#tags').autocomplete({source: songs});
	// catch the 'enter' as well
	$('#tags').filter(':input').keypress(loadSongPage);
};

function loadSongPage(event) {
	// if enter was NOT pressed, ignore things
	var key = event.keyCode ? event.keyCode : event.which;
	if(key != 13) {
		return(true); }
	// it was, we need to load this page
	getHTMLName($('#tags').filter(':input').val());
};

function getHTMLName(string) {
	// given a string, convert it into a name with the following rules:
	// Convert to lower case
	// strip out everything except [a-z0-9]
	string = string.toLowerCase();
	var new_string = '';
	var regx = new RegExp('^[a-z0-9]$');
	for(var i=0; i<string.length; i++) {
		if(regx.test(string[i])) {
			new_string += string[i]; }
	};
	alert('http://www.gdsongs.info/' + new_string);
};

