from django.shortcuts import render
from django.http import HttpResponse

def uploadShow(request):
	if(request.method != 'POST'):
		return(HttpResponse(status=404))
	sets = [request.POST['set1'],
			request.POST['set2'],
			request.POST['set3'],
			request.POST['set4']]
	print(sets)
	return(HttpResponse(status=200))

	

