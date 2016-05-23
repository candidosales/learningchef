#
# Cookbook Name:: motd-attributes
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
require 'pp'

pp node.debug_value('ipaddress')

include_recipe 'motd-attributes::message'

template '/etc/motd' do
  source 'motd.erb'
  mode '0644'
end