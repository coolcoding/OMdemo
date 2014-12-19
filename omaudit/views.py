from django.http import HttpResponse
from omaudit.models import ServerHistory




def omaudit_pull(request):

    if request.method != 'GET':
        return HttpResponse('failed!')
        
    val = dict(history_id='',history_ip='',history_user='',history_datetime='',history_command='')

    for k, v in val.iteritems():
        val[k] = request.GET.get(k,v)
    
    for k, v in val.iteritems():
        if not val[k]:
            pass
            return HttpResponse(k+" null")

    ServerHistoryObj = ServerHistory(','.join(['%s=%s' % (k,v) for k, v in val.iteritems()]))

    try:
        ServerHistoryObj.save()
    except Exception,e:
        return HttpResponse('入库失败'+str(e))

    return HttpResponse('OK')
