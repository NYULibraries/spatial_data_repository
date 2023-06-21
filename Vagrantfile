# frozen_string_literal: true

# -*- mode: ruby -*-
# vi: set ft=ruby :
RUBY_V = File.open('./.ruby-version', &:read).chomp

Vagrant.configure(2) do |config|
  config.vm.box = 'bento/ubuntu-16.04'
  config.vm.hostname = 'sdr-geoblacklight'
  config.vm.synced_folder '.', '/vagrant/sdr'

  config.vm.network 'forwarded_port', guest: 8983, host: 8983, auto_correct: true
  config.vm.network 'forwarded_port', guest: 3000, host: 3000, auto_correct: true

  config.vm.provider 'virtualbox' do |vb|
    vb.memory = '1024'
  end

  $apt_script = <<-SCRIPT
    sudo apt-get update
    sudo apt-get install -y apache2 curl git nodejs gcc bzip2 dkms software-properties-common libreadline-dev libmysqlclient-dev g++ firefox libsqlite3-dev

    sudo add-apt-repository -y ppa:openjdk-r/ppa
    sudo apt-get update
    sudo apt-get install -y openjdk-8-jdk

    sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password rootpass'
    sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password rootpass'
    sudo apt-get -y install mysql-server
    sudo apt-get -y autoremove
  SCRIPT

  $rbenv_script = <<-SCRIPT
    if [ ! -d ~/.rbenv ]; then
      git clone https://github.com/rbenv/rbenv.git ~/.rbenv
      echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
      echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    fi
    if [ ! -d ~/.rbenv/plugins/ruby-build ]; then
      git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
      echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
    fi
    export PATH="$HOME/.rbenv/bin:$PATH"
    export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
    eval "$(rbenv init -)"
    if [ ! -e .rbenv/versions/#{RUBY_V} ]; then
      RUBY_CONFIGURE_OPTS=--disable-install-doc rbenv install #{RUBY_V}
      rbenv global #{RUBY_V}
    fi
    cd /vagrant
    if [ ! -e /home/vagrant/.rbenv/shims/bundle ]; then
      echo 'gem: --no-document' >> ~/.gemrc
      gem install bundler
      rbenv rehash
    fi
    cd /vagrant/sdr
    gem update bundler
    bundle install
  SCRIPT

  config.vm.provision :shell, inline: $apt_script
  config.vm.provision :shell, privileged: false, inline: $rbenv_script
end
