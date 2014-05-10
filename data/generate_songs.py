#!/usr/bin/python

# generate list of unique songs

import pickle
from show_data import *

from extract import FILENAME

def generateSongs(shows):
	# go along all songs looking for unique names. Dump them into a set
	songs = set()
	for i in shows:
		for j in i.sets:
			for k in j.songs:
				songs.add(k.name)
	# now we have all the songs
	sort_songs = [x for x in songs]
	sort_songs.sort()
	# now generate the text
	generateOutput(sort_songs)

def generateOutput(sort_songs):
	print '#!/usr/bin/python'
	print
	print 'songs = ["' + sort_songs[0] + '",',
	for i in sort_songs[1:]:
		print '\n         "' + i + '",',
	print ']'
	print

if __name__ == '__main__':
	data_file = open(FILENAME, 'rb')
	shows = pickle.load(data_file)
	generateSongs(shows)

