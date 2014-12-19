from django.contrib import admin
from OMdemo.autoadmin.models import ModuleList,ServerAppCateg,ServerFunCateg,ServerList

class ModuleListAdmin(admin.ModelAdmin):
    list_display = ('id','module_name','module_caption','module_extend')

class ServerAppCategAdmin(admin.ModelAdmin):
    list_display = ('id','server_categ_id','app_categ_name')

class  ServerFunCategAdmin(admin.ModelAdmin):
    list_display = ('id','server_categ_name')

class ServerListAdmin(admin.ModelAdmin):
    list_display = ('server_name','server_wip','server_lip','server_op','server_app_id')
    


admin.site.register(ModuleList,ModuleListAdmin)
admin.site.register(ServerAppCateg,ServerAppCategAdmin)
admin.site.register(ServerList,ServerListAdmin)
admin.site.register(ServerFunCateg,ServerFunCategAdmin)
