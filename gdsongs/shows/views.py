from django.shortcuts import render
from django.http import HttpResponse

from .models import ShowDate, Show, PlayedSet, PlayedSong
from songs.models import Song

import json

def uploadShow(request):
	if(request.method != 'POST'):
		return(HttpResponse(status=404))
	sets = [request.POST['set1'],
			request.POST['set2'],
			request.POST['set3'],
			request.POST['set4']]
	date = [request.POST['day'], request.POST['month'], request.POST['year']]
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
		print(songs)
		set_data.append(songs)
	return(HttpResponse(status=200))

def normalizeSetData(new_set):
	normal = []
	for song in new_set:
		# this is a list: ["song_id", "seque", length_in_seconds, "comments"]
		# we validate this and turn it into a better data format
		
		print song
		print int(song[0])
		
		if(len(song) != 4):
			print 'length error'
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
			print 'ID Error'
			return(False)
		normal_song.append(int(song[0]))
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
	return(normal)

