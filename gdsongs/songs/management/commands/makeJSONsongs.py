from django.core.management.base import BaseCommand, CommandError
from songs.models import Song

from song_list import songs

class Command(BaseCommand):
	help = 'Adds all songs to database'
	
	def handle(self, *args, **options):
		# use the databse to generate all songs and output a javascript file
		# first open the file and dump the first parts
		
		songs = Song.objects.all()
		if(len(songs) == 0):
			print('No songs in database')
			return
		
		js_file = open('songs.js','w')
		js_file.write('"use strict";\n\n')
		js_file.write('var SONGS = ["{0}",\n'.format(songs[0].name))
		for song in songs[1:len(songs) - 1]:
			js_file.write('\t\t\t "{0}",\n'.format(song.name))
		js_file.write('\t\t\t "{0}"];\n\n'.format(songs[len(songs) - 1].name))
		js_file.close()

		

		
