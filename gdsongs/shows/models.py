from django.db import models

from songs.models import Song
from venues.models import Venue

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
			return(self(self.year))
	
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
	venue = models.ForeignKey(Venue)
	order = models.IntegerField(default=0, null=False)
	# Time should always be GMT
	time_started = models.TimeField(null=True)
	time_ended = models.TimeField(null=True)
	
	def __unicode__(self):
		return('{0}, {1}'.format(str(self.date), self.venue.name))
	
	def getLocalTime(self):
		return('Not implemented')

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
	order = models.IntegerField(default=0, null=False)
	length = models.IntegerField(default=0, null=False)
	comments = models.TextField(blank=True)
	
	def __unicode__(self):
		return('{0}, in {1}, {2}'.format(self.song, self.played_set.set_text, self.played_set.show.date))

