from django.shortcuts import render
from django.http import HttpResponse

from .models import ShowDate, Show, PlayedSet, PlayedSong
from songs.models import Song

import json, datetime

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
	sets = [request.POST['set1'],
			request.POST['set2'],
			request.POST['set3'],
			request.POST['set4']]
	date = [int(request.POST['day']), int(request.POST['month']), int(request.POST['year'])]
	encore = request.POST['encore']

	# now the complex part we must put all of this into a new show
	# first we must validate that everything is ok. If so, then we delete all references
	# to this show and then add it back
	set_data = []
	for i in sets:
		json_data = json.loads(i)
		songs = normalizeSetData(json_data)
		if(songs == False):
			return(HttpResponse(status=400))
		set_data.append(songs)
	date = normalizeDateData(date)
	if(date == False):
		return(HttpResponse(status=400))
	encore = normalizeEncoreData(encore)
	# seems to be all ok. Now enter all of that data
	saveData(set_data, date, encore)
	return(HttpResponse(status=200))

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
			print('Found:', song_id.name)
		except:
			return(False)
		normal_song.append(song_id)
		# seque is empty or not
		if(song[1] == ''):
			normal_song.append(False)
		else:
			normal_song.append(True)
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

def saveData(set_data, date, encore):
	# we generate this backwards
	# first we save the given date
	date.save()
	# then we generate the show
	show = Show(date=date)
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
								  comments = song.comments,
								  seque = songs.seque)
			new_song.save()
			song_order += 1
		index += 1
	return(True)

