# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'
VAGRANT_BOX = 'ubuntu-14.04-chef'
Vagrant.require_version '>= 1.5.0'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.include_offline = true
  config.vm.define 'mq1' do |queue|
    queue.vm.hostname = 'mq1'
    queue.vm.box = VAGRANT_BOX
    queue.vm.network 'private_network', ip: '172.28.128.4'
    queue.berkshelf.enabled = true
    queue.vm.provision :chef_solo do |chef|
      chef.json = {
        'dsi-mq' => {
          cluster: true,
          vip: '172.28.128.3',
          bind: 'eth1',
          nodes: ['rabbit@mq1'],
          cookie: 'qmsldfuqslieqisur2IU902UKJMHkjusdfsqdjhfmsu982ljh234x23',
          members: ['mq1', 'mq2']
        }
      }
      chef.run_list = [
        'recipe[dsi-mq::default]'
      ]
    end
  end

  config.vm.define 'mq2' do |queue|
    queue.vm.hostname = 'mq2'
    queue.vm.box = VAGRANT_BOX
    queue.vm.network 'private_network', ip: '172.28.128.5'
    queue.berkshelf.enabled = true
    queue.vm.provision :chef_solo do |chef|
      chef.json = {
        'dsi-mq' => {
          cluster: true,
          vip: '172.28.128.3',
          bind: 'eth1',
          nodes: ['rabbit@mq1'],
          cookie: 'qmsldfuqslieqisur2IU902UKJMHkjusdfsqdjhfmsu982ljh234x23',
          members: ['mq1', 'mq2']
        }
      }
      chef.run_list = [
        'recipe[dsi-mq::default]'
      ]
    end
  end

  config.vm.define 'mq3', autostart: false do |queue|
    queue.vm.hostname = 'mq3'
    queue.vm.box = VAGRANT_BOX
    queue.vm.network 'private_network', ip: '172.28.128.6'
    queue.berkshelf.enabled = true
    queue.vm.provision :chef_solo do |chef|
      chef.json = {
        'dsi-mq' => {
          vip: '172.28.128.3',
          bind: 'eth1',
          nodes: ['rabbit@mq1'],
          cookie: 'qmsldfuqslieqisur2IU902UKJMHkjusdfsqdjhfmsu982ljh234x23',
          members: ['mq1', 'mq2', 'mq3']
        }
      }
      chef.run_list = [
        'recipe[dsi-mq::default]'
      ]
    end
  end
end
