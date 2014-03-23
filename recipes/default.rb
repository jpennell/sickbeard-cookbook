#
# Cookbook Name:: sabnzbd
# Recipe:: default
#

package "ruby"
package "python-cheetah"
package "python-yenc"
package "python-openssl"
package "par2"
package "unrar"
package "coreutils"
package "util-linux"

# Set up sabnzbd user
user node['sabnzbd']['user'] do
  system true
end

# Create directories
app_dirs = [
  "#{node['sabnzbd']['install_dir']}/#{node['sabnzbd']['version']}",
  "#{node['sabnzbd']['log_dir']}"
]

app_dirs.each do |x|
  directory x do
    mode 0755
    owner node['sabnzbd']['user']
    group node['sabnzbd']['group']
    recursive true
  end
end

# Download sabnzbd
remote_file "#{node['sabnzbd']['install_dir']}/#{node['sabnzbd']['version']}/SABnzbd-#{node['sabnzbd']['version']}-src.tar.gz" do
  source "http://softlayer-ams.dl.sourceforge.net/project/sabnzbdplus/sabnzbdplus/#{node['sabnzbd']['version']}/SABnzbd-#{node['sabnzbd']['version']}-src.tar.gz"
  user node['sabnzbd']['user']
  group node['sabnzbd']['group']
end

# Extract sabnzbd
bash "extract" do
   code <<-EOS
   cd #{node['sabnzbd']['install_dir']}/#{node['sabnzbd']['version']}
   tar xzvf SABnzbd-#{node['sabnzbd']['version']}-src.tar.gz
   cd --
   EOS
end

# Link current version to "current"
link "#{node['sabnzbd']['install_dir']}/current" do
  to "#{node['sabnzbd']['install_dir']}/#{node['sabnzbd']['version']}"
  notifies :restart, "bluepill_service[sabnzbd]", :immediately
end

# Set up daemon with bluepill
template "#{node['bluepill']['conf_dir']}/sabnzbd.pill" do
  source "sabnzbd.pill.erb"
  mode 0644
  notifies :load, "bluepill_service[sabnzbd]", :immediately
  notifies :restart, "bluepill_service[sabnzbd]", :immediately
end

bluepill_service "sabnzbd" do
  action [:enable, :load, :start]
end
