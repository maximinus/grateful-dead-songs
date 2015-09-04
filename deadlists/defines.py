#!/usr/bin/python

# These are the base classes we use to hold the data

class Songwriter(object):
	# a person who wrote a song
	name = ''

class DLSong(object):
	# an actual song
	_id = -1
	name = ''
	abbr = ''
	total_times = 0
	first_show = None
	last_show = None
	writers = []

class PlayedSong(object):
	# an instance for every song that was played
	_id = -1
	name = ''
	song = None
	transition = None
	comments = ''
	length = 0
	setnum = 0
	place = 0
	show = 0
	song_model = None
	
	def display(self):
		print('{0}, {1}'.format(self.song, self.length))

class DLShow(object):
	# a list of sets forming a show
	sets = []
	_id = -1
	date = ''
	location = 0
	comments = ''
	live = True
	number = 0
	
	def convertDate(self):
		# just a string
		dates = self.date.split('-')
		# number is one above the DB version
		return('{0}-{1}-{2}'.format(dates[0][2:], dates[1], dates[2]))

class Venue(object):
	# to show where the song was played
	longitude = 0;
	latitude = 0;
	name = ''
	city = ''
	state = ''

if __name__ == '__main__':
	foo = PlayedSong()
	print foo

