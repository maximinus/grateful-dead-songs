from django.db import models

from songs.models import Song
from venues.models import Venue

import datetime

MONTHS = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
SET_NAMES = ['Unknown', '1st', '2nd', '3rd', '4th']

class ShowDate(models.Model):
	"""Because the database has to handle shows with unknown or inaccurate dates, we need a seperate class
	   We store a year, month and day. Zero is used to show that we do not know the date.
	   For example: 0-3-1968 would show that the show was in March of 1968 but we do not know they day"""
	year = models.IntegerField(default=0, null=False)
	month = models.IntegerField(default=0, null=False)
	day = models.IntegerField(default=0, null=False)
	# don't show these fields in the admin, they are calculated internally
	exact_date = models.DateField(null=True, default=None)
	
	def __unicode__(self):
		"""This should return the date string as universally English / UK format"""
		return('{0} of {1}, {2}'.format(self.getDay(), self.getMonth(), self.getYear()))

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
	def setlist(self):
		"""This code returns a generated text setlist"""
		# get all the sets for this show
		sets = PlayedSet.objects.filter(show=self).order_by('order')
		if(len(sets) == 0):
			return('No sets on this date')
		text = ''
		encore_count = 0
		set_count = 0
		for i in sets:
			# get all songs
			songs = PlayedSong.objects.filter(played_set=i).order_by('order')
			if(i.encore == True):
				text += 'Encore {0}: '.format(encore_count + 1)
				encore_count += 1
			else:
				text += 'Set {0}: '.format(set_count + 1)
				set_count += 1
			if(len(songs) == 0):
				text += 'No songs known.  '
			else:
				for j in songs:
					text += '{0} '.format(j.song)
					if(j.seque == True):
						text += '> '
					else:
						text += '/ '
			# remove last 2 chars (the fake transition)
			text = text[:-2]
			text += '\n'
		return(text)
	
	@property
	def setlist_html(self):
		sets = PlayedSet.objects.filter(show=self).order_by('order')
		if(len(sets) == 0):
			return('<p><b>{0}</b></p><p>No sets on this date</p>'.format(self))
		encore_count = 0
		set_count = 0
		main_text = '<p><b>{0}</b></p>'.format(self)
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
			main_text += '<p>{0}</p>'.format(text)
		return(main_text)

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

	def __unicode__(self):
		return('{0}, in {1}, {2}'.format(self.song, self.played_set.set_text, self.played_set.show.date))
