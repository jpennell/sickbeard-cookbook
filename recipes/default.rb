#
# Cookbook Name:: sabnzbd
# Recipe:: default
#

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
  "#{node['sabnzbd']['install_dir']}/#{node['sabnzbd']['version']}"
]

app_dirs.each do |x|
  directory x do
    mode 0755
    owner node['sabnzbd']['user']
    group node['sabnzbd']['group']
    recursive true
  end
end

# Link current version to "current"
link "#{node['sabnzbd']['install_dir']}/current" do
  to "#{node['sabnzbd']['install_dir']}/#{node['sabnzbd']['version']}"
end

# Download sabnzbd
remote_file "#{node['sabnzbd']['install_dir']}/#{node['sabnzbd']['version']}/SABnzbd-#{node['sabnzbd']['version']}-src.tar.gz" do
  source "http://softlayer-ams.dl.sourceforge.net/project/sabnzbdplus/sabnzbdplus/#{node['sabnzbd']['version']}/SABnzbd-#{node['sabnzbd']['version']}-src.tar.gz"
end

# Extract sabnzbd
bash "extract" do
   code <<-EOS
   tar xzf #{node['sabnzbd']['install_dir']}/#{node['sabnzbd']['version']}/SABnzbd-#{node['sabnzbd']['version']}-src.tar.gz
   EOS
end
