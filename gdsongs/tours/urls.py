from django.conf.urls import include, url
from . import views

urlpatterns = [
	# add the REST calls
	url(r'^rest/$', views.TourList.as_view()),
    url(r'^rest/(?P<pk>[0-9]+)/$', views.TourDetail.as_view()),
    url(r'^all_tours/$', views.allTours, name='all_tours'),
    url(r'^(?P<tour_id>[0-9]+)/$', views.singleTour, name='single_tour'),
]
