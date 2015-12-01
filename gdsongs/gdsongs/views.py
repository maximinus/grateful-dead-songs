from django.shortcuts import render
from django.conf import settings
from django.http import Http404

def index(request):
	"""Main landing page"""
	return(render(request, 'index.html', {}))

def addShow(request):
	"""Complex page top add a show. Depends on a lot of AJAX calls"""
	return(render(request, 'editing/add_show.html'))

# test functions follow below
# these must all 404 on the production server

def testStatic(request):
	# 404 if debug mode
	if(settings.DEBUG == False):
		raise Http404
	return(render(request, 'test.html', {}))
