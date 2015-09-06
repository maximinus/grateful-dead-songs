from django.shortcuts import render

def index(request):
	"""Main landing page"""
	return(render(request, 'index.html', {}))

def testPage(request):
	"""Test page"""
	return(render(request, 'test.html', {}))


