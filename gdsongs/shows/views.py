from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, Http404
from django.contrib.auth.decorators import login_required

import json, datetime

from .models import ShowDate, Show, PlayedSet, PlayedSong
from songs.models import Song
from venues.models import Venue
from venues.locations import getStateList, getCountryList

def allShows(request):
	shows = Show.objects.all()
	context = {'shows':shows, 'number':len(shows)}
	return(render(request, 'shows/index.html', context))

def singleShow(request, show_id):
	show = get_object_or_404(Show, pk=int(show_id))
	return(render(request, 'shows/single.html', {'show':show}))

def editShows(request):
	shows = Show.objects.all()
	# split into buckets by year
	years = [[] for x in range(31)]
	for i in shows:
		years[i.year - 1965].append(i)
	years = [len(x) for x in years]
	context = {'years':years}
	return(render(request, 'editing/edit_shows.html', context))

def editYearShows(request, year):
	year = int(year)
	if((year < 1965) or (year > 1995)):
		raise Http404
	# filter all shows by date and get all those that match the year
	context = {'shows':[x for x in Show.objects.all().order_by('date') if x.year == year]}
	context['year'] = year
	return(render(request, 'editing/edit_year_shows.html', context))

def editSingleShow(request, show_id):
	show = get_object_or_404(Show, pk=int(show_id))
	return(render(request, 'editing/edit_single_show.html', {'id':show.id}))

def getShowAsJson(request, show_id):
	show = get_object_or_404(Show, pk=int(show_id))
	return(HttpResponse(show.getJson(),  content_type='application/json', status=200))

@login_required
def addShow(request):
	"""Complex page to add a show."""
	context = {'countries':getCountryList(),
			   'states':getStateList(),
			   'songs':Song.objects.all()}
	return(render(request, 'editing/add_show.html', context))

class NewSet(object):
	def __init__(songs, encore):
		self.songs = songs
		self.encore = encore

class NewSong(object):
	def __init__(self, song, seque, length, comment):
		self.song = song
		self.seque = seque
		self.length = length
		self.comment = comment

def uploadShow(request):
	if(request.method != 'POST'):
		return(HttpResponse(status=404))
	try:
		sets = request.POST['sets']
		date = [int(request.POST['day']), int(request.POST['month']), int(request.POST['year'])]
		encore = request.POST['encore']
		venue = int(request.POST['venue'])
	except KeyError:
		msg = json.dumps({'msg':"Missing some data."})
		return(HttpResponse(msg,  content_type='application/json', status=400))
	# now the complex part we must put all of this into a new show
	# first we must validate that everything is ok. If so, then we delete all references
	# to this show and then add it back
	set_data = []
	sets = json.loads(sets)
	for i in sets:
		songs = normalizeSetData(i)
		if(len(songs) == []):
			# don't add the set and finish here
			break
		if(songs == False):
			msg = json.dumps({'msg':'Songs were wrong.'})
			return(HttpResponse(msg,  content_type='application/json', status=400))
		set_data.append(songs)
	date = normalizeDateData(date)
	if(date == False):
		msg = json.dumps({'msg':"Couldn't normalize song data."})
		return(HttpResponse(msg,  content_type='application/json', status=400))
	encore = normalizeEncoreData(encore)
	# seems to be all ok. Get the venue and then save
	try:
		venue = Venue.objects.get(pk=venue)
	except:
		msg = json.dumps({'msg':"Venue does not exist."})
		return(HttpResponse(msg,  content_type='application/json', status=400))
	setlist = saveData(set_data, date, encore, venue)
	json_data = json.dumps({'msg':setlist})
	return(HttpResponse(json_data,  content_type='application/json', status=200))

def normalizeSetData(new_set):
	normal = []
	for song in new_set:
		# this is a list: ["song_id", "seque", length_in_seconds, "comments"]
		# we validate this and turn it into a better data format
		if(len(song) != 4):
			return(False)
		normal_song = []
		if(song[0] == ''):
			# ignore empty songs
			continue
		# check song id is valid
		try:
			song_id = Song.objects.get(pk=int(song[0]))
		except:
			return(False)
		normal_song.append(song_id)
		# seque is empty or not
		normal_song.append(song[1])
		if(song[2] == ''):
			normal_song.append(0)
		else:
			normal_song.append(song[2])
		normal_song.append(song[3])
		normal.append(NewSong(*normal_song))
	return(normal)

def normalizeDateData(date):
	# let's make a DB date object but not save it
	# date is [day, month, year]
	# and is -1 if unknown
	for i in range(len(date)):
		if(date[i] == -1):
			date[i] == 0
	if((date[0] != 0) and (date[1] != 0) and (date[2] != 0)):
		# this should be a valid date, so test it
		try:
			valid = datetime.datetime(date[2], date[1], date[0])
		except ValueError:	
			# invalid date
			return(False)
	# now the checks are over, the rest is easy
	return(ShowDate(year=date[2], month=date[1], day=date[0]))

def normalizeEncoreData(encore):
	return(json.loads(encore))

def saveData(set_data, date, encore, venue):
	# we generate this backwards
	# first we save the given date
	date.save()
	# then we generate the show
	show = Show(date=date, venue=venue)
	show.save()
	index = 1
	# then we generate the playedsets one by one
	for single_set in set_data:
		if(single_set == []):
			# we have finished
			break
		new_set = PlayedSet(order=index, show=show, encore=encore[index -1])
		new_set.save()
		# then we add the songs for those sets
		song_order = 1
		for song in single_set:
			new_song = PlayedSong(song = song.song,
								  played_set = new_set,
								  order = song_order,
								  length = song.length,
								  comments = song.comment,
								  seque = song.seque)
			new_song.save()
			song_order += 1
		index += 1
	return(show.setlist)
	