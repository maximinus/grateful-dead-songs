#!/usr/bin/python

import pickle
from show_data import *
from song_list import songs
from extract import FILENAME

FILE_LOCATION = '../song-data/'

ORDINALS = ['1st', '2nd', '3rd', '4th', '5th']

class Distance(object):
	def __init__(self):
		self.average = 0
		self.longest = 0
		self.shortest = 0
	
	def setAll(self, a, l, s):
		self.average = a
		self.longest = l
		self.shortest = s
	
	def __str__(self):
		string = '  Average:' + str(self.average)
		string += '\n  Longest:' + str(self.longest)
		string += '\n Shortest:' + str(self.shortest)
		return(string)

	def getJson(self, name):
		string = '    "' + name + '_distance":{"short":"'
		string += str(self.shortest) + '", "long":"'
		string += str(self.longest) + '", "average":"'
		string += str(self.average) + '"},'
		return(string)

def getFiveJson(array):
	# len(array) < 6 and > 0
	string = '['
	for i in array:
		string += '{"name":"' + str(i[0]) + '", "number":"' + str(i[1]) + '"}, '
	string += '],'
	return(string)

def getOrderFive(songs):
	string = '['
	for i in songs:
		string += '{"date":"' + str(i[0]) + '", "venue":"' + str(i[1]) + '"}, '
	string += '],'
	return(string)

def getArrayJson(name, array):
	# len(array) != 0
	string = '    "' + name + '":['
	for i in array:
		string += str(i) + ', '
	string += '],'
	return(string)

def adjustSetNames(songs):
	"""Songs is a list of lists in the format [name, number]
	   Look out for names like startX and endX"""
	new_data = []
	for i in songs:
		# start with end or start?
		song = i[0]
		if(song[:len('start')] == 'start'):
			# get the number (must be < 10)
			fixed_name = 'Opened ' + ORDINALS[(int(song[-1]) - 1)] + ' set'
		elif(song[:len('end')] == 'end'):
			fixed_name = 'Closed ' + ORDINALS[(int(song[-1]) - 1)] + ' set'
		else:
			fixed_name = song
		new_data.append([fixed_name, i[1]])
	return(new_data)

# build the data
class SongData(object):
	"""Store all data needed for the display"""
	def __init__(self, shows, name):
		self.name = name
		self.first_five = []
		self.last_five = []
		self.show_distances = Distance()
		self.song_distances = Distance()
		self.total_played = 0
		self.years = []
		self.popular_years = []
		self.top_five_into = []
		self.top_five_out = []
		self.shows = shows

	def convertSongName(self):
		"""The javascript code expects the name a certain way
		   Convert to lower case and accept only [a-z0-9]
		   Return the new name"""
		lowercase = self.name.lower()
		new_name =''
		for i in lowercase:
			if(i.isalnum()):
				new_name += i
		return(new_name)

	def writeJson(self):
		"""output as javascript file"""
		print('Writing to ' + FILE_LOCATION + self.convertSongName() + '.js')
		fileobj = open(FILE_LOCATION + self.convertSongName() + '.js', mode='w')
		strings = ['song = {']
		strings.append('    "name":"' + self.name + '",')
		strings.append('    "total_played":"' + str(self.total_played) + '",')
		strings.append(self.show_distances.getJson('show'))
		strings.append(self.song_distances.getJson('song'))
		strings.append(getArrayJson('years', self.years))
		strings.append(getArrayJson('popular_years', self.popular_years))
		strings.append('    "top_five_into":' + getFiveJson(self.top_five_into))
		strings.append('    "top_five_out":' + getFiveJson(self.top_five_out))
		strings.append('    "first_five":' + getOrderFive(self.first_five))
		strings.append('    "last_five":' + getOrderFive(self.last_five))
		strings.append('}')
		for i in strings:
			fileobj.write(i)
			fileobj.write('\n')
		fileobj.close()

	def generateData(self):
		self.getTotalPlayed()
		self.getFirstFive()
		self.getLastFive()
		self.getYearsPlayed()
		self.getPopularYears()
		self.getDistancesBetweenSongs()
		self.getDistancesBetweenShows()
		self.getTopFiveSandwich()

	def getFirstFive(self):
		for i in self.shows:
			for j in i.sets:
				for k in j.songs:
					if(k.name == self.name):
						self.first_five.append([i.getDate(), i.getLocation()])
						if(len(self.first_five) == 5):
							return

	def getLastFive(self):
		"""Same as getLastFive, just in reverse"""
		for i in reversed(self.shows):
			for j in reversed(i.sets):
				for k in reversed(j.songs):
					if(k.name == self.name):
						self.last_five.append([i.getDate(), i.getLocation()])
						if(len(self.last_five) == 5):
							self.last_five.reverse()
							return
	
	def getTotalPlayed(self):
		for i in self.shows:
			for j in i.sets:
				for k in j.songs:
					if(k.name == self.name):
						self.total_played += 1
	
	def getYearsPlayed(self):
		self.years = [0 for x in range(31)]
		for i in self.shows:
			# still have to check every song :-(
			for j in i.sets:
				for k in j.songs:
					if(k.name == self.name):
						self.years[i.year - 1965] += 1

	def getNumberedSongList(self):
		songs = []
		add = False
		count = 0
		for i in self.shows:
			for j in i.sets:
				for k in j.songs:
					if(k.name == self.name):
						if(add == False):
							# we are at the start
							add = True
					if(add == True):
						songs.append([count, k])
					count += 1
		return(songs)

	def extractVersions(self, all_songs):
		# given all songs, extract only the played versions
		only_played = []
		for i in all_songs:
			if(i[1].name == self.name):
				only_played.append(i)
		return(only_played)

	def getDistancesBetweenSongs(self):
		"""First, count all songs and put in a numbered list"""
		all_songs = self.getNumberedSongList()
		played = self.extractVersions(all_songs)
		# now we have all the number of all played, we can just find the biggest diference
		differences = [(played[x + 1][0] - played[x][0]) for x in range(len(played) -1)]
		# if only one is played, then we can't do the differences
		if(differences == []):
			longest = -1
			shortest = -1
			average = -1.0
		else:
			longest = max(differences)
			shortest = min(differences)
			# average is easy
			distance = float(played[-1][0] - played[0][0])
			average = 1.0 / float(float(self.total_played) / distance)
		self.song_distances.setAll(average, longest, shortest)

	def getDistancesBetweenShows(self):
		# we have all shows, just grab the ones we need, they are already counted
		played_shows = []
		for i in self.shows:
			if(showHasSong(i, self.name)):
				played_shows.append(i)
		# now have all shows. Rest is easy
		differences = [(played_shows[x + 1].number - played_shows[x].number) for x in range(len(played_shows) - 1)]
		if(differences == []):
			longest = -1
			shortest = -1
			average = -1.0
		else:
			longest = max(differences)
			shortest = min(differences)
			# difference between shows?
			distance = float(played_shows[-1].number - played_shows[0].number)
			average = 1.0 / float(float(self.total_played) / distance)
		self.show_distances.setAll(average, longest, shortest)

	def getPopularYears(self):
		"""Store as a % of times played per year"""
		count = [0 for x in range(31)]
		years = [0 for x in range(31)]
		# usual go through all songs
		for i in self.shows:
			for j in i.sets:
				for k in j.songs:
					# count the song
					years[i.year - 1965] += 1
					if(k.name == self.name):
						count[i.year - 1965] += 1
		# now we can find the exact %
		for i in range(31):
			if((count[i] != 0) and (years[i] != 0)):
				# there were some songs, so % is non-zero
				count[i] = float((count[i] * 100.0) / float(years[i]))
		self.popular_years = count

	def getTopFiveSandwich(self):
		# get 5 played before / after
		before = {}
		after = {}
		# search for all songs
		for i in self.shows:
			for j in i.sets:
				# need to count the songs
				for count, k in enumerate(j.songs):
					if(k.name == self.name):
						# right, we have a match
						if(count == 0):
							# start of set
							dstring = 'start' + str(j.order)
							if(dstring not in before):
								before[dstring] = 0
							before[dstring] += 1
						else:
							# add as normal
							song = j.songs[count -1].name
							if(song not in before):
								before[song] = 0
							before[song] += 1
						if(count == len(j.songs) - 1):
							# end of set
							dstring = 'end' + str(j.order)
							if(dstring not in after):
								after[dstring] = 0
							after[dstring] += 1
						else:
							# add as normal
							song = j.songs[count + 1].name
							if(song not in after):
								after[song] = 0
							after[song] += 1
		# now we have 2 hashes of data, sort them out
		# do we have 3 things in each?
		p_before = []
		while((len(p_before) < 5) and (len(before) != 0)):
			# iterate and grab the five
			key = max(before, key=before.get)
			p_before.append([key, before[key]])
			before.pop(key)
		p_after = []
		while((len(p_after) < 5) and (len(after) != 0)):
			key = max(after, key=after.get)
			p_after.append([key, after[key]])
			after.pop(key)
		self.top_five_out = adjustSetNames(p_before)
		self.top_five_into = adjustSetNames(p_after)

	def __str__(self):
		"""Display data"""
		string = self.name + '\n-----------------------\n'
		string += 'Total played: ' + str(self.total_played) + '\n'
		string += 'First Five:\n'
		for i in self.first_five:
			string += '  ' + i + '\n'
		string += '\nLast Five:\n'
		for i in self.last_five:
			string += '  ' + i + '\n'
		string += '\nSong Distances:\n'
		string += str(self.song_distances)
		string += '\n\nShow Distances:\n'
		string += str(self.show_distances)
		# now five into and out
		string += '\n\nTop five before:\n'
		for i in self.top_five_out:
			string += '  ' + str(i[1]) + ' : ' + str(i[0]) + '\n'
		string += '\nTop five after:\n'
		for i in self.top_five_into:
			string += '  ' + str(i[1]) + ' : ' + str(i[0]) + '\n'
		return(string)

def showHasSong(show, song):
	for i in show.sets:
		for j in i.songs:
			if(j.name == song):
				return(True)
	return(False)		

def getSongData(song_name, shows):
	# song is just the name. Get every show with this played
	print(song_name)
	shows_played = []
	for i in shows:
		if(showHasSong(i, song_name)):
			shows_played.append(i)
	# now we have all the shows!
	song = SongData(shows, song_name)
	song.generateData()
	return(song)

def buildData(shows):
	# so we go through every song first
	song_list = [getSongData(x, shows) for x in songs]
	print('Writing to file....')
	for i in song_list:
		i.writeJson()
	#i = getSongData(songs[12], shows)
	#i.writeJson()

if __name__ == '__main__':
	data_file = open(FILENAME, 'rb')
	shows = pickle.load(data_file)
	shows.sort()
	# number all the shows from 1 onwards
	for i in range(len(shows)):
		shows[i].number = i
	buildData(shows)

