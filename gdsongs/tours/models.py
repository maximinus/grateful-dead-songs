from django.db import models

class Tour(models.Model):
	"""Data for the tours is in the show details"""
	name = models.CharField(max_length=128)
	
	def __unicode__(self):
		return(self.name)
	
	@property
	def total_shows(self):
		return(0)
	
	@property
	def all_shows(self):
		return([])

