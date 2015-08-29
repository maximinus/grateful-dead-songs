#!/usr/bin/python

# These are the base classes we use to hold the data

class Songwriter(object):
	# a person who wrote a song
	name = ''

class Song(object):
	# an actual song
	name = ''
	abbr = ''
	total_times = 0
	first_show = None
	last_show = None
	writers = []

class PlayedSong(object):
	# an instance for every song that was played
	song = None
	transition = None
	comments = []
	rating = 0

class PlayedSet(object):
	# a list of songs forming a set
	songs = []
	rating = 0

class Show(object):
	# a list of sets forming a show
	sets = []
	rating = 0

class Venue(object):
	# to show where the song was played
	longitude = 0;
	latitude = 0;
	name = ''

if __name__ == '__main__':
	foo = PlayedSong()
	print foo

