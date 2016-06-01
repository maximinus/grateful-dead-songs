from django.test import TestCase

import json

from songs.management.commands.song_list import songs
from songs.models import Song
from venues.models import Venue

class ShowInputTestCase(TestCase):
	def setUp(self):
		# load all the songs into the DB
		for i in songs:
			foo = Song(name=i[0])
			foo.save()
		# must also add a venue
		foo = Venue(name='test', city='test', state=4, country=0)
		foo.save()

	def test_ajax_get_no_data(self):
		"""A get from this address should be a 404"""
		response = self.client.get('/shows/upload_show/')
		self.assertEqual(response.status_code, 404)

	def test_ajax_post_no_data(self):
		"""A get from this address should be a 404"""
		response = self.client.post('/shows/upload_show/')
		self.assertEqual(response.status_code, 404)

	def test_ajax_post_incomplete_data(self):
		data = {'set1':[]}
		response = self.client.post('/shows/upload_show/', data, **{'HTTP_X_REQUESTED_WITH': 'XMLHttpRequest'})
		self.assertEqual(response.status_code, 404)
	
	def test_ajax_post_empty_data(self):
		data = {'set1':[],'set2':[],'set3':[],'set4':[],'day':'1','month':'1','year':'1','encore':[]}
		response = self.client.post('/shows/upload_show/', data, **{'HTTP_X_REQUESTED_WITH': 'XMLHttpRequest'})
		self.assertEqual(response.status_code, 404)

	def test_ajax_send_all_songs(self):
		"""Generate all songs and try one at a time"""
		# it must be said that most of the complexity of this code comes from the simple
		# fact that testing ajax with django is a bit fiddly and error-prone
		empty = json.dumps([])
		encore = json.dumps([False, False, False, False])
		data = {'set2':empty,'set3':empty,'set4':empty,'day':'1','month':'1','year':'1972','encore':encore}
		worked = 0
		for i in Song.objects.all():
			data['set1'] = json.dumps([[str(i.id), '', 120, '']])
			response = self.client.post('/shows/upload_show/', data, **{'HTTP_X_REQUESTED_WITH': 'XMLHttpRequest'})
			try:
				self.assertEqual(response.status_code, 200)
				worked += 1
			except AssertionError:
				print('Failed on song {0}.'.format(i.name))
				print('Worked on previous {0} songs.'.format(worked))
				raise AssertionError
