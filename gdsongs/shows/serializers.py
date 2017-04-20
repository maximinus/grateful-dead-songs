#!/usr/bin/python

from rest_framework import serializers
from shows.models import Show

class ShowSerializer(serializers.ModelSerializer):
	class Meta:
		model = Show
		fields = ('id', 'date', 'venue', 'order', 'time_started', 'time_ended')
