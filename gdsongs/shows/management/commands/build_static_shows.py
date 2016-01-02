from django.core.management.base import BaseCommand, CommandError
from songs.models import Song

from shows.models import PlayedSong, PlayedSet, Show, ShowDate

class Command(BaseCommand):
	help = 'Biuld all static shows'
	
	def handle(self, *args, **options):
		pass
