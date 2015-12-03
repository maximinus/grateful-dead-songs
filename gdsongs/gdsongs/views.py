from django.shortcuts import render
from django.conf import settings
from django.http import Http404

from songs.models import Song

def index(request):
	"""Main landing page"""
	return(render(request, 'index.html', {}))

def addShow(request):
	"""Complex page to add a show."""
	return(render(request, 'editing/add_show.html', {'songs':Song.objects.all()}))

# test functions follow below
# these must all 404 on the production server

def testStatic(request):
	# 404 if debug mode
	if(settings.DEBUG == False):
		raise Http404
	return(render(request, 'test.html', {}))

