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
	return(render(request, 'test_index.html', {}))
	#return(render(request, 'index.html', {}))

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
	# empty the backup folder if it exists
	if(os.path.isdir(settings.DBBACKUP_DIR)):
		shutil.rmtree(settings.DBBACKUP_DIR)
	# make the new file
	os.system('./manage.py dbbackup')
	# get the file
	db_filename = [f for f in os.listdir(settings.DBBACKUP_DIR) if os.path.isfile(os.path.join(settings.DBBACKUP_DIR, f))][0]
	# offer this as an upload
	filename = open(os.path.join(settings.DBBACKUP_DIR, db_filename))
	wrapper = FileWrapper(file(filename))
	response = HttpResponse(wrapper, content_type='text/plain')
	response['Content-Length'] = os.path.getsize(filename)
	return(response)
