from django.core.management.base import BaseCommand, CommandError
from django.conf import settings

from shows.models import PlayedSong
from songs.models import Song

import os

# some defines for the HTML. These should be somewhere else
START_TAG = """{% extends 'base.html' %}\n{% load static %}\n{% block main %}\n\n<h3>All Grateful Dead Songs</h3>\n"""
END_TAG =  "\n{% endblock %}"

LETTER_HEADER = '<h3>{0}</h3>'
SONG_TITLE = '<p><strong>{0}</strong> : <em>{1}:{2}x</em></p>'

FILE_NAME = 'all_songs.html'
FILE_LOCATION = 'templates/auto/' + FILE_NAME

class SongInfo(object):
	def __init__(self, song):
		# song is the DB object
		self.name = song.name
		played = PlayedSong.objects.filter(song=song)
		self.total = len(played)
		# order by year and get the first and last years
		years = [x.year for x in played]
		self.start = str(min(years))[2:]
		self.end = str(max(years))[2:]

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

	def splitForDisplay(self, songs):
		# make a hash based on the first letter
		ordered = {}
		for i in songs:
			letter = i.name[0].upper()
			if(letter not in ordered):
				ordered[letter] = [i]
			else:
				ordered[letter].append(i)
		# now return as an orderd list of lists
		return([[x, ordered[x]] for x in sorted(ordered)])

	def buildFile(self, songs):
		new_file = ''
		songs = self.splitForDisplay(songs)
		for i in songs:
			new_file += LETTER_HEADER.format(i[0]) + '\n'
			for j in i[-1]:
				new_file += SONG_TITLE.format(j.name, j.years(), j.total)
				new_file += '\n'
		return(new_file)

	def handle(self, *args, **options):
		all_songs = [SongInfo(x) for x in self.getAllSongs()]
		# we need to order by name, then we can generate
		songs = sorted(all_songs, key=lambda song:song.name)
		new_file = self.buildFile(songs)
		# just add start and end tags for file here
		total_file = START_TAG + new_file + END_TAG
		songs_file = open(os.path.join(settings.BASE_DIR, FILE_LOCATION), 'w')
		songs_file.write(total_file)
		songs_file.close()
