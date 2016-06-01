require 'spec_helper'
require 'pathname'
require 'net/http'
require 'net/smtp'
require 'json'

set :backend, :exec
set :os, family: 'ubuntu', release: 16.04
set :disable_sudo, true

attributes = ::JSON.parse(File.read('/tmp/serverspec/node.json'))

describe package('libmysqld-dev') do
  it { should be_installed }
end

describe package('libmysqlclient-dev') do
  it { should be_installed }
end

describe 'brct::default' do
  it "installs the right version of Node #{attributes['nodejs']['version']}" do
    expect(command('node -v').stdout).to include '4.4.5'
  end
  
  it "installs the right version of Ruby #{attributes['ruby']['version']}" do
    expect(command('/opt/rbenv/shims/ruby -v').stdout).to include '2.3.1'
  end
  
  it "installs the right version of Ubuntu" do
    expect( command('lsb_release -a').stdout).to include('Ubuntu 16.04')
  end
end