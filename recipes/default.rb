# frozen_string_literal: true


user 'logstash user' do
  username node['logstash']['user']
  comment 'Logstash User'
  home "#{node['logstash']['prefix_root']}/logstash"
  shell '/bin/bash'
  manage_home false
  action :create
  system true
end

group 'logstash group' do
  group_name node['logstash']['group']
  action :create
  system true
end

ark 'logstash' do
  url node['logstash']['download_url']
  owner node['logstash']['user']
  group node['logstash']['group']
  version node['logstash']['version']
  has_binaries ['bin/logstash']


  prefix_root node['logstash']['prefix_root']
  prefix_home node['logstash']['prefix_root']
end

bash '' do
  code 'sudo apt-get -y install logstash'
end

template '/home/test.log' do
  source 'test.log'
end

template '/home/trial.conf' do
  source 'trial.conf'
end
