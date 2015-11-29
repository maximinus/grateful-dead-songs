from django.conf.urls import include, url
from . import views

urlpatterns = [
    url(r'^all_tours/$', views.allTours, name='all_tours'),
    url(r'^(?P<tour_id>[0-9]+)/$', views.singleTour, name='single_tour'),
]

