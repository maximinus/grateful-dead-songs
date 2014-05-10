#!/usr/bin/python

# load the data, and extract it to our data format
import yaml
import pickle
from show_data import *

FILENAME = 'shows.db'

def loadYear(year):
	new_shows = []
	data_file = open('./gdshowsdb/' + year + '.yaml')
	year_data = yaml.load(data_file)
	data_file.close()
	# we should have a dictionary of dates:
	for show, data in year_data.iteritems():
		new_shows.append(Show(show, data))
	return(new_shows)

def pickleData(shows, name):
	# save data
	data_file = open(name, 'wb')
	pickle.dump(shows, data_file, protocol=2)

def loadShows():
	shows = []
	for i in range(1965, 1996):
		shows.extend(loadYear(str(i)))
		print(str(i) + ' -> Done')
	pickleData(shows, FILENAME)

if __name__ == '__main__':
	loadShows()

