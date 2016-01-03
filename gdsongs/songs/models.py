from django.db import models

class Song(models.Model):
	name = models.CharField(max_length=64, blank=False)
	shortname = models.CharField(max_length=32, blank=False)
	fragment = models.BooleanField(default=False)

	def songUrl(self):
		# strip all spaces
		return(self.name.replace(' ', ''))

	def __unicode__(self):
		return(self.name)

class AlternateName(models.Model):
	song = models.ForeignKey(Song)
	name = models.CharField(max_length=64, blank=False)
    
	def __unicode__(self):
		return(self.name)

