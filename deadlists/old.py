#!/usr/bin/python

# old routines

# code above to extract all data and merge it

def songsAsJson(songs):
	print(json.dumps(songs, indent=4, separators=(',', ': ')))

def matchSongList(double, single):
	final_matches = []
	misses = []
	# we just have a list of songs that should match output it
	for i in double:
		# is there a match between songs?
		if(single.count(i[0])):
			final_matches.append(i)
		elif(single.count(i[1])):
			final_matches.append(i)
		else:
			misses.append(i)
	# to get the other misses, we brute force
	check_a = [x[0] for x in double]
	check_b = [x[1] for x in double]
	single_misses = []
	for i in single:
		if(check_a.count(i) == 0):
			# not in a, check b:
			if(check_b.count(i) == 0):
				# found a single not anywhere
				single_misses.append(i)
	#songsAsJson(final_matches)
	print '-----'
	for i in misses:
		print i
	print '-----'
	for i in single_misses:
		print i

def getAllSongs(dl_songs, database):
	songs = []
	for i in dl_songs:
		songs.append([i.name, i.abbr])
	all_songs = set()
	for i in database:
		if i.sets == []:
			continue
		for j in i.sets:
			# grab all songs
			for k in j.songs:
				all_songs.add(k.name)
	# now we have all the songs, we need to match them up
	matchSongList(songs, list(all_songs))
	return(songs)

