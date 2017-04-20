#!/usr/bin/python

from rest_framework import serializers
from venues.models import Venue

class VenueSerializer(serializers.ModelSerializer):
	class Meta:
		model = Venue
		fields = ('id', 'name', 'city', 'state', 'country', 'longitude', 'latitude')
