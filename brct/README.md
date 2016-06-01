# BRCT Rails

TODO: Enter the cookbook description here.

chef generate cookbook brct
chef generate attribute default
chef generate file gemrc

# Configuration

# Install Docker
https://docs.docker.com/linux/step_one/

## Create docker hello-word
```
sudo docker run hello-world
```
## Add user to Docker group
```
sudo usermod -aG docker <username>
```
Restart ubuntu. This ensures your user is running with the correct permissions.

## Why Docker?
https://medium.com/brigade-engineering/reduce-chef-infrastructure-integration-test-times-by-75-with-test-kitchen-and-docker-bf638ab95a0a#.8rr9gugoa

# Start Docker
```
sudo service docker start
```
# Install Kitchen driver to Docker
```
gem install kitchen-docker
```
# Install dependecies of Kitchen
```
bundle install
```
# Install dependecies of recipes Chef
```
berks install
```

# Tests

## Test recipe
```
kitchen verify
```

## Foodcritic
### Foodcritic is a helpful lint tool you can use to check your Chef cookbooks for common problems
```
foodcritic .
```


http://jakshi.com/blog/2014/05/12/accessing-chef-attributes-in-serverspec-tests/