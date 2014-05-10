#!/usr/bin/python

import pickle
from show_data import *

from extract import FILENAME

# verify the data

# no 2 shows should have the same date
def checkDuplicateDates(shows):
	# simple (ish)
	# make a date string for each show. Does it match any others?
	dates = []
	checks = {}
	for i in shows:
		string = str(i.year) + ':' + str(i.month) + ':' + str(i.day) + ':' + str(i.time)
		# is this in the list already?
		if(dates.count(string) != 0):
			# some error
			print('Date ' + i.date + ' error matches 2 uids:')
			print('  UID1: ' + i.uid)
			print('  UID2: ' + checks[string])
			return
		dates.append(string)
		# add a hash for duplicate testing
		checks[string] = i.uid
	print('Show duplicates passed')

if __name__ == '__main__':
	data_file = open(FILENAME, 'rb')
	shows = pickle.load(data_file)
	checkDuplicateDates(shows)

