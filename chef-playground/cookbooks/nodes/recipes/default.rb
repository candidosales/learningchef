#
# Cookbook Name:: nodes
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

search("node", "*:*").each do |matching_node|
  log matching_node.to_s
end