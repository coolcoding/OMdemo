import sys
import ansible.runner

FORKS = 10

def target_host(hosts,target_type='IP'):
    host_string = ''
    if target_type == 'IP':
        for hrow in hosts.split(','):
            host_string+=hrow.split('*')[0]+';'
    elif target_type == 'HN':
        for hrow in hosts.split(','):
            host_string+=hrow.split('*')[1]+';'
    return host_string[:len(host_string)-1]

        
