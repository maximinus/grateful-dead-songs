from django.conf.urls import include, url
from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    url(r'^$', 'gdsongs.views.index', name='index'),
    
    # test song display
    url(r'^table/', 'gdsongs.views.showSong', name='show_song'),

    # admin
    url(r'^admin/', include(admin.site.urls)),
    
    # app views
    url(r'^songs/', include('songs.urls')),
    url(r'^venues/', include('venues.urls')),
    url(r'^tours/', include('tours.urls')),
    url(r'^shows/', include('shows.urls')),

    # login views
    url(r'^accounts/login/', 'gdsongs.views.loginUser', name='login_user'),
    url(r'^login_user/', 'gdsongs.views.checkLogin', name='check_login'),
    url(r'^logout_user/', 'gdsongs.views.logoutUser', name='logout_user'),

    # database backup
    url(r'^database/backup/', 'gdsongs.views.databaseBackup', name='database_backup'),

    # debug pages that will return 404 if not in debug mode
    url(r'^test_static/', 'gdsongs.views.testStatic', name='test_static'),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

admin.site.site_header = 'Grateful Dead Songs'
