from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse

import json

from venues.models import Venue
from locations import getStateCode, getCountryCode

def allVenues(request):
	"""Sort all songs alphabetically and display"""
	venues = Venue.objects.all().order_by('name')
	context = {'venues':venues, 'number':len(venues)}
	return(render(request, 'venues/index.html', context))

def singleVenue(request, venue_id):
	"""Show one song"""
	venue = get_object_or_404(Venue, pk=int(venue_id))
	return(render(request, 'venues/single.html', {'venue':venue}))

def getCities(request):
	"""Return a list of cities in this state"""
	if(request.method != 'POST'):
		return(HttpResponse(status=404))
	code = getStateCode(request.POST['state'])
	if(code == None):
		return(HttpResponse(status=404))
	# get unique cities for venues in this state
	cities = set([x.city for x in Venue.objects.filter(state=code)])
	if(len(cities) == 0):
		cities = ['None']
	else:
		# this step to make is fit for json
		cities = [str(x) for x in cities]
	json_data = json.dumps({'cities':cities})
	return(HttpResponse(json_data,  content_type='application/json', status=200))

def getVenues(request):
	"""Return a list of venues in this city"""
	if(request.method != 'POST'):
		return(HttpResponse(status=404))
	city = request.POST['city']
	venues = [[x.name, x.id] for x in Venue.objects.filter(city=city)]
	if(len(venues) == 0):
		venues = [['None', -1]]
	json_data = json.dumps({'venues':venues})
	return(HttpResponse(json_data,  content_type='application/json', status=200))

def getCountryCities(request):
	if(request.method != 'POST'):
		return(HttpResponse(status=404))
	code = getCountryCode(request.POST['country'])
	if(code == None):
		return(HttpResponse(status=404))
	# get unique cities for venues in this country
	cities = set([x.city for x in Venue.objects.filter(country=code)])
	if(len(cities) == 0):
		cities = ['None']
	else:
		cities = [str(x) for x in cities]
	json_data = json.dumps({'cities':cities})
	return(HttpResponse(json_data,  content_type='application/json', status=200))

def addNewVenue(request):
	"""This rather long function is just to test all the data that arrives."""
	if(request.method != 'POST'):
		return(HttpResponse(status=404))
	# we will assume that the data is in the request
	country = request.POST['country']
	state = request.POST['state']
	city = request.POST['city']
	venue = request.POST['venue']
	longitude = request.POST['longitude']
	latitude = request.POST['latitide']
	# there are a few things to do here. First we check that the country is valid
	country = getCountryCode(country)
	if(country == None):
		# return an error
		json_data = json.dumps({'country':'This country does not exist'})
		return(HttpResponse(json_data, content_type='application/json', status=404))
	return(HttpResponse(json_data, status=404))

