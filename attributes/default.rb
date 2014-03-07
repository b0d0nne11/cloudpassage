#
# Cookbook Name:: cloudpassage
# Attributes:: default
#
# Copyright 2012-2013, Escape Studios
#

default['cloudpassage']['repository_key'] = "4e750694a24da434d6fdf0bf271ad361"
default['cloudpassage']['license_key'] = "CHANGE_ME"

case node['platform_family']
when 'debian'
  default['cloudpassage']['repo']['uri'] = "http://packages.cloudpassage.com/#{node['cloudpassage']['repository_key']}/debian"
  default['cloudpassage']['repo']['key'] = 'http://packages.cloudpassage.com/cloudpassage.packages.key'
  default['cloudpassage']['repo']['distribution'] = 'debian'
  default['cloudpassage']['repo']['components'] = ['main']
when 'rhel'
  default['cloudpassage']['repo']['uri'] = "http://packages.cloudpassage.com/#{node['cloudpassage']['repository_key']}/redhat/$basearch"
  default['cloudpassage']['repo']['key'] = 'http://packages.cloudpassage.com/cloudpassage.packages.key'
end
