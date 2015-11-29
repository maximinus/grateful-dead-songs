from django.shortcuts import render, get_object_or_404

from venues.models import Venue

def allVenues(request):
	"""Sort all songs alphabetically and display"""
	venues = Venue.objects.all().order_by('name')
	context = {'venues':venues, 'number':len(venues)}
	return(render(request, 'venues/index.html', context))

def singleVenue(request, venue_id):
	"""Show one song"""
	venue = get_object_or_404(Venue, pk=int(venue_id))
	return(render(request, 'venues/single.html', {'venue':venue}))
