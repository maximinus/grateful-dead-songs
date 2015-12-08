from django.core.management.base import BaseCommand, CommandError
from songs.models import Song

from shows.models import PlayedSong, PlayedSet, Show, ShowDate

class Command(BaseCommand):
	help = 'Remove all PlayedSongs, PlayedSets and Shows from the database'
	
	def handle(self, *args, **options):
		# get numbers
		dates = len(ShowDate.objects.all())
		shows = len(Show.objects.all())
		sets = len(PlayedSet.objects.all())
		songs = len(PlayedSong.objects.all())
		# remove backwards
		PlayedSong.objects.all().delete()
		PlayedSet.objects.all().delete()
		ShowDate.objects.all().delete()
		Show.objects.all().delete()
		print('Deleted {0} songs, {1} sets, {2} shows and {3} dates.'.format(songs, sets, shows, dates))

