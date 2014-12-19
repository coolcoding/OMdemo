from django.conf.urls import patterns, include, url

urlpatterns = patterns('omaudit.views',
     url(r'omaudit_pull/$', 'omaudit_pull'),
)
