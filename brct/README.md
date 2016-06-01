# brct

TODO: Enter the cookbook description here.

chef generate cookbook brct
chef generate attribute default
chef generate file gemrc

# install docker
https://docs.docker.com/linux/step_one/

https://medium.com/brigade-engineering/reduce-chef-infrastructure-integration-test-times-by-75-with-test-kitchen-and-docker-bf638ab95a0a#.8rr9gugoa

# start docker
sudo service docker start

# install kitchen driver to docker
gem install kitchen-docker

# install dependecies of kitchen
bundle install

# install dependecies of recipes chef
berks install
