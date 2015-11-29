from django.shortcuts import render, get_object_or_404

from songs.models import Song

def allSongs(request):
	"""Sort all songs alphabetically and display"""
	songs = Song.objects.all().order_by('name')
	context = {'songs':songs, 'number':len(songs)}
	return(render(request, 'songs/index.html', context))

def singleSong(request, song_id):
	"""Show one song"""
	song = get_object_or_404(Song, pk=int(song_id))
	return(render(request, 'songs/single.html', {'song':song}))

