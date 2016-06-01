from django.test import TestCase

class TestAllUrls(TestCase):
	fixtures = ['fixtures/testdata.json']

	def setUp(self):
		pass

	# tests below are pages for all users
	def test_homepage(self):
		response = self.client.get('/')
		self.assertEqual(response.status_code, 200)

	def test_shows_all_shows(self):
		pass

	def test_shows_XX(self):
		pass

	def test_songs_all_songs(self):
		pass

	def test_songs_XX(self):
		pass

	def test_venues_all_venues(self):
		pass

	def test_venues_XX(self):
		pass

	def test_tours_all_tours(self):
		pass

	# tests below are for logged in users
	def test_database_backup(self):
		pass

	def test_shows_add_show(self):
		pass

	def test_shows_edit_shows(self):
		pass

	def test_logout_user(self):
		pass

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
