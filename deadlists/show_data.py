#!/usr/bin/python

# class definitions for gd shows

days	= ['E','1st','2nd','3rd','4th','5th','6th','7th','8th','9th','10th','11th','12th','13th','14th','15th','16th',
		   '17th','18th','19th','20th','21st','22nd','23rd','24th','25th','26th','27th','28th','29th','30th','31st']
months	= ['E', 'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec']
times	= ['First Show', 'Second Show', 'Third Show']

class Song(object):
	def __init__(self, name, transition):
		self._id = None
		self.name = name
		self.transition = transition
		self.length = 0
		
	def getJson(self):
		if(self._id == None):
			new_id = 0
		else:
			new_id = self._id
		return({'id':new_id, 'trans':self.transition, 'length':self.length})

class Set(object):
	def __init__(self, order, songs):
		self.order = order
		# songs is harder
		# it is a list of hashes, we need name and sequed
		self.songs = []
		for i in songs:
			if(i[':segued'] == False):
				transition = False
			else:
				transition = True
			self.songs.append(Song(i[':name'], transition))

	def getJson(self):
		return({'order':self.order, 'songs':[x.getJson() for x in self.songs]})

class Show(object):
	def __init__(self, date, show):
		self.uid = show[':uuid']
		self.storeDate(date)
		self.checkDates(show)
		self.storeShow(show)
		self.getSets(show)
		self.number = 0
	
	def convertDate(self):
		day = str(self.day)
		if(len(day) == 1):
			day = '0' + day
		month = str(self.month)
		if(len(month) == 1):
			month = '0' + month
		year = str(self.year)[2:]
		return('{0}-{1}-{2}'.format(year, month, day))
	
	def getLocation(self):
		return('%s, %s' % (self.venue, self.city))
	
	def storeDate(self, date):
		# day / month / year stored as their literal value,
		# i.e. 3rd June 1993 is  3 - 6 - 1993
		dates = date.split('/')
		# dates[0] = year, dates[1] = month, dates[2] = day
		self.day = int(dates[2])
		self.month = int(dates[1])
		self.year = int(dates[0])
		# possible early late shows, these are split as after the final /
		# so more than 3 data points?
		if(len(dates) > 3):
			self.time = int(dates[3])
		else:
			self.time = 0
	
	def checkDates(self, show):
		"""Check ranges of dates"""
		if(self.day not in range(1, 32, 1)):
			print('Day wrong in ' + self.getDate())
			print('  UUID: ' + seld.uid)
		elif(self.month not in range(1, 13, 1)):
			print('Month wrong in ' + self.getDate())
			print('  UUID: ' + seld.uid)
		elif(self.year not in range(1965, 1996, 1)):
			print('Year wrong in ' + self.getDate())
			print('  UUID: ' + seld.uid)	
	
	def __old_cmp__(self, other):
		"""Compare the dates for a sort"""
		# no date should be equal, so never return 0
		# if other is earlier, then return 1, else return -1
		earlier = False
		if(other.year == self.year):
			# check month
			if(other.month == self.month):
				# check day
				if(other.day == self.day):
					# check time
					if(other.time == self.time):
						# this is an error
						raise Exception('Dates are equal')
					elif(other.time < self.time):
						earlier = True
				elif(other.day < self.day):
					earlier = True
			elif(other.month < self.month):
				earlier = True
		elif(other.year < self.year):
			earlier = True
		if(earlier == True):
			return(1)
		return(-1)
	
	def getDate(self):
		"""Return date as 3rd Jun 1990 format"""
		date_string = str(days[self.day]) + ' ' + str(months[self.month]) + ' ' + str(self.year)
		if(self.time != 0):
			date_string += ' ' + times[self.time]
		return(date_string)
	
	def storeShow(self, show):
		self.venue = show[':venue']
		self.country = show[':country']
		self.state = show[':state']
		self.city = show[':city']

	def getSets(self, show):
		self.sets = []
		order = 1
		for i in show[':sets']:
			# these are in order from the file
			self.sets.append(Set(order, i[':songs']))
			order += 1

	def getJson(self):
		new_sets = []
		for i in self.sets:
			new_sets.append([x.getJson() for x in i])
		return({'venue':self.venue,
				 'country':self.country,
				 'state':self.state,
				 'city':self.city,
				 'day':self.day,
				 'month':self.month,
				 'year':self.year,
				 'sets':new_sets})

