
# Configuration de la message queue (RABBITMQ)
#
default['dsi-mq']['admin'] = 'admin'
default['dsi-mq']['admin_password'] = 'password'
default['dsi-mq']['user'] = 'rabbitmq'
default['dsi-mq']['user_password'] = 'password'

default['dsi-mq']['cluster'] = true
default['dsi-mq']['nodes'] = []
default['dsi-mq']['cookie'] = 'random_string_password'

# Configuration de la VIP (KEEPALIVED)
#
default['dsi-mq']['vip'] = '172.28.128.5'
default['dsi-mq']['bind'] = 'eth1'
default['dsi-mq']['keypass'] = 'secret'