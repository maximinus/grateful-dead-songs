from django.db import models

class Song(models.Model):
	name = models.CharField(max_length=64, empty=False)
	shortname = models.CharField(max_length=32, empty=False)
	fragment = models.BooleanField(default=False)

	def __unicode__(self):
		return(self.name)

class AlternateName(models.Model):
	song = models.ForeignKey(Song)
	name = models.CharField(max_length=64, empty=False)
    
	def __unicode__(self):
		return(self.name)

