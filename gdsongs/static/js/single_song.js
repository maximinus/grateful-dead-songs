"use strict";

function getYearList() {
	// generate labels for the years
	var year = 65;
	var labels = [];
	while(year != 96) {
		labels.push(year.toString());
		year += 1;
	}
	return(labels);
};

$(document).ready(function() {
	// make the canvas width equal to the screen width
	var canvas_width = $('#use-width').width();
	// account for margins
	var margin = parseInt($('#song-canvas').css('margin-top'));
	canvas_width -= (margin * 2);
	$('#song-canvas').prop({width: canvas_width});
	// setup the graph
	var ctx = $('#song-canvas');
	var data = {labels: getYearList(),
				datasets: [{label: "Played per year",
							backgroundColor: "rgba(255,99,132,0.2)",
							borderColor: "rgba(255,99,132,1)",
							borderWidth: 1,
							data: YEAR_DATA,}]};

	var song_chart = new Chart(ctx, {
		type: 'bar',
		data: data,
		options: {
			responsive: false,
			maintainAspectRatio: true,
		}
	});
});
