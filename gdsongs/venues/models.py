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
			return('{0}, {1}, {2}'.format(self.name, self.city, locations.getStateCode(self.state)))
		else:
			return('{0}, {1}, {2}'.format(self.name, self.city, locations.getCountry))

