// make a graph with the chart.js library

window.addEventListener('load', eventWindowLoaded, false);

function eventWindowLoaded() {
	generateYears();
	generatePopularity();
	generateTables();
};

function generateYears() {
	var ctx = document.getElementById('years').getContext('2d');

	// generate the years
	start = 65;
	titles = []
	for(var i = 0; i < song['years'].length; i++) {
		if(((start + i) % 5) == 0) {
			titles.push((start + i).toString()); }
		else {
			titles.push(''); }
	};
	var data = {labels : titles,
				datasets: [{ fillColor : 'rgba(110,0,110,0.5)',
							strokeColor : 'rgba(220,220,220,1)',
							pointColor : 'rgba(0,0,220,1)',
							pointStrokeColor : '#fff',
							data : song['years'] }]};
	var options = {};
	var myNewChart = new Chart(ctx).Line(data, options);
};

function generatePopularity() {
	var ctx = document.getElementById('popularity').getContext('2d');

	// generate the years
	start = 65;
	titles = []
	for(var i = 0; i < song['years'].length; i++) {
		if(((start + i) % 5) == 0) {
			titles.push((start + i).toString()); }
		else {
			titles.push(''); }
	};
	var data = {labels : titles,
				datasets: [{ fillColor : 'rgba(110,0,110,0.5)',
							strokeColor : 'rgba(220,220,220,1)',
							pointColor : 'rgba(0,0,220,1)',
							pointStrokeColor : '#fff',
							data : song['popular_years'] }]};
	var options = {};
	var myNewChart = new Chart(ctx).Line(data, options);
};

function generateTables() {
	buildFiveInto();
	buildFiveOut();
};

function buildFiveInto() {
	table = document.getElementById('five_into');
	// add a row for each element in the list
	for(var i=0; i<song.top_five_into.length; i++) {
		var row = table.insertRow();
		// insert both new cells
		var cell_song = row.insertCell(0);
		var cell_number =  row.insertCell(1);
		cell_song.innerHTML = song['top_five_into'][i].name;
		cell_number.innerHTML = song['top_five_into'][i].number;
	}
};

function buildFiveOut() {
	table = document.getElementById('five_out');
	// add a row for each element in the list
	for(var i=0; i<song.top_five_out.length; i++) {
		var row = table.insertRow();
		// insert both new cells
		var cell_song = row.insertCell(0);
		var cell_number =  row.insertCell(1);
		cell_song.innerHTML = song['top_five_out'][i].name;
		cell_number.innerHTML = song['top_five_out'][i].number;
	}
};

function buildFirstFive() {
	table = document.getElementByID('first_five');
	for(var i=0; i<song.first_five.length; i++) {
		var row = table.insertRow();
		var cell_details = row.insertCell(0);
		cell_details.innerHTML = song['first_five'][i];
};

function buildLastFive() {
	table = document.getElementByID('last_five');
	for(var i=0; i<song.last_five.length; i++) {
		var row = table.insertRow();
		var cell_details = row.insertCell(0);
		cell_details.innerHTML = song['last_five'][i];
};

