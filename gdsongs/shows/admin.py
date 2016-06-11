from django.contrib import admin
from .models import ShowDate, Show, PlayedSet, PlayedSong, OfficalReleaseLink, MusicLink


admin.site.register(ShowDate)
admin.site.register(Show)
admin.site.register(PlayedSet)
admin.site.register(PlayedSong)
admin.site.register(OfficalReleaseLink)
admin.site.register(MusicLink)
