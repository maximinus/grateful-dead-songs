from django.db import models

from songs.models import Song
from venues.models import Venue

import json, datetime

MONTHS = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
SET_NAMES = ['Unknown', '1st', '2nd', '3rd', '4th']
ENDS = ['th', 'st', 'nd', 'rd']

class ShowDate(models.Model):
	"""Because the database has to handle shows with unknown or inaccurate dates,
	   we need a seperate class. We store a year, month and day. 
	   Zero is used to show that we do not know the date.
	   For example: 0-3-1968 would show that the show was in March of 1968
	   but we do not know what day"""
	year = models.IntegerField(default=0, null=False)
	month = models.IntegerField(default=0, null=False)
	day = models.IntegerField(default=0, null=False)
	# don't show these fields in the admin, they are calculated internally
	exact_date = models.DateField(null=True, default=None)
	
	def __unicode__(self):
		"""This should return the date string as universally English / UK format"""
		day = self.getDay()
		if(day != '??'):
			# number, so add the extension
			if((day > 9) and (day < 20)):
				day = str(day) + 'th'
			else:
				end = day % 10;
				if(end > 3):
					end = 0;
				day = str(day) + ENDS[end]
		return('{0} of {1}, {2}'.format(day, self.getMonth(), self.getYear()))

	def getYear(self):
		if(self.year == 0):
			return('??')
		else:
			return(self.year)
	
	def getMonth(self):
		if(self.month == 0):
			return('??')
		else:
			return(MONTHS[self.month - 1])
	
	def getDay(self):
		if(self.day == 0):
			return('??')
		else:
			return(self.day)

	def save(self, *args, **kwargs):
		# if we have a real date, then sort it
		if((self.year != 0) and (self.month != 0) and (self.day != 0)):
			# yes, we know the date. Is it valid?
			try:
				real_date = datetime.datetime(self.year, self.month, self.day)
				self.exact_date = real_date
			except ValueError:
				self.exact_date = None
		super(ShowDate, self).save(*args, **kwargs)

	def __cmp__(self, date):
		"""From docs: -1 if self < date2, 0 if == +1 if self > date2"""
		# we convert with a formula and compare those: unknowns have a 0
		# value of multipliers is more than the maximum next one
		date1 = (self.year * 450) + (self.month * 35) + self.day
		date2 = (date.year * 450) + (date.month * 35) + date.day
		return(cmp(date1, date2))

def showCompare(a, b):
	# a and b are shows, not dates
	a = a.date
	b = b.date
	# compare 2 shows: -1, a earlier / 0, same date / 1, b earlier
	# compare years to start
	if(a.year == b.year):
		# compare months
		if(a.month == b.month):
			# compare days
			return(a.day - b.day)
		else:
			return(a.month - b.month)
	return(a.year - b.year)

class Show(models.Model):
	date = models.ForeignKey(ShowDate)
	venue = models.ForeignKey(Venue, null=True)
	order = models.IntegerField(default=0, null=False)
	# Time should always be GMT
	time_started = models.TimeField(null=True)
	time_ended = models.TimeField(null=True)
	
	def __unicode__(self):
		return('{0}, {1}'.format(str(self.date), self.venue.name))
	
	def getLocalTime(self):
		return('Not implemented')

	@property
	def year(self):
		return(self.date.year)

	@property
	def setlist(self):
		sets = PlayedSet.objects.filter(show=self).order_by('order')
		if(len(sets) == 0):
			return('<p><b>{0}</b></p><p>No sets on this date</p>'.format(self))
		main_text = '<p><b>{0}</b></p>'.format(self)
		text = self.songs_only
		main_text += text
		return(main_text)

	@property
	def songs_only(self):
		sets = PlayedSet.objects.filter(show=self).order_by('order')
		if(len(sets) == 0):
			return('No set data')
		encore_count = 0
		set_count = 0
		text = ''
		for i in sets:
			songs = PlayedSong.objects.filter(played_set=i).order_by('order')
			if(i.encore == True):
				text = 'Encore {0}: '.format(encore_count + 1)
				encore_count += 1
			else:
				text = 'Set {0}: '.format(set_count + 1)
				set_count += 1
			if(len(songs) == 0):
				text += 'No songs known.  '
			else:
				for j in songs:
					text += '{0}'.format(j.song)
					if(j.seque == True):
						text += ' > '
					else:
						text += ' / '
			# remove last 2 chars (the fake transition)
			text = text[:-3]
		return(text)

	def getJSON(self):
		# return as abunch of data including the songs
		data = {'date': str(self.date),
				'venue': str(self.venue)}
		sets = PlayedSet.objects.filter(show=self)
		json_sets = []
		for i in sets:
			songs = PlayedSong.objects.filter(played_set=i).order_by('order')
			json_sets.append([[x.song.id, x.length_string, x.seque, x.comments] for x in songs])
		data['sets'] = json_sets
		return(data)

	def __cmp__(self, show2):
		# compare show dates for sorting
		return(self.date.__cmp__(show2.date))

class PlayedSet(models.Model):
	# we use 1, 2 etc as set order. 0 means unknown
	order = models.IntegerField(default=1)
	show = models.ForeignKey(Show)
	encore = models.BooleanField(default=False)
	
	def __unicode__(self):
		return('{0}, {1}'.format(self.set_text, self.show.date))

	@property
	def set_text(self):
		if(self.encore == True):
			return('Encore')
		else:
			return('{0} set'.format(SET_NAMES[self.order]))

class PlayedSong(models.Model):
	song = models.ForeignKey(Song)
	played_set = models.ForeignKey(PlayedSet)
	# order of 0 means unknown
	order = models.IntegerField(default=1, null=False)
	length = models.IntegerField(default=0, null=False)
	comments = models.TextField(blank=True)
	seque = models.BooleanField(default=False, null=False)
	
	@property
	def year(self):
		return(self.played_set.show.date.year)

	@property
	def trans(self):
		if(self.seque == True):
			return('>')
		else:
			return('/')

	@property
	def length_string(self):
		minutes = (self.length // 60)
		seconds = (self.length - (minutes * 60))
		if(seconds < 10):
			return('{0}:0{1}'.format(minutes, seconds))
		else:
			return('{0}:{1}'.format(minutes, seconds))

	def serialize(self):
		"""We can't json this object automatically, so we build a dict ourselves"""
		return({'id':self.song.id,
				'set':self.played_set.id,
				'order':self.order,
				'length':self.length,
				'comments':self.comments,
				'seque':self.seque})

	def __unicode__(self):
		return('{0}, in {1}, {2}'.format(self.song, self.played_set.set_text, self.played_set.show.date))

	def date_display(self):
		return self.played_set.show.date


# some functions to get data relating to all the songs
def getSongData(song):
	# song is a song model. Get all played versions
	all_versions = PlayedSong.objects.filter(song=song)
	# now we need split them into years
	# there are 31 possibles years, 65 -> 0
	years = [0] * 31
	for i in all_versions:
		years[i.played_set.show.year - 1965] += 1
	# now years has a count. Get the song into or out of
	in_songs = {}
	out_songs = {}
	for i in all_versions:
		# get the played order, and search for order - 1 in the played set
		if(i.order < 1):
			# it was the opener - ignore for now
			continue
		# check the one before
		try:
			previous = PlayedSong.objects.get(played_set=i.played_set, order=i.order-1)
			if(previous.song.name in in_songs):
				in_songs[previous.song.name] += 1
			else:
				in_songs[previous.song.name] = 1
		except PlayedSong.DoesNotExist:
			pass
		# same for outs
		try:
			after = PlayedSong.objects.get(played_set=i.played_set, order=i.order+1)
			if(after.song.name in out_songs):
				out_songs[after.song.name] += 1
			else:
				out_songs[after.song.name] = 1
		except PlayedSong.DoesNotExist:
			pass
	# sort the songs into the top 5
	songs_into = []
	for key, value in sorted(in_songs.iteritems(), key=lambda (k,v): (v,k)):
		songs_into.append([key, value])
	songs_out = []
	for key, value in sorted(out_songs.iteritems(), key=lambda (k,v): (v,k)):
		songs_out.append([key, value])
	# -5 means 'the last 5 elements'
	return([json.dumps(years),
		    reversed(songs_into[-5:]),
		    reversed(songs_out[-5:]),
		    get_shows_from_songs(all_versions)])


def get_shows_from_songs(songs):
	"""Given a list of PlayedSongs, return a list of shows"""
	# get all unique shows
	shows = list(set([x.played_set.show for x in songs]))
	# sort by date
	shows = sorted(shows, cmp=showCompare)
	# extract the dates and return
	return shows


class OfficalReleaseLink(models.Model):
	show = models.ForeignKey(Show)
	link = models.URLField(null=False)
	text = models.CharField(max_length=200)

	def __unicode__(self):
		return('Official release - {0}'.format(self.link))

class MusicLink(models.Model):
	SOUNDBOARD = 0
	AUDIENCE = 1
	MATRIX = 2
	VIDEO = 3
	MUSIC_TYPES = (
		(SOUNDBOARD, 'Soundboard'),
		(AUDIENCE, 'Audience'),
		(MATRIX, 'Matrix'),
		(VIDEO, 'Video')
	)

	show = models.ForeignKey(Show)
	link = models.URLField(null=False)
	text = models.CharField(max_length=200)
	music_type = models.PositiveSmallIntegerField(choices=MUSIC_TYPES)

	def __unicode__(self):
		return('Music link - {0}'.format(self.link))
