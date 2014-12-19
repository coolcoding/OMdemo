from django.conf.urls import patterns, include, url

urlpatterns = patterns('omaudit.views',
     url(r'^$', 'index'),
     url(r'omaudit_pull/$', 'omaudit_pull'),
     url(r'omaudit_run/$', 'omaudit_run'),
)
