from django.shortcuts import render
from django.conf import settings
from django.http import Http404, HttpResponse
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.conf import settings
from django.core.servers.basehttp import FileWrapper

import json, shutil, os, time

from songs.models import Song

def index(request):
	"""Main landing page"""
	return(render(request, 'index.html', {}))

def loginUser(request):
	# get the redirect url (after the ?next?)
	if(request.method != 'GET'):
		return(HttpResponse(status=404))
	print(request.GET)
	try:
		redirect = request.GET['next'];
	except KeyError:
		# redirect to the front page
		redirect = '/'
	return(render(request, 'auth/login.html', {'redirect':redirect}))

def checkLogin(request):
	# this is an AJAX call. Take the name and password
	# return a status != 200 and the problem ('user' or 'pass') if failed login
	# must be an AJAX post
	if((not request.is_ajax()) or (request.method != 'POST')):
		return(HttpResponse(status=404))
	try:
		username = request.POST['username']
	except KeyError:
		msg = json.dumps({'error':'user'})
		return(HttpResponse(msg,  content_type='application/json', status=400))
	try:
		password  = request.POST['password']
	except KeyError:
		msg = json.dumps({'error':'pass'})
		return(HttpResponse(msg,  content_type='application/json', status=400))
	# all seems ok, try to login
	user = authenticate(username=username, password=password)
	if(user is not None):
		if user.is_active:
			login(request, user)
			return(HttpResponse(status=200))
	# was is the user or the password?
	try:
		User.objects.get(username=username)
	except User.DoesNotExist:
		msg = json.dumps({'error':'user'})
		return(HttpResponse(msg,  content_type='application/json', status=400))
	msg = json.dumps({'error':'pass'})
	return(HttpResponse(msg,  content_type='application/json', status=400))

def logoutUser(request):
	logout(request)
	return(index(request))

# test functions follow below
# these must all 404 on the production server
def testStatic(request):
	# 404 if debug mode
	if(settings.DEBUG == False):
		raise Http404
	return(render(request, 'test.html', {}))

def showSong(request):
	if(settings.DEBUG == False):
		raise Http404
	return(render(request, 'auto/examples/single_song.html', {}))

@login_required
def databaseBackup(request):
	# look inside the backups folder and get the most recent file
	youngest = 0.0
	filename = ''
	for i in os.listdir(settings.BACKUP_DIRECTORY):
		age = os.path.getmtime(os.path.join(settings.BACKUP_DIRECTORY, i))
		if(age > youngest):
			youngest = age
			filename = i
	# now we have a file... or do we?
	if(filename == ''):
		# probably should force an error here, but 404 for now
		raise Http404
	sql_data = open(os.path.join(settings.BACKUP_DIRECTORY, filename))
	response = HttpResponse(sql_data.read(), content_type='application/sql')
	response['Content-Disposition'] = 'attachment; filename={0}'.format(filename)
	return(response)
