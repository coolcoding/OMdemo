# -*- coding: utf-8 -*-
# Create your views here.
from django.http import HttpResponse
from django.shortcuts import render_to_response
from autoadmin.models import ModuleList,ServerList,ServerAppCateg,ServerFunCateg
from django.core.paginator  import Paginator,InvalidPage,EmptyPage




def index(request):
    d = {'sys_name': 'python auto operation system'}
    return render_to_response('autoadmin/index.html', d)



def module_list(request):
    module_id = '-1'
    module_name = u'请选择功能模块....'
    ModuleObj = ModuleList.objects.order_by('id')
    for obj in ModuleObj:
        module_id+=','+str(obj.id)
        module_name+=','+obj.module_name
    module_list_str =  module_name +'|'+ module_id
    return HttpResponse(module_list_str)
        

def module_info(request):
    if not 'Module_Id' in request.GET:
        Module_Id = ""
    else:
        Module_Id = request.GET['Module_Id']
    ModuleObj = ModuleList.objects.get(id = Module_Id)
    module_info_str = str(ModuleObj.id)+"@@"+ModuleObj.module_name+"@@"+ModuleObj.module_caption+'@@'+ModuleObj.module_extend
    return HttpResponse(module_info_str)
    
def server_fun_categ(request):
    categ_id = '-1'
    categ_name = u'请选择功能类别'
    ModelObj = ServerFunCateg.objects.all()
    for obj in ModelObj:
        categ_id+=','+str(obj.id)
        categ_name+=','+obj.server_categ_name
    server_fun_categ_str = categ_name +'|'+ categ_id
    return HttpResponse(server_fun_categ_str)
    
    


def server_app_categ(request):
    server_app_id = '-1'
    server_app_name = u'请选择应用实例'
    if not 'fun_categId' in request.GET:
        fun_categId = ''
    else:
        fun_categId = request.GET['fun_categId']
    modelObj = ServerAppCateg.objects.filter(server_categ_id=fun_categId)
    for obj in modelObj:
        server_app_id+=','+str(obj.id)
        server_app_name+=','+obj.app_categ_name
    server_app_str = server_app_name +'|'+ server_app_id
    return HttpResponse(server_app_str)


def server_list(request):
    ip = ''
    ip_host = ''
    if not 'app_categId' in request.GET:
        app_categId = ''
    else:
        app_categId = request.GET['app_categId']
    ServerListObj = ServerList.objects.filter(server_app_id=app_categId)
    for obj in ServerListObj:
        ip+=','+obj.server_lip
        ip_host+=','+obj.server_lip+'*'+obj.server_name
    server_list_str = ip[1:] +'|'+ ip_host[1:]
    return HttpResponse(server_list_str)



def module_run(request):
    import rpyc
    try:
        conn = rpyc.connect(host='127.0.0.1', port=11511)
        conn.root.login('OMuser','123456')
    except Exception,e:
        logger.error('connect rpyc server error:'+str(e))
        return HttpResponse('connect rpyc server error:'+str(e))

    return HttpResponse(request.GET.items())


