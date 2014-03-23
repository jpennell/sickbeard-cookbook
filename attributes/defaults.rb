#
# Cookbook Name:: sabnzbd
# Attributes:: default
#

default["sickbeard"]["user"] = 'sickbeard'
default["sickbeard"]["group"] = 'sickbeard'

default["sickbeard"]["install_dir"] = '/opt/sickbeard'
default["sickbeard"]["log_dir"] = '/var/log/sickbeard'
default["sickbeard"]["config_dir"] = '/etc/sickbeard'

default["sickbeard"]["port"] = '6001'

default["sickbeard"]["git"]["url"] = "https://github.com/midgetspy/Sick-Beard.git"
default["sickbeard"]["git"]["tag"] = "build-503"
