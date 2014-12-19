from django.conf.urls import patterns, include, url

urlpatterns = patterns('autoadmin.views',
     url(r'module_list/$', 'module_list'),
     url(r'module_info/$', 'module_info'),
     url(r'server_fun_categ/$', 'server_fun_categ'),
     url(r'server_app_categ/$', 'server_app_categ'),
     url(r'server_list/$', 'server_list'),
     url(r'module_run/$', 'module_run'),
)
