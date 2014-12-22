#
# Cookbook Name:: dsi-mq
# Recipe:: default
#
# Copyright (C) 2014 Leonard TAVAE
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

node.set['rabbitmq']['cluster'] = node['dsi-mq']['cluster']
node.set['rabbitmq']['cluster_disk_nodes'] = node['dsi-mq']['nodes']
node.set['rabbitmq']['erlang_cookie'] = node['dsi-mq']['cookie']

include_recipe 'rabbitmq::default'
include_recipe 'rabbitmq::mgmt_console'

rabbitmq_user 'guest' do
  action :delete
end

rabbitmq_user node['dsi-mq']['admin'] do
  password node['dsi-mq']['admin_password']
  action :add
end

rabbitmq_user node['dsi-mq']['admin'] do
  vhost '/'
  permissions '.* .* .*'
  action :set_permissions
end

rabbitmq_user node['dsi-mq']['user'] do
  password node['dsi-mq']['user_password']
  action :add
end

rabbitmq_user node['dsi-mq']['user'] do
  vhost '/'
  permissions '.* .* .*'
  action :set_permissions
end

rabbitmq_user node['dsi-mq']['admin'] do
  tag 'administrator'
  action :set_tags
end

rabbitmq_policy 'ha-all' do
  pattern '^(?!amq\\.).*'
  params('ha-mode' => 'all')
  priority 1
  action :set
end
