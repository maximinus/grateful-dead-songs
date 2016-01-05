"use strict";

function loginOK() {
	//
};

function loginFail() {
	//
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
	var username = $('#input-name').val();
	var password = $('#input-password').val();
	var data = {'name':username, 'password':password};
	$.ajax('/login/',
		   {'data':data,
		    'type':'POST',
		    'success':loginOK,
		    'error':loginFail});
};

$(document).ready(function() {
	$('#submit-button').click(login);
});
