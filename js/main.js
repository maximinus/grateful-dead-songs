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
	// so by this time we should be re-directing, so don;t any more
	return(false);
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
	new_string += '.html';
	// grab the current window location
	var new_location = getCurrentName() + 'songs/' + new_string;
	location.assign(new_location);
};

function getCurrentName() {
	// get the current name of out location
	// if xxx/ -> return xxx/
	// if xxx/yyy.html -> return xxx/
	// if xxx -> return xxx/
	var current = window.location.href;
	// makes it easy to just always drop the '/'
	if(current[current.length - 1] == '/') {
		current.pop(); }
	// end in .html?
	if(current.substr(current.length - 5).toLowerCase() == '.html') {
		var index = current.lastIndexOf('/');
		current = current.substr(0, index);
	}
	return(current + '/');
};

