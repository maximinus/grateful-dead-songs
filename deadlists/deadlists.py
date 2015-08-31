#!/usr/bin/python

# code to extract data from the database... where we normalise etc.
# this is just to get the raw data

import sqlite3, pickle
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

def convertSets(played):
	# break up all the played songs, first into seperate shows:
	show_lists = {}
	for i in played:
		if(i.show in show_lists):
			show_lists[i.show].append(i)
		else:
			show_lists[i.show] = [i]
	# now we have a list of shows, break into sets

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
	print(' Matched up: {0}'.format(len(paired)))
	print(' >1: DL: {0}, DB: {1}'.format(len(DL_twice), len(DB_twice)))
	return(paired)
			

def showMatched(matched):
	print matched[0]
	print matched[1]

# code above to extract all data and merge it

def printComparison(lists, bases):
	print('  Deadlists: {0} shows'.format(len(lists['shows'])))
	print('   Database: {0} shows'.format(len(bases)))

if __name__ == '__main__':
	# get the deadlists data
	deadlist = getDeadListsData()
	database = getDatabaseData()
	shows = matchShows(deadlist, database)
	printComparison(deadlist, database)
	showMatched(shows[1000])

