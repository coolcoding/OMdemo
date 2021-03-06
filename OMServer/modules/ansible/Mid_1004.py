#-*- coding: utf-8 -*-
from Public_lib import *

class Modulehandle():

    def __init__(self,moduleid,hosts,param):
        self.hosts = target_host(hosts)
        self.runnerRes = ''
        self.moduleid = moduleid
        self.sys_param_array = param

    def run(self):
        try:
            self.runnerRes = ansible.runner.Runner(
                pattern = self.hosts,
                forks = FORKS,
                module_name = 'command',
                module_args = '/sbin/lsmod',).run()
            if len(self.runnerRes['dark']) == 0 and len(self.runnerRes['contacted']) == 0:
                return 'no hosts found,请确认已经添加ansible环境'
        except Exception,e:
            return str(e)
        return self.runnerRes
        

