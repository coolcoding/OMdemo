#_*_ coding: utf-8 _*_
from django.http import HttpResponse
from django.shortcuts import render_to_response
from omaudit.models import ServerHistory
from django.db import connection


def index(request):
    return render_to_response('omaudit/index.html')
    


def omaudit_run(request):

    return HttpResponse(request.GET['LastID'])

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
