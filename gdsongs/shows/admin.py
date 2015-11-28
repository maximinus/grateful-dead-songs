from django.contrib import admin
from .models import ShowDate, Show, PlayedSet, PlayedSong

admin.site.register(ShowDate)
admin.site.register(Show)
admin.site.register(PlayedSet)
admin.site.register(PlayedSong)

