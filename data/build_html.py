#!/usr/bin/python

from song_list import songs

FILENAME = '../songs/base_song_file.html'
FILE_LOCATION = '../songs/'
SONG = 'SONG_NAME'
FILE = 'SONG_FILE'

def convertSongName(name):
	"""The javascript code expects the name a certain way
	   Convert to lower case and accept only [a-z0-9]
	   Return the new name"""
	lowercase = name.lower()
	new_name =''
	for i in lowercase:
		if(i.isalnum()):
			new_name += i
	return(new_name)

def buildData(html):
	for i in songs:
		copy = html.replace(SONG, i)
		copy = copy.replace(FILE, convertSongName(i))
		# save the new file
		song_file = open(FILE_LOCATION + convertSongName(i) + '.html', 'w')
		song_file.write(copy)
		song_file.close()

if __name__ == '__main__':
	song_file = open(FILENAME, 'r')
	html_file = song_file.read()
	song_file.close()
	buildData(html_file)

