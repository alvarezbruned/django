from django.conf.urls import  include, url

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = [
  ##   url(r'^', include(site.urls)),
  ##   url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework'))]
     url(r'^admin/', include(admin.site.urls)),
    ]
##urlpatterns = patterns('',
##    # Examples:
##    # url(r'^$', 'myproject.views.home', name='home'),
##    # url(r'^myproject/', include('myproject.foo.urls')),
##
##    # Uncomment the admin/doc line below to enable admin documentation:
##    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),
##
##    # Uncomment the next line to enable the admin:
##    url(r'^admin/', include(admin.site.urls)),
##)

