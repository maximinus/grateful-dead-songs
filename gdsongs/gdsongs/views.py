from django.shortcuts import render
from django.conf import settings
from django.http import Http404

def index(request):
	"""Main landing page"""
	return(render(request, 'index.html', {}))
	
def testStatic(request):
	# 404 if debug mode
	if(settings.DEBUG == False):
		raise Http404
	return(render(request, 'test.html', {}))

