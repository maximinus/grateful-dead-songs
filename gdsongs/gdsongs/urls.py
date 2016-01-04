from django.conf.urls import include, url
from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    url(r'^$', 'gdsongs.views.index', name='index'),
    # editing
    url(r'add_show/', 'gdsongs.views.addShow', name='add_show'),
    
    # test song display
    url(r'^table/', 'gdsongs.views.showSong', name='show_song'),

    # admin
    url(r'^admin/', include(admin.site.urls)),
    
    # app views
    url(r'^songs/', include('songs.urls')),
    url(r'^venues/', include('venues.urls')),
    url(r'^tours/', include('tours.urls')),
    url(r'^shows/', include('shows.urls')),

    # debug pages that will return 404 if not in debug mode
    url(r'^test_static/', 'gdsongs.views.testStatic', name='test_static'),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

admin.site.site_header = 'Grateful Dead Songs'

