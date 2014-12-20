#_*_ coding: utf-8 _*_
from django.http import HttpResponse
from django.shortcuts import render_to_response
from omaudit.models import ServerHistory
from django.db import connection
from public import *


def index(request):

    return render_to_response('om/omaudit.html')
    


def omaudit_run(request):

    if not 'LastID' in request.GET:
        LastID = "0"
    else:
        LastID = request.GET['LastID']

    if not 'hosts' in request.GET:
        hosts = ''
    else:
        hosts = request.GET['hosts']

    host_array = target_host(hosts).split(';')

    if LastID == "0":
        if hosts == '':
            ServerHistoryObj = ServerHistory.objects.order_by('-id')[:5]
        else:
            ServerHistoryObj = ServerHistory.objects.filter(history_ip__in=host_array).order_by('-id')[:5]
    else:
        if hosts == '':
            ServerHistoryObj = ServerHistory.objects.filter(id__gt=LastID).order_by('-id')
        else:
            ServerHistoryObj = ServerHistory.objects.filter(id__gt=LastID,history_ip__in=host_array).order_by('-id')

    ServerHistory_str = ''
    lastid = ''
    i = 0
    for e in ServerHistoryObj:
        if i == 0:
            lastid = e.id
        ServerHistory_str+="<font color=#cccccc>"+e.history_ip+ \
                        "</font>&nbsp;&nbsp;\t"+ e.history_user+"&nbsp;&nbsp;\t"+str(e.db_datetime)+"\t # <font color=#ffffff>"+e.history_command+"</font>*"
        i+=1

    ServerHistory_str+='@@'+str(lastid)
    print ServerHistory_str
    return HttpResponse(ServerHistory_str)

def omaudit_pull(request):

    if request.method != 'GET':
        return HttpResponse('failed!')
        
    val = dict(history_id='',history_ip='',history_user='',history_datetime='',history_command='')

    for k, v in val.iteritems():
        val[k] = request.GET.get(k,v)
    
    for k, v in val.iteritems():
        if not val[k]:
            return HttpResponse(k+" null")

#    ServerHistoryObj = ServerHistory(','.join(["%s='%s'" % (k,v) for k, v in val.iteritems()]))
    ServerHistoryObj = ServerHistory(**val)

    try:
        ServerHistoryObj.save()
    except Exception,e:
        return HttpResponse('入库失败'+str(e)+str(s))

    return HttpResponse('OK')
