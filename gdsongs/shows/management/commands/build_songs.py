from django.core.management.base import BaseCommand, CommandError
from django.conf import settings
from django.template.loader import render_to_string

from shows.models import PlayedSong
from songs.models import Song

import os

FILE_LOCATION = 'templates/auto/' + FILE_NAME

# change this to make longer data tables
MAXIMUM_TABLE_LENGTH = 5

class SongInformation(object):
	def __init__(self, song, all_years):
		self.all = PlayedSong.objects.all(song=song)
		self.played = str(len(self.all))
		self.longest = self.getLongest()
		self.shortest = self.getShortest()
		self.before = self.getBefore()
		self.after = self.getAfter()
		self.years = self.getYears()
		self.years_percent = self.getPercent(all_years)

	def getLongest(self):
		# zip up a list of [length, played song] and then sort them
		zipped = [[x.length, x] for x in self.all if x.length != 0]]
		return(sorted(zipped, key=lambda x:x[0])[:MAXIMUM_TABLE_LENGTH]

	def getShortest(self):
		zipped = [[x.length, x] for x in self.all if x.length != 0]]
		zipped = sorted(zipped, key=lambda x:x[0])
		zipped.reverse()
		return(zipped[:MAXIMUM_TABLE_LENGTH])

	def getNextTo(order, reverse=false):
		# this is a slightly tricky one. We need to find the index of the song and then the one near it
		songs_before:
		for i in self.all():
			try:
				song = PlayedSong.objects.get(played_set=i.played_set, order=i.order-1)
				songs_before.append(song_before)
			except DoesNotExist:
				pass
		# now we have a list, arrange in buckets
		buckets = {}
		for i in songs_before:
			if i.id not in buckets:
				buckets[i] = 1
			else:
				buckets[i] += 1
		return(sorted([x, buckets[x] for x im buckets.iterkeys()], lambda x:x[1])[:MAXIMUM_TABLE_LENGTH])

	def getBefore(self):
		return(self.getNextTo(-1))

	def getAfter(self):
		return(self.getNextTo(+1))

	def getYears(self):
		# returns a list of 31 values, for 1965 - 1995
		years = [0 for x in range(31)]
		for i in self.all:
			if(i.year != 0):
				years[i.year - 1965] += 1
		return(years)

	def getPercent(self, all_years):
		percent = []
		for i in range(31):
			if((all_years[i] == 0) or (self.years[0] == 0)):
				percent.append(0)
			else:
				percent.append((self.years[i] / all_years[i]) * 100.0)
		return(percent)


class Command(BaseCommand):
	help = 'Build the pages for each song'
	
	def getAllSongs(self):
		songs = set([x.song for x in PlayedSong.objects.all()])
		return(list(songs))

	def handle(self, *args, **options):
		# we need to calculate a sum of all songs for every year
		all_years = [0 for range(31)]
		for i in PlayedSong.objects.all():
			if(i.year != 0):
				all_years[i.year - 1965] += 1
		for i in self.getAllSongs()
			page = SongInformation(i, all_years)
			page.render()
