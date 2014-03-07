#
# Cookbook Name:: cloudpassage
# Recipe:: default
#
# Copyright 2012-2013, Escape Studios
#

#add CloudPassage repository
case node['platform_family']
when 'debian'
  apt_repository 'cloudpassage' do
    uri node['cloudpassage']['repo']['uri']
    distribution node['cloudpassage']['repo']['distribution']
    components node['cloudpassage']['repo']['components']
    key node['cloudpassage']['repo']['key']
  end
when 'rhel'
  yum_repository 'cloudpassage' do
    description  "CloudPassage"
    baseurl node['cloudpassage']['repo']['uri']
    gpgkey node['cloudpassage']['repo']['key']
  end
end

#install/upgrade the daemon
package "cphalo" do
    action :upgrade
    notifies :restart, "service[cphalod]", :immediately
end

#start the daemon
service "cphalod" do
    start_command "sudo /etc/init.d/cphalod start --daemon-key=#{node[:cloudpassage][:license_key]}"
    stop_command "service cphalod stop"
    status_command "service cphalod status"
    restart_command "service cphalod restart --daemon-key=#{node[:cloudpassage][:license_key]}"
    supports [:start, :stop, :status, :restart]
    #starts the service if it's not running and enables it to start at system boot time
    action [:enable, :start]
end
