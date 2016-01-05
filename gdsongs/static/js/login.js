"use strict";

function loginOK() {
	// redirect user
	window.location.replace(REDIRECT);
};

function loginFail(data) {
	data = data.responseJSON;
	enableInputs();
	if(data.hasOwnProperty('error')) {
		if(data.error == 'user') {
			showError('#input-name');
		}
		else {
			showError('#input-password');
		}
		return;
	}
	// a really bad error of some sort
	showError('#input-name');
	showError('#input-password');
};

function showError(input) {
	$(input).parent().addClass('has-error');
};

function removeErrors() {
	$('#input-name').parent().removeClass('has-error');
	$('#input-password').parent().removeClass('has-error');
};

function disableInputs() {
	$('#input-name').prop('disabled', true);
	$('#input-password').prop('disabled', true);
};

function enableInputs() {
	$('#input-name').prop('disabled', false);
	$('#input-password').prop('disabled', false);
};

// control routines for logging a user in
function login(e) {
	disableInputs();
	removeErrors();
	var username = $('#input-name').val();
	var password = $('#input-password').val();
	var data = {'username':username,
				'password':password,
				'csrfmiddlewaretoken': CSRF};
	$.ajax('/login_user/',
		   {'data':data,
		    'type':'POST',
		    'success':loginOK,
		    'error':loginFail});
};

$(document).ready(function() {
	$('#submit-button').click(login);
});
