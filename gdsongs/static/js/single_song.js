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


function makeCanvas() {
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
};


function buildAllShows() {
	// first of all, generate a list of all shows
	var shows = [];
	$('#every-show').children().each(function(i) {
		shows.push(this);
	});
	var year = 64;
	var column = $('.every-time-played');
	for(var show of shows) {
		// extract the string year. We want the last 3 digits
		var year_end = parseInt($(show).html().slice(-2));
		if(year_end > year) {
			// output year header
			$(column).append("<h4>19" + year_end + "</h4>")
			// move the year on
			year = year_end;
		}
		$(column).append(show);
	}
};


$(document).ready(function() {
	makeCanvas();
	buildAllShows();
});
