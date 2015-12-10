from django.test import TestCase

from songs.management.commands.song_list import songs
from songs.models import Song

class ShowInputTestCase(TestCase):
	def setUp(self):
		# load all the songs into the DB
		for i in songs:
			foo = Song(name=i[0])
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
		data = {'set1':[],'set2':[],'set3':[],'set4':[],'day':'1','month':'1','year':'1972','encore':[False]}
		worked = 0
		for i in songs:
			data['set1'] = [i[0]]
			response = self.client.post('/shows/upload_show/')
			try:
				self.assertEqual(response.status_code, 200)
				worked += 1
			except AssertionError:
				print('Failed on song {0}.'.format(i[0]))
				print('Worked on previous {0} songs.'.format(worked))
				raise AssertionError

