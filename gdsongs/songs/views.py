from django.shortcuts import render, get_object_or_404

from songs.models import Song
from shows.models import getSongData

def allSongs(request):
	"""Sort all songs alphabetically and display"""
	songs = Song.objects.all().order_by('name')
	context = {'songs':songs, 'number':len(songs)}
	return(render(request, 'songs/index.html', context))

def singleSong(request, song_id):
	"""Show one song"""
	song = get_object_or_404(Song, pk=int(song_id))
	data = getSongData(song)
	context = {'song':song,
			   'years': data[0],
			   'songs_into': data[1],
			   'songs_out': data[2]}
	return(render(request, 'songs/single.html', context))
