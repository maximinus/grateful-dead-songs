#!/usr/bin/python

from songs import *

# take all the songs and remove all duplicates.
# print a list of all the songs
# ones to grab are in the index of the hash, not the key

list_songs = list(set([x for x in songs.values()]))
list_songs.sort()
# now output at text this list
print('// js song file for autocomplete')
print('songs = [' + '"' + list_songs[0]+'"'+',')
for i in list_songs[1:]:
	print('         "' + i + '",')
print('];');
print

