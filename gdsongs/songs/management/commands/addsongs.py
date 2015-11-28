from django.core.management.base import BaseCommand, CommandError
from songs.models import Song

from song_list import songs

class Command(BaseCommand):
	help = 'Adds all songs to database'
	
	def handle(self, *args, **options):
		# add all songs that do not exist
		newsongs = 0
		for i in songs:
			print('Adding {0}'.format(i[0]))
			try:
				song = Song.objects.get(name=i[0])
				# update the song short name
				song.shortname = i[1]
			except:
				# song does not exist
				song = Song(name=i[0], shortname=i[1])
				newsongs += 1
			song.save()
		print('Added {0} new songs.'.format(newsongs))

		
