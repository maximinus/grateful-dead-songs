#!/usr/bin/python

# code to extract data from the database... where we normalise etc.
# this is just to get the raw data

import sqlite3, pickle, json
from defines import *
from show_data import *

TABLES = {'songs':'songs_song',
		  'played':'shows_playedsong',
		  'shows':'shows_show',
		  'venues': 'shows_location'}

def openDatabase():
	conn = sqlite3.connect('deadlists.sqlite3')
	return(conn)

def getSongs(data):
	songs = []
	for i in data.execute('SELECT * from {0}'.format(TABLES['songs'])):
		new_song = DLSong()
		new_song._id = i[0]
		new_song.abbr = i[1]
		new_song.name = i[2]
		songs.append(new_song)
	return(songs)

def getPlayedSongs(data):
	songs = []
	for i in data.execute('SELECT * from {0}'.format(TABLES['played'])):
		new_song = PlayedSong()
		new_song._id = i[0]
		new_song.song = i[1]
		new_song.transition = i[2]
		new_song.comments = i[3]
		new_song.length = i[4]
		new_song.setnum = i[5]
		new_song.place = i[6]
		new_song.show = i[7]
		songs.append(new_song)
	return(songs)

def getVenues(data):
	venues = []
	for i in data.execute('SELECT * from {0}'.format(TABLES['venues'])):
		new_venue = Venue()
		new_venue._id = i[0]
		name = i[1]
		city = i[2]
		state = i[3]
		venues.append(new_venue)
	return(venues)

def getShows(data):
	shows = []
	for i in data.execute('SELECT * from {0}'.format(TABLES['shows'])):	
		new_show = DLShow()
		new_show._id = i[0]
		new_show.date = i[1]
		new_show.number = i[2]
		new_show.location = i[3]
		new_show.comments = i[4]
		new_show.live = i[5]
		shows.append(new_show)
	return(shows)

def addSongInfo(played, songs):
	# in-efficient but quick and easy
	dsongs = {}
	for i in songs:
		dsongs[i._id] = i
	for i in played:
		if(i.song in dsongs):
			i.song_model = dsongs[i.song]
	return(played)

def convertSets(played):
	# break up all the played songs, first into seperate shows:
	show_lists = {}
	for i in played:
		if(i.show in show_lists):
			show_lists[i.show].append(i)
		else:
			show_lists[i.show] = [i]
	# now we have a list of shows, break into sets
	new_shows = {}
	for i in show_lists.iterkeys():
		# show_lists[i] is an array of songs
		new_sets = {}
		for song in show_lists[i]:
			if(song.setnum in new_sets):
				new_sets[song.setnum].append(song)
			else:
				new_sets[song.setnum] = [song]
		# now we we have some unorded sets. Order them
		# before we had a list of songs, now we have list of sets
		new_shows[i] = orderSets(new_sets)
	# We are returning a dict of shows with a dict of ordered sets
	return(new_shows)

def addSetlists(shows, set_info):
	# shows is the list of all shows
	# set info is a dict of {xxx:{sets:[]}}
	# where X is the id of the show 
	show_ids = {}
	for i in shows:
		show_ids[i._id] = i
	for i in set_info.iterkeys():
		if i in show_ids:
			show_ids[i].sets = set_info[i]
	return([show_ids[x] for x in show_ids.iterkeys()])

def orderSets(sets):
	for i in sets.iterkeys():
		# for all sets
		sets[i].sort(key=lambda x: x.place, reverse=False)
	return(sets)

def replaceSets(shows):
	# all shows now have a dict of ordered sets.
	# Replace this with an arrat of Set() objects, same as database object
	for i in shows.iteerkeys():
		pass

def getDeadListsData():
	data = openDatabase()
	deadlist = {}
	deadlist['songs'] = getSongs(data)
	deadlist['played'] = getPlayedSongs(data)	
	deadlist['venues'] = getVenues(data)
	deadlist['shows'] = getShows(data)
	data.close()
	return(deadlist)

def getDatabaseData():
	data_file = open('shows.pickle', 'rb')
	database = pickle.load(data_file)
	return(database)

# code below to extract all data and merge it

def matchShows(deadlist, database):
	# produce a dict of shows for each one. The format is YY-MM-DD-N,
	# where n is the index for that day
	DL_shows = {}
	DB_shows = {}
	DL_twice = []
	DB_twice = []
	for i in deadlist['shows']:
		if(i.convertDate() in DL_shows):
			DL_twice.append(i)
		else:
			DL_shows[i.convertDate()] = i
	for i in database:
		if(i.convertDate() in DB_shows):
			DB_twice.append(i)
		else:
			DB_shows[i.convertDate()] = i
	# match like for like
	paired = []
	found = []
	for i in DB_shows.iterkeys():
		if i in DL_shows:
			# i.e., we have a match for both
			paired.append([DB_shows[i], DL_shows[i]])
		else:
			# not in DL_shows
			paired.append([DB_shows[i], None])
		found.append(i)
	# check other way around
	for i in DL_shows.iterkeys():
		if i not in found:
			paired.append([None, DL_shows[i]])
	print('  Matched up: {0}'.format(len(paired)))
	print('  >1: DL: {0}, DB: {1}'.format(len(DL_twice), len(DB_twice)))
	return(paired)

def matchSongID(text):
	if(text == ''):
		return(-1)
	for i in all_songs:
		for j in i[1]:
			if text == j:
				return(i[0])
	# didn't find, error:
	text = "Couldn't match '{0}'".format(text)
	raise NameError(text)

def convertSet(new_set):
	# new set is a list of PlayedSong
	# we take the name, look for it in the songs, and then set the id
	for i in new_set:
		i._id = matchSongID(i.name)
	return(new_set)

def convertData(show):
	# given a show, convert the format
	# the instance is a dict of sets, so first we need to change sets
	sets = []
	if(show.sets == []):
		return([])	
	for i in show.sets.iterkeys():
		sets.append([i, show.sets[i]])
	# sort
	sorted(sets, key=lambda new_set: new_set[0])
	sets = [x[1] for x in sets]
	# now we have a list of sets in order
	return([convertSet(x) for x in sets])

def equalFormat(shows):
	# shows is a list of lists of the format [db_show, dl_show]
	# convert the format of the latter so it is the same as the other
	for i in shows:
		convert = i[1]
		if(convert == None):
			continue

		print convert
		
		i[1].sets = convertData(convert)
	return(shows)

def addNormalID(shows):
	for i in shows:
		if(i[0] == None):
			continue
		convert = i[0].sets
		if(convert == []):
			continue
		i[0].sets = [convertSet(x.songs) for x in convert]
	return(shows)

def showMatched(matched):
	print matched[0].sets
	print matched[1].sets

def compareShows(show1, show2):
	# show 1 has sets that are of type Set
	# show2 has a simple ordered array of PlayedSongs
	# both song id's come from all_songs
	pass

if __name__ == '__main__':
	# get the deadlists data
	deadlist = getDeadListsData()
	database = getDatabaseData()
	all_songs = json.load(open('all_songs.json'))
	deadlist['played'] = addSongInfo(deadlist['played'], deadlist['songs'])
	set_info = convertSets(deadlist['played'])
	deadlist['shows'] = addSetlists(deadlist['shows'], set_info)
	shows = matchShows(deadlist, database)	
	# the matched shows are still different in the way they operate
	# sort the dicts in the second order
	shows = equalFormat(shows)
	# add the correct id's to the other sets
	show = addNormalID(shows)
	showMatched(shows[1000])

