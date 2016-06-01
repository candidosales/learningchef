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
            # 'curl',
            # 'build-essential',
            'xz-utils','make', 'g++', 
            'libmysqld-dev', 'libmysqlclient-dev',
            # 'libreadline-dev', 'libyaml-dev', 'libxml2-dev', 'libxslt1-dev', 'libcurl4-openssl-dev',
            # 'autoconf', 'automake', 'autotools-dev', 'g++', 'g++-4.8', 'libbison-dev',
            # 'libc6-dev', 'libsigsegv2', 'libssl-doc', 'libstdc++-4.8-dev','linux-libc-dev'
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
# ruby_runtime "Install Ruby #{node['ruby']['version']}" do
#   provider :ruby_build
#   version node['ruby']['version']
# end


# rbenv_ruby "#{node['ruby']['version']}" do
#   action :reinstall
# end

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