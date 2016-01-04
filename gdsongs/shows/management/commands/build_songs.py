from django.core.management.base import BaseCommand, CommandError
from django.conf import settings

from shows.models import PlayedSong
from songs.models import Song

import os, json

FILENAME = 'templates/auto/json/{0}.json'

# change this to make longer data tables
MAXIMUM_TABLE_LENGTH = 5

class SongInformation(object):
	def __init__(self, song, all_years):
		self.song = song
		self.all = PlayedSong.objects.filter(song=song)
		self.played = len(self.all)
		self.longest = self.getLongest()
		self.shortest = self.getShortest()
		self.before = self.getBefore()
		self.after = self.getAfter()
		self.years = self.getYears()
		self.years_percent = self.getPercent(all_years)

	def getLongest(self):
		# zip up a list of [length, played song] and then sort them
		zipped = [[x.length, x.serialize()] for x in self.all if x.length != 0]
		return(sorted(zipped, key=lambda x:x[0])[:MAXIMUM_TABLE_LENGTH])

	def getShortest(self):
		zipped = [[x.length, x.serialize()] for x in self.all if x.length != 0]
		zipped = sorted(zipped, key=lambda x:x[0])
		zipped.reverse()
		return(zipped[:MAXIMUM_TABLE_LENGTH])

	def getNextTo(self, order, reverse=False):
		# this is a slightly tricky one. We need to find the index of the song and then the one near it
		songs_next_to = []
		for i in self.all:
			try:
				song = PlayedSong.objects.get(played_set=i.played_set, order=i.order-1)
				songs_next_to.append(song)
			except PlayedSong.DoesNotExist:
				pass
		# now we have a list, arrange in buckets
		buckets = {}
		for i in songs_next_to:
			if i.id not in buckets:
				buckets[i] = 1
			else:
				buckets[i] += 1
		return(sorted([[x.serialize(), buckets[x]] for x in buckets.iterkeys()], key=lambda x:x[1])[:MAXIMUM_TABLE_LENGTH])

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

	def renderJSON(self):
		# now we have to translate the info into the json
		data = {'name':self.song.name,
				'played':self.played,
				'longest':self.longest,
				'shortest':self.shortest,
				'before':self.before,
				'after':self.after,
				'years':self.years,
				'years_percent':self.years_percent}
		data = json.dumps(data, sort_keys=True, indent=4, separators=(',', ': '))
		json_file = open(os.path.join(settings.BASE_DIR, FILENAME.format(self.song.songUrl())), 'w')
		json_file.write(data)
		json_file.close()

class Command(BaseCommand):
	help = 'Build the pages for each song'
	
	def getAllSongs(self):
		songs = set([x.song for x in PlayedSong.objects.all()])
		return(list(songs))

	def handle(self, *args, **options):
		# we need to calculate a sum of all songs for every year
		all_years = [0 for x in range(31)]
		for i in PlayedSong.objects.all():
			if(i.year != 0):
				all_years[i.year - 1965] += 1
		for i in self.getAllSongs():
			page = SongInformation(i, all_years)
			page.renderJSON()
