from django.conf.urls import include, url
from . import views

urlpatterns = [
    url(r'^all_venues/$', views.allVenues, name='all_venues'),
    url(r'^(?P<venue_id>[0-9]+)/$', views.singleVenue, name='single_venue'),
]

