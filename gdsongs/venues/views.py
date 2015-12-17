from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse

import json

from venues.models import Venue
from locations import getStateCode, getCountryCode, getStateName, getCountryName

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
	latitude = request.POST['latitude']
	# there are a few things to do here. First we check that the country is valid
	country = getCountryCode(country)
	if(country == None):
		# return an error
		json_data = json.dumps({'country':'This country does not exist'})
		return(HttpResponse(json_data, content_type='application/json', status=404))
	if(country == 0):
		# we must check the state
		state = getStateCode(state)
		if(state == None):
			json_data = json.dumps({'state':'This state does not exist'})
			return(HttpResponse(json_data, content_type='application/json', status=404))
	else:
		state = -1
	# The city and venue are just text, we can ignore them
	# longitude and latitude are the same, just numbers, but we should check that both exist or not
	# the following statement is the nearest to a XOR I could get
	if(bool(longitude == '') ^ bool(latitude == '')):
		json_data = json.dumps({'longitude':'Both values must be numbers or be empty',
								'latitude':'Both values must be numbers or be empty'})
		return(HttpResponse(json_data, content_type='application/json', status=404))
	# let's just add the venue
	if(longitude == ''):
		new_venue = Venue(country=country, state=state, city=city, name=venue)
	else:
		new_venue = Venue(country=country, state=state, city=city, name=venue, longitude=longitude, latitude=latitude)	
	new_venue.save()
	# the js code will need to re-populate the drop-downs. It already has the state and the country, so we
	# create the 2 other lists, give the index and return this data
	query = Venue.objects.filter(country=country).filter(state=state)
	cities = set([x.city for x in query])
	venues = set([x.name for x in query.filter(city=city)])
	json_data = json.dumps({'country':getCountryName(country),
							'state':getStateName(state),
							'cities':[x for x in cities],
							'city_index':city,
							'venues':[x for x in venues],
							'venue_index':venue})
	new_venue.delete()
	return(HttpResponse(json_data, content_type='application/json', status=200))

