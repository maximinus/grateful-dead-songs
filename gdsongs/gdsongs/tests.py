from django.test import TestCase
from django.contrib.auth.models import User

from shows.models import Show
from songs.models import Song
from venues.models import Venue

class TestAllUrls(TestCase):
	fixtures = ['fixtures/testdata.json']

	def setUp(self):
		self.user = User.objects.create_user('test', password='test')

	def login(self):
		self.client.login(username='test', password='test')

	# tests below are pages for all users
	def test_homepage(self):
		response = self.client.get('/')
		self.assertEqual(response.status_code, 200)

	def test_shows_all_shows(self):
		response = self.client.get('/shows/all_shows/')
		self.assertEqual(response.status_code, 200)

	def test_shows_XX(self):
		# get a single show and test it
		test_show = Show.objects.all()[0]
		response = self.client.get('/shows/{0}/z'.format(str(test_show.id)))
		self.assertEqual(response.status_code, 200)

	def test_songs_all_songs(self):
		response = self.client.get('/songs/all_songs/')
		self.assertEqual(response.status_code, 200)

	def test_songs_XX(self):
		test_song = Song.objects.all()[0]
		response = self.client.get('/songs/{0}/'.format(str(test_song.id)))
		self.assertEqual(response.status_code, 200)

	def test_venues_all_venues(self):
		response = self.client.get('/venues/all_venues/')
		self.assertEqual(response.status_code, 200)

	def test_venues_XX(self):
		test_venue = Venue.objects.all()[0]
		response = self.client.get('/venues/{0}/'.format(str(test_venue.id)))
		self.assertEqual(response.status_code, 200)

	def test_tours_all_tours(self):
		response = self.client.get('/tours/all_tours/')
		self.assertEqual(response.status_code, 200)

	# tests below are for logged in users, so we need to test each twice
	def test_database_backup_logged_in(self):
		self.login()
		response = self.client.get('/database/backup/')
		self.assertEqual(response.status_code, 200)

	def test_shows_add_show_logged_in(self):
		self.login()
		response = self.client.get('/shows/add_show/')
		self.assertEqual(response.status_code, 200)

	def test_shows_edit_shows_logged_in(self):
		self.login()
		response = self.client.get('/shows/edit_shows/')
		self.assertEqual(response.status_code, 200)

	def test_logout_user_logged_in(self):
		self.login()
		response = self.client.get('/shows/add_show/')
		self.assertEqual(response.status_code, 200)

	def test_database_backup_logged_out(self):
		response = self.client.get('/database/backup/')
		self.assertEqual(response.status_code, 404)

	def test_shows_add_show_logged_out(self):
		response = self.client.get('/shows/add_show/')
		self.assertEqual(response.status_code, 404)

	def test_shows_edit_shows_logged_out(self):
		response = self.client.get('/shows/edit_shows/')
		self.assertEqual(response.status_code, 404)

	def test_logout_user_logged_out(self):
		# loggin out should work for everybody
		response = self.client.get('/shows/add_show/')
		self.assertEqual(response.status_code, 200)

	# tests below are for ajax calls not logged in
	def test_login_user(self):
		pass

	# tests below are for ajax calls whilst logged in
	def test_shows_upload_show(self):
		pass

	def test_venues_add_new_venue(self):
		pass

	def test_venues_get_country_cities(self):
		pass

	def test_venues_get_venues(self):
		pass

	def test_venues_add_new_venue(self):
		pass
