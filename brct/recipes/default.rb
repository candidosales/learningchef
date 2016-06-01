#
# Cookbook Name:: brct
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
execute 'apt-get update' do
  command 'apt-get update'
end

# Install Packages
packages = [ 'libmysqld-dev', 'libmysqlclient-dev' ]

packages.each do |name|
  package name
end

# Install Node
include_recipe 'nodejs'

# Configure gemrc
cookbook_file '/etc/gemrc' do
  action :create_if_missing
  source 'gemrc'
  mode   '0644'
end

include_recipe 'rbenv::default'
include_recipe 'rbenv::ruby_build'

rbenv_ruby "#{node['ruby']['version']}" do
  ruby_version "#{node['ruby']['version']}"
  global true
end

gem_package 'bundler' do
  version node['bundler']['version']
end

gem_package 'rake' do
  version node['rake']['version']
end