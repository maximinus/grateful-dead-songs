from django.shortcuts import render
from django.http import HttpResponse

def uploadShow(request):
	if(request.method != 'POST'):
		return(HttpResponse(status=404))
	sets = [request.POST['set1'],
			request.POST['set2'],
			request.POST['set3'],
			request.POST['set4']]
	date = [request.POST['day'], request.POST['month'], request.POST['year']]
	print(sets)
	print(date)
	return(HttpResponse(status=200))

