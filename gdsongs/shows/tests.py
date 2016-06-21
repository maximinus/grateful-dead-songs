from django.test import TestCase

import json, random

from shows.models import Show, PlayedSet, PlayedSong
from venues.models import Venue

class ShowInputTestCase(TestCase):
	fixtures = ['fixtures/testdata.json']

	def setUp(self):
		pass

	# these tests test some assertions about relationships
	def test_delete_set_deletes_song(self):
		# get a random song
		random_song = random.choice(PlayedSong.objects.all())
		song_id = random_song.pk
		random_set = random_song.played_set
		random_set.delete()
		# now the song should not exist
		self.assertEqual(len(PlayedSong.objects.filter(pk=song_id)), 0)

	def test_delete_show_deletes_set(self):
		random_set = random.choice(PlayedSet.objects.all())
		set_id = random_set.pk
		random_show = random_set.show
		random_show.delete()
		self.assertEqual(len(Show.objects.filter(pk=set_id)), 0)

	def test_delete_show_deletes_song(self):
		random_song = random.choice(PlayedSong.objects.all())
		song_id = random_song.pk
		random_show = random_song.played_set.show
		random_show.delete()
		self.assertEqual(len(PlayedSong.objects.filter(pk=song_id)), 0)
