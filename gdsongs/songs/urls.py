from django.conf.urls import include, url
from . import views

urlpatterns = [
    url(r'^all_songs/$', views.allSongs, name='all_songs'),
    url(r'^(?P<song_id>[0-9]+)/$', views.singleSong, name='single_song'),
]

