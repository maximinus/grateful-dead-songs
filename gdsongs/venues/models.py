from django.db import models

import locations

class Venue(models.Model):
	name = models.CharField(max_length=64, blank=False)
	city = models.CharField(max_length=64, blank=False)
	state = models.IntegerField(choices=locations.getStateCodes())
	country = models.IntegerField(choices=locations.getCountryCodes())
	longitude = models.DecimalField(max_digits=10, decimal_places=7, null=True)
	latitude = models.DecimalField(max_digits=10, decimal_places=7, null=True)

	def __unicode__(self):
		return(self.fullname)
	
	@property
	def fullname(self):
		if(self.state > -1):
			# inside USA
			return('{0}, {1}, {2}'.format(self.name, self.city, locations.getStateName(self.state)))
		else:
			return('{0}, {1}, {2}'.format(self.name, self.city, locations.getCountryName(self.country)))

	@property
	def google_link(self):
		"""Return a link to google or an error message"""
		if((self.longitude == None) or (self.latitude == None)):
			return('<em>No location information avaliable</em>')
		else:
			link = '<em><a href="http://maps.google.com/?q={0},{1}">Show on Google maps</a></em>'
			return(link.format(self.longitude, self.latitude))

	@property
	def state_name(self):
		return(locations.getStateName(self.state))
	
	@property
	def country_name(self):
		return(locations.getCountryName(self.country))

