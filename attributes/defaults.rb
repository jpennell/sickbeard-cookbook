#
# Cookbook Name:: sabnzbd
# Attributes:: default
#

default["sabnzbd"]["user"] = 'sabnzbd'
default["sabnzbd"]["group"] = 'sabnzbd'
default["sabnzbd"]["version"] = '0.7.16'

default["sabnzbd"]["install_dir"] = '/opt/sabnzbd'
default["sabnzbd"]["log_dir"] = '/var/log/sabnzbd'
default["sabnzbd"]["config_dir"] = '/etc/sabnzbd'
default["sabnzbd"]["data_dir"] = '/media/sabnzbd'

default["sabnzbd"]["host"] = '0.0.0.0'
default["sabnzbd"]["port"] = '8080'
