#
# Cookbook Name:: sickbeard
# Recipe:: default
#

include_recipe "bluepill"

package "python-cheetah"

# Set up sabnzbd user
user node['sickbeard']['user'] do
  system true
end

# Create directories
app_dirs = [
  "home/#{node['sickbeard']['user']}",
  "#{node["sickbeard"]["directories"]["install"]}",
  "#{node["sickbeard"]["directories"]["logs"]}",
  "#{node["sickbeard"]["directories"]["config"]}"
]

app_dirs.each do |x|
  directory x do
    mode 0755
    owner node['sickbeard']['user']
    group node['sickbeard']['group']
    recursive true
  end
end

# Checkout sickbeard
git node["sickbeard"]["directories"]["install"] do
  repository node['sickbeard']['git']['url']
  revision node['sickbeard']['git']['revision']
  checkout_branch "master"
  action :sync
  user node['sickbeard']['user']
  group node['sickbeard']['group']
end

# Set up daemon with bluepill
template "#{node['bluepill']['conf_dir']}/sickbeard.pill" do
  source "sickbeard.pill.erb"
  mode 0644
end

bluepill_service "sickbeard" do
  action [:enable, :load, :start]
end
