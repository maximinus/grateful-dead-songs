window.addEventListener('load', eventWindowLoaded, false);

function eventWindowLoaded() {
	$(function() {$("#tags").autocomplete({source: songs});});
};

