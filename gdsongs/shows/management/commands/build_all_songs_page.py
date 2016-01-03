from django.core.management.base import BaseCommand, CommandError
from django.conf import settings
from django.template.loader import render_to_string

from shows.models import PlayedSong
from songs.models import Song

import os

FILE_NAME = 'all_songs.html'
FILE_LOCATION = 'templates/auto/' + FILE_NAME

class SongInfo(object):
	def __init__(self, song):
		# song is the DB object
		self.name = song.name
		self.id = song.songUrl()
		played = PlayedSong.objects.filter(song=song)
		self.total = str(len(played))
		# order by year and get the first and last years
		years = [x.year for x in played]
		self.start = str(min(years))[2:]
		self.end = str(max(years))[2:]

	def __unicode__(self):
		return(str(self.years) + str(self.id) + str(self.name) + str(self.total))

	@property
	def years(self):
		if(self.start == self.end):
			return('19{0}'.format(self.start))
		else:
			return('{0}-{1}'.format(self.start, self.end))

class Command(BaseCommand):
	help = 'Build the page that lists all the songs'
	
	def getAllSongs(self):
		songs = set([x.song for x in PlayedSong.objects.all()])
		return(list(songs))

	def buildContext(self, songs):
		# make a hash based on the first letter
		ordered = {}
		for i in songs:
			letter = i.name[0].upper()
			if(letter not in ordered):
				ordered[letter] = [i]
			else:
				ordered[letter].append(i)
		# now return as an orderd list of lists
		return({'letters':[{'letter':x, 'songs':ordered[x]} for x in sorted(ordered)]})

	def handle(self, *args, **options):
		all_songs = [SongInfo(x) for x in self.getAllSongs()]
		# we need to order by name, then we can generate
		songs = sorted(all_songs, key=lambda song:song.name)
		context = self.buildContext(songs)
		rendered_html = render_to_string('auto/build/all_songs.html', context=context)
		songs_file = open(os.path.join(settings.BASE_DIR, FILE_LOCATION), 'w')
		songs_file.write(rendered_html)
		songs_file.close()
