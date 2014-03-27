#
# Cookbook Name:: sabnzbd
# Attributes:: default
#

default["sickbeard"]["user"] = 'sickbeard'
default["sickbeard"]["group"] = 'sickbeard'

default["sickbeard"]["directories"]["install"] = '/opt/sickbeard'
default["sickbeard"]["directories"]["logs"] = '/var/log/sickbeard'
default["sickbeard"]["directories"]["config"] = '/etc/sickbeard'
default["sickbeard"]["directories"]["data"] = '/etc/sickbeard'

default["sickbeard"]["port"] = '6001'

default["sickbeard"]["git"]["url"] = "https://github.com/midgetspy/Sick-Beard.git"
default["sickbeard"]["git"]["tag"] = "master"
