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

# Download sabnzbd
remote_file "#{node['sabnzbd']['install_dir']}/#{node['sabnzbd']['version']}/SABnzbd-#{node['sabnzbd']['version']}-src.tar.gz" do
  source "http://softlayer-ams.dl.sourceforge.net/project/sabnzbdplus/sabnzbdplus/#{node['sabnzbd']['version']}/SABnzbd-#{node['sabnzbd']['version']}-src.tar.gz"
end