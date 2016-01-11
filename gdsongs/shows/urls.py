from django.conf.urls import include, url
from . import views

urlpatterns = [
	url(r'^all_shows/$', views.allShows, name='all_shows'),
	url(r'^add_show/$', views.addShow, name='add_show'),
    url(r'^(?P<show_id>[0-9]+)/$', views.singleShow, name='single_show'),
    url(r'^upload_show/$', views.uploadShow, name='upload_show'),
    url(r'^edit_shows/$', views.editShows, name='edit_shows'),
    url(r'^edit_shows/(?P<year>[0-9]+)/$', views.editYearShows, name='edit_shows_year'),
    url(r'^edit/(?P<show_id>[0-9]+)/$', views.editSingleShow, name='edit_single_show'),
]
