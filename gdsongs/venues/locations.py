#!/usr/bin/python

STATES = [['None', 'N/A', -1],
		  ['Alabama', 'AL' ,0],
		  ['Alaska', 'AK',1],
		  ['Arizona', 'AZ', 2],
		  ['Arkansas', 'AR', 3],
		  ['California', 'CA', 4],
		  ['Colorado', 'CO', 5],
		  ['Connecticut', 'CT', 6],
		  ['Delaware', 'DE', 7],
		  ['District of Columbia', 'DC', 8],
		  ['Florida', 'FL', 9],
		  ['Georgia', 'GA', 10],
		  ['Hawaii', 'HI', 11],
		  ['Idaho', 'ID', 12],
		  ['Illinois', 'IL', 13],
		  ['Indiana', 'IN', 14],
		  ['Iowa', 'IA', 15],
		  ['Kansas', 'KS', 16],
		  ['Kentucky', 'KY', 17],
		  ['Louisiana', 'LA', 18],
		  ['Maine', 'ME', 19],
		  ['Maryland', 'MD', 20],
		  ['Massachusetts', 'MA', 21],
		  ['Michigan', 'MI', 22],
		  ['Minnesota', 'MN', 23],
		  ['Mississippi', 'MS', 24],
		  ['Missouri', 'MO', 25],
		  ['Montana', 'MT', 26],
		  ['Nebraska', 'NE', 27],
		  ['Nevada', 'NV', 28],
		  ['New Hampshire', 'NH', 29],
		  ['New Jersey', 'NJ', 30],
		  ['New Mexico', 'NM', 31],
		  ['New York', 'NY', 32],
		  ['North Carolina', 'NC', 33],
		  ['North Dakota', 'ND', 34],
		  ['Ohio', 'OH', 35],
		  ['Oklahoma', 'OK', 36],
		  ['Oregon', 'OR', 37],
		  ['Pennsylvania', 'PA', 38],
		  ['Rhode', 'RI', 39],
		  ['South', 'SC', 40],
		  ['South', 'SD', 41],
		  ['Tennessee', 'TN', 42],
		  ['Texas', 'TX', 43],
		  ['Utah', 'UT', 44],
		  ['Vermont', 'VT', 45],
		  ['Virginia', 'VA', 46],
		  ['Washington', 'WA', 47],
		  ['West', 'WV', 48],
		  ['Wisconsin', 'WI', 49],
		  ['Wyoming', 'WY', 50]]

COUNTRIES = [['USA', 0],
			 ['Canada', 1],
			 ['UK', 2],
			 ['France', 3],
			 ['Germany', 4],
			 ['Denmark', 5],
			 ['Sweden', 6],
			 ['Holland', 7],
			 ['Luxembourg', 8],
			 ['Eygpt', 9],
			 ['Jamaica', 10],
			 ['Unknown', -1]]

def getStateCodes():
	return([[x[2], x[0]] for x in STATES])

def getCountryCodes():
	return([[x[1], x[0]] for x in COUNTRIES])

def getStateName(index):
	if((index >= 0) and (index < len(STATES))):
		return(STATES[index][0])
	else:
		return('State index error')

def getStateCode(index):
	if((index >= 0) and (index < len(STATES))):
		return(STATES[index][1])
	else:
		return('State index error')

def getCountryName(index):
	if((index >= 0) and (index < len(COUNTRIES))):
		return(COUNTRIES[index][0])
	else:
		return('Country index error')

