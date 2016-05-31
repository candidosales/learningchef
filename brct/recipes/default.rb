#
# Cookbook Name:: brct
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

execute 'apt-get update' do
  command 'apt-get update'
end

# Install Packages
packages = [
            'curl',
            'ruby-dev',
            'zlib1g-dev',
            'build-essential', 'nodejs',
            'python-software-properties',
            'libmysqld-dev', 'libmysqlclient-dev',
            'libssl-dev', 'libreadline-dev', 'libyaml-dev', 'libxml2-dev', 'libxslt1-dev', 'libcurl4-openssl-dev'
            ]

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

# Install Ruby
ruby_runtime "Install Ruby #{node['ruby']['version']}" do
  provider :ruby_build
  version node['ruby']['version']
end

gem_package 'bundler' do
  version node['bundler']['version']
end

gem_package 'rake' do
  version node['rake']['version']
end