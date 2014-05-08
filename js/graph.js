// make a graph with the chart.js library

window.addEventListener('load', eventWindowLoaded, false);

function eventWindowLoaded() {
	generateYears();
	generatePopularity();
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

