# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'
VAGRANT_BOX = 'ubuntu-14.04-chef'
Vagrant.require_version '>= 1.5.0'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define 'mq1' do |queue|
    queue.vm.hostname = 'mq1'
    queue.vm.box = VAGRANT_BOX
    queue.vm.network 'private_network', ip: '172.28.128.3'
    queue.berkshelf.enabled = true
    queue.vm.provision :chef_solo do |chef|
      chef.json = {
        'dsi-mq' => {
          nodes: ['rabbit@mq1', 'rabbit@mq2'],
          cookie: 'qmsldfuqslieqisur2IU902UKJMHkjusdfsqdjhfmsu982ljh'
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
    queue.vm.network 'private_network', ip: '172.28.128.4'
    queue.berkshelf.enabled = true
    queue.vm.provision :chef_solo do |chef|
      chef.json = {
        'dsi-mq' => {
          nodes: ['rabbit@mq1', 'rabbit@mq2'],
          cookie: 'qmsldfuqslieqisur2IU902UKJMHkjusdfsqdjhfmsu982ljh'
        }
      }
      chef.run_list = [
        'recipe[dsi-mq::default]'
      ]
    end
  end
end
