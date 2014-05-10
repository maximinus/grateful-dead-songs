// make a graph with the chart.js library

window.addEventListener('load', eventWindowLoaded, false);

song = {
    "name":"Around And Around",
    "total_played":"403",
    "show_distance":{"short":"1", "long":"125", "average":"4.19106699752"},
    "song_distance":{"short":"11", "long":"1501", "average":"77.7245657568"},
    "years":[0, 0, 0, 0, 0, 1, 1, 15, 30, 23, 1, 19, 24, 42, 26, 29, 31, 18, 16, 16, 16, 12, 18, 6, 5, 15, 13, 6, 9, 5, 6, ],
    "popular_years":[0, 0, 0, 0, 0, 0.126262626263, 0.377358490566, 0.773594636411, 1.68823860439, 2.30692076229, 1.85185185185, 2.10643015521, 1.9512195122, 2.71668822768, 1.72757475083, 1.45728643216, 1.76839703366, 1.47179067866, 1.2955465587, 1.33444537114, 1.23456790123, 1.47965474723, 1.10974106042, 0.412371134021, 0.372578241431, 1.12697220135, 0.913562895292, 0.62630480167, 0.653594771242, 0.353107344633, 0.762388818297, ],
    "top_five_into":[{"name":"end2", "number":"142"}, {"name":"Good Lovin'", "number":"70"}, {"name":"Johnny B. Goode", "number":"47"}, {"name":"end1", "number":"27"}, {"name":"One More Saturday Night", "number":"23"}, ],
    "top_five_out":[{"name":"Black Peter", "number":"89"}, {"name":"Wharf Rat", "number":"77"}, {"name":"Stella Blue", "number":"52"}, {"name":"Goin' Down The Road Feeling Bad", "number":"19"}, {"name":"I Know You Rider", "number":"16"}, ],
}

function eventWindowLoaded() {
	generateYears();
	generatePopularity();
	generateTables();
};

function generateYears() {
	var ctx = document.getElementById("years").getContext("2d");

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
				datasets: [{ fillColor : "rgba(110,0,110,0.5)",
							strokeColor : "rgba(220,220,220,1)",
							pointColor : "rgba(0,0,220,1)",
							pointStrokeColor : "#fff",
							data : song['years'] }]};
	var options = {};
	var myNewChart = new Chart(ctx).Line(data, options);
};

function generatePopularity() {
	var ctx = document.getElementById("popularity").getContext("2d");

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
				datasets: [{ fillColor : "rgba(110,0,110,0.5)",
							strokeColor : "rgba(220,220,220,1)",
							pointColor : "rgba(0,0,220,1)",
							pointStrokeColor : "#fff",
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
		var row = table.insertRow()
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
		var row = table.insertRow()
		// insert both new cells
		var cell_song = row.insertCell(0);
		var cell_number =  row.insertCell(1);
		cell_song.innerHTML = song['top_five_out'][i].name;
		cell_number.innerHTML = song['top_five_out'][i].number;
	}
};

