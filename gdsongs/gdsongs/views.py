from django.shortcuts import render
from django.conf import settings
from django.http import Http404
from django.contrib.auth.decorators import login_required

from songs.models import Song
from venues.locations import getStateList, getCountryList

def index(request):
	"""Main landing page"""
	return(render(request, 'index.html', {}))

@login_required
def addShow(request):
	"""Complex page to add a show."""
	context = {'countries':getCountryList(),
			   'states':getStateList(),
			   'songs':Song.objects.all()}
	return(render(request, 'editing/add_show.html', context))

def loginUser(request):
	return(render(request, 'auth/login.html'))

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
	return(render(request, 'auto/build/single_song.html', {}))
