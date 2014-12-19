#!/usr/bin/env python

import sys
import socket
import struct
import logging
import urllib,httplib


NET_DRIVER = 'eth0'
OMSERVER_ADDRESS = '127.0.0.1'
CONNECT_TIMEOUT = 3

socket.setdefaulttimeout(CONNECT_TIMEOUT)

logging.basicConfig(level=logging.DEBUG,
                    format='%(asctime)s [%(levelname)s] %(message)s',
                    filename=sys.path[0]+'omsys.log',
                    filemode='a')

if len(sys.argv) < 6:
    logging.error('history not configured in /etc/profile')
    sys.exit()


def get_local_ip(ethname):
    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        addr = fcntl.ioctl(sock.fileno(),0x8915,struct.pack('256s',ethname))
    except Exception,e:
        logging.error('get localhost ip address error:'+str(e))
        return '127.0.0.1'


def pull_history(http_get_param=''):
    try:
        http_client = httplib.HTTPConnection(OMSERVER_ADDRESS, 80, timeout=CONNECT_TIMEOUT)
        http_client.request('GET',http_get_param)
        response = http_client.getresponse()

        if response.status != 200:
            logging.error('response http status error:'+str(response.status))
            sys.exit()
        http_content = response.read().strip()
        if http_content != 'OK':
            logging.error('response http content error:'+str(http_content))
            sys.exit()

    except Exception,e:
        logging.error('connection django-cgi server error:'+str(e))
        sys.exit()
    finally:
        if http_client:
            http_client.close()
        else:
            logging.error('connection django-cgi server unkown error.')
            sys.exit()


sys_ip =get_local_ip(NET_DRIVER) 
sys_user = sys.argv[2]
hist_id = sys.argv[1]
hist_date = sys.argv[3]
hist_time = sys.argv[4]
hist_command = ''

for i in range(5,len(sys.argv)):
    hist_command+= sys.argv[i]+' '


uri = 'omaudit/omaudit_pull/?hist_id=%s&sys_ip=%s&sys_user=%s&hist_datetime=%s&hist_command=%s' % (hist_id,sys_ip,sys_user,hist_date+urllib.quote(' ')+hist_time,urllib.quote(hist_command.strip()))
pull_history(uri)
