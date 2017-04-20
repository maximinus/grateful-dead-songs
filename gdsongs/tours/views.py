from django.shortcuts import render, get_object_or_404
from rest_framework import generics

from tours.models import Tour
from tours.serializers import TourSerializer

def allTours(request):
	"""Sort all songs alphabetically and display"""
	tours = Tour.objects.all().order_by('name')
	context = {'tours':tours, 'number':len(tours)}
	return(render(request, 'tours/index.html', context))

def singleTour(request, tour_id):
	"""Show one tour"""
	tour = get_object_or_404(Tour, pk=int(tour_id))
	return(render(request, 'tours/single.html', {'tour':tour}))


# REST object configurations
class TourList(generics.ListCreateAPIView):
    queryset = Tour.objects.all()
    serializer_class = TourSerializer


class TourDetail(generics.RetrieveAPIView):
    queryset = Tour.objects.all()
    serializer_class = TourSerializer
