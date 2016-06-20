from django.core.management.base import BaseCommand, CommandError
from django.conf import settings

from shows.models import PlayedSong, PlayedSet, Show

import os, codecs

FILENAME = './static/data/shows/{0}.js'

def writeJSfile(show):
	# now we have to translate the info into the json
	js_file = codecs.open(os.path.join(settings.BASE_DIR, FILENAME.format(show.id)),'w','utf-8')
	js_file.write(u'"use strict";\n\n')

	# now we need to write out all data
	js_file.write(u'var SHOW_DATA = {\n')
	js_file.write(u'\t"venue_name": "{0}",\n'.format(show.venue.fullname))
	js_file.write(u'\t"venue_id": {0},\n'.format(show.venue.id))
	js_file.write(u'\t"show_date": "{0}",\n'.format(show.date))
	js_file.write(u'\t"sets": [\n')
	# now get all the sets played at this show and render them
	for i in PlayedSet.objects.filter(show=show).order_by('order'):
		js_file.write(u'\t\t{{"set_title": "{0}",\n'.format(i.set_text))
		if(i.encore == True):
			encore = 'true'
		else:
			encore = 'false'
		js_file.write(u'\t\t{{"encore": {0},\n'.format(encore));
		# now we have the sets, run through all the songs
		js_file.write(u'\t\t "songs": [\n')
		for j in PlayedSong.objects.filter(played_set=i).order_by('order'):
			js_file.write(u'\t\t\t{{"name": "{0}", "length":"{1}", "trans":"{2}"}},\n'.format(j.song, j.length_string, j.trans))
		js_file.write(u'\t\t]},\n')
	js_file.write(u'\t],\n};\n')

	js_file.close()

class Command(BaseCommand):
	help = 'Build the JSON information for each show'

	def handle(self, *args, **options):
		"""Shows are handled by saving their JSON information saved under the id of the date"""
		# get all the shows
		all_shows = Show.objects.all()
		print 'Building...'
		for i in all_shows:
			writeJSfile(i)
		print 'Built {0} shows.'.format(len(all_shows))
