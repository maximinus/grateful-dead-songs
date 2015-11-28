from django.conf.urls import include, url
from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    url(r'^$', 'gdsongs.views.index', name='index'),
    url(r'^admin/', include(admin.site.urls)),
    
    # app views
    url(r'^songs/', include('songs.urls')),

    # debug pages that will return 404 if not in debug mode
    url(r'^test_static/', 'gdsongs.views.testStatic', name='test_static'),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

admin.site.site_header = 'Grateful Dead Songs'

