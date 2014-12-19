#-*- coding: utf-8 -*-
from rpyc import Service
from rpyc.utils.server import ThreadedServer
from config import *
import logging
from libraries import *
import os


sysdir = os.path.abspath(os.path.dirname(__file__))
sys.path.append(os.sep.join(sysdir,'modules/'+AUTO_PLATFORM))

class ManageServer(Service):

    def exposed_login(self,user,passwd):
        if user == 'OMuser' and passwd == '123456':
            print user
            self.checkLogin = True
        else:
            self.checkLogin = False

    def exposed_Runcommands(self,get_string):

        logging.basicConfig(level=logging.DEBUG,
                    format='%(asctime)s[%(levelname)s]%(message)s',
                    filename=sys.path[0]+'/logs/omserver.log',
                    filemode='a')
        try:
            if self.checkLogin != True:
                return tencode('User verify failed!', SECRET_KEY)
        except:
            return tencode('Invalid login!', SECRET_KEY)

        self.get_string_array = tdecode(get_string,SECRET_KEY),split('@@')
        self.ModuleId = self.get_string_array[0]
        self.Hosts = self.get_string_array[1]

        sys_param_array = []
        for i in range(2,len(self.get_string_array)-1):
            sys_param_array.append(sys_param_array[i])

        mid = 'Mid_' + self.ModuleId
        importstring = 'from '+mid+' import Modulehandle'

        try:
            exec importstring
        except:
            return tencode('Module '+mid+' dose not exsit!,please add it',SECRET_KEY)

        runobj = Modulehandle(self.ModuleId,self.Hosts,sys_param_array)
        runmsg = runobj.run()

        if AUTO_PLATFORM == 'ansible':
            if type(runmsg) == dict:
                returnString = ansible_transform(runmsg, self.Hosts)
            else:
                returnString = str(runmsg).strip()

        return tencode(returnString,SECRET_KEY)






if __name__ == '__main__':
    s = ThreadedServer(ManageServer, port=11511, auto_register=False)
    s.start()
