# -*- coding: utf-8 -*-
# Create your views here.
from django.http import HttpResponse
from django.shortcuts import render_to_response





def index(request):
    d = {'sys_name': 'python auto operation system'}
    return render_to_response('autoadmin/index.html', d)



