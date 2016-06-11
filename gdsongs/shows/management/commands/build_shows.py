from django.core.management.base import BaseCommand, CommandError
from django.conf import settings

from shows.models import PlayedSong, PlayedSet, Show

import os, json

FILENAME = u'templates/auto/shows/{0}.json'

def renderJSON(show_json, show_id):
	# now we have to translate the info into the json
	data = json.dumps(show_json, sort_keys=True, indent=4, separators=(',', ': '))
	json_file = open(os.path.join(settings.BASE_DIR, FILENAME.format(show_id)), 'w')
	json_file.write(data)
	json_file.close()

class Command(BaseCommand):
	help = 'Build the JSON information for each show'

	def handle(self, *args, **options):
		"""Shows are handled by saving their JSON information saved under the id of the date"""
		# get all the shows
		all_shows = Show.objects.all()
		print 'Building...'
		for i in all_shows:
			renderJSON(i.getJSON(), i.id)
		print 'Built {0} shows.'.format(len(all_shows))
