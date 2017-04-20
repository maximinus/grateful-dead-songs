#!/usr/bin/python

from rest_framework import serializers
from tours.models import Tour

class TourSerializer(serializers.ModelSerializer):
	class Meta:
		model = Tour
		fields = ('id', 'name')
