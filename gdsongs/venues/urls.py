from django.conf.urls import include, url
from . import views

urlpatterns = [
	url(r'^all_venues/$', views.allVenues, name='all_venues'),
	url(r'^(?P<venue_id>[0-9]+)/$', views.singleVenue, name='single_venue'),
    # ajax calls
	url(r'^get_cities/$', views.getCities, name='get_cities'),
	url(r'^get_country_cities/$', views.getCountryCities, name='get_country_cities'),
	url(r'^get_venues/$', views.getVenues, name='get_venues'),
	url(r'^add_new_venue/$', views.addNewVenue, name='add_new_venue'),
]

