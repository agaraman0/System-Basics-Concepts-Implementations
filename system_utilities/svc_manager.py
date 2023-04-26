"""
A tool to manage system services like starting, stopping, and 
restarting them. Here's an example code:
"""

import subprocess

service_name = 'apache2'
action = 'start'

subprocess.run(['sudo', 'systemctl', action, service_name])

