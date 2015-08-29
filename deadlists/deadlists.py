#!/usr/bin/python

# code to extract data from the database... where we normalise etc.
# this is just to get the raw data

import sqlite3
from defines import *

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
		new_song = Song()
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
		new_show = Show()
		new_show._id = i[0]
		new_show.date = i[1]
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

if __name__ == '__main__':
	data = openDatabase()
	songs = getSongs(data)
	played = getPlayedSongs(data)
	venues = getVenues(data)
	shows = getShows(data)
	data.close()

