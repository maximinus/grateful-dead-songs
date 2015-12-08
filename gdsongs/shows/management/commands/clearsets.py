from django.core.management.base import BaseCommand, CommandError
from songs.models import Song

from shows.models import PlayedSongs, PlayedSets, Shows, ShowDate

from song_list import songs

class Command(BaseCommand):
	help = 'Remove all PlayedSongs, PlayedSets and Shows from the database'
	
	def handle(self, *args, **options):
		# get numbers
		dates = len(ShowDate.objects.all())
		shows = len(Shows.objects.all())
		sets = len(PlayedSets.objects.all())
		songs = len(PlayedSongs.objects.all())
		# remove backwards
		PlayedSongs.objects.all().delete()
		PlayedSets.objects.all().delete()
		ShowDate.objects.all().delete()
		Show.objects.all().delete()
		print('Deleted {0} shows, {1} sets, {3} shows and {4} dates.'.format(songs, sets, shows, dates))

