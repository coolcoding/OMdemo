from django.conf.urls import patterns, include, url
from django.contrib import admin
admin.autodiscover()

# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'OMdemo.views.home', name='home'),
    # url(r'^OMdemo/', include('OMdemo.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
     url(r'^admin/', include(admin.site.urls)),
     url(r'^autoadmin/', include('autoadmin.urls')),
     url(r'^omaudit/', include('omaudit.urls')),
     url(r'^$', 'autoadmin.views.index'),
)
