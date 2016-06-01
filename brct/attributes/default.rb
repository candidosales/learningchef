# Versions

## Node
node.default['nodejs']['install_method'] = 'binary'
node.default['nodejs']['version'] = '4.4.5'
node.default['nodejs']['binary']['checksum'] = 'ceff5e429dca770904a1fdbb5e7e53ab4cf31674'
# Get checksum https://bitnami.com/stack/nodejs/installer

## Ruby
node.default['ruby']['version'] = '2.3.1'

### Gems
node.default['bundler']['version'] = '1.11'
node.default['rake']['version'] = '11.1.2'