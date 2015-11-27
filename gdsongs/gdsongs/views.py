from django.shortcuts import render

def index(request):
	"""Main landing page"""
	return(render(request, 'index.html', {}))


