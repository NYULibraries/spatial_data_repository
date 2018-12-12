#!/usr/bin/env bash

# This script is used by the Vagrant file to provision the box

# Install server dependencies
sudo yum install -y epel-release
sudo yum install -y curl git java-1.8.0-openjdk-devel nodejs yum-utils gcc bzip2 kernel-devel dkms mysql mysql-devel

# Install RVM and Ruby
su - vagrant -c 'gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3'
su - vagrant -c 'curl -sSL https://get.rvm.io | bash -s stable'
su - vagrant -c 'rvm 2.5.3 --install --default'

# Install bundler gem and bundle install
su - vagrant -c 'gem install bundler'
su - vagrant -c 'cd /vagrant/sdr && bundle install'

# Create the test application
# su - vagrant -c 'cd /home/vagrant/sync && rake engine_cart:generate'

# Output some instructions on what to do next
echo "
Now start Solr and run GeoBlacklight via the following from within vagrant:

vagrant ssh
cd /vagrant/sdr
bundle exec rake sdr:server

Now you can view:
* application: http://localhost:3000/
* solr admin panel: http://localhost:8983/solr/#/sdr-core-development/query

"
