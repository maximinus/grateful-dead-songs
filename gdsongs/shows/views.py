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

	# now the complex part we must put all of this into a new show
	# first we must validate that everything is ok. If so, then we delete all references
	# to this show and then add it back

	return(HttpResponse(status=200))

