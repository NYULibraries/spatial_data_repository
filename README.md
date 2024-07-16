# NYU Spatial Data Repository

[![CI](https://github.com/NYULibraries/spatial_data_repository/actions/workflows/ci.yml/badge.svg)](https://github.com/NYULibraries/spatial_data_repository/actions/workflows/ci.yml)

This repository tracks the implementation of GeoBlacklight used to power the front-end of NYU Libraries [Spatial Data Repository](https://geo.nyu.edu)

## Links

- [Documentation Repo](https://github.com/NYULibraries/sdr-documentation)

## Archive

- [Wiki for GBL 0.12.1](https://github.com/NYULibraries/spatial_data_repository/wiki); some info obsolete but contains some supporting doc and application change tracking

## Local Development Quickstart

Below are barebones steps for getting started in development for the SDR. 

### Using Vagrant

#### Prerequisites
- Git
- Vagrant
- VirtualBox

#### Steps

1. Run the commands below in order specified:
  - `git clone https://github.com/NYULibraries/spatial_data_repository.git && cd spatial_data_repository`
  - `vagrant up`
  - `vagrant ssh`
  - `cd /vagrant/sdr`
  - `cp config/vars.yml.example config/vars.yml`
  - `bundle exec rake db:schema:load`
  - `bundle exec rake sdr:server`
2. View to test environment Solr admin panel: http://localhost:8983/
3. View the operating GeoBlacklight Rails app: http://localhost:3000

### On Mac, including M1-3 (no virtualization)

#### Prerequisites
- Git (`brew install git`)
- Ruby 3.2.2 (not 3.3.1) + Rails (many options; GBL recommends this [Go Rails install list](https://gorails.com/setup/macos/14-sonoma#ruby), especially for Apple M1, M2; use `asdf` install manager and install Ruby + Nodejs + Rails)
- Mysql (`brew install mysql`)
- Java (`brew install openjdk@11`); if needing help to add Java to PATH, see [this help](https://stackoverflow.com/questions/71059252/mac-the-operation-couldn-t-be-completed-unable-to-locate-a-java-runtime-that-su))

#### Steps

1. Run the commands below in order specified:
  - `git clone https://github.com/NYULibraries/spatial_data_repository.git && cd- spatial_data_repository`
  - `cp config/vars.yml.example config/vars.yml`
  - `bundle install`
  - `bundle exec rake db:schema:load`
  - `bundle exec rake sdr:server`
2. View to test environment Solr admin panel: http://localhost:8989/solr
3. View the operating GeoBlacklight Rails app: http://localhost:3000

### Setup Gotchas

If the `mysql2` gem fails to install and complains about not finding `zstd` you may need to do the following:

```bash
gem install mysql2 -v '0.5.6' -- --with-opt-dir=$(brew --prefix openssl) --with-ldflags=-L/opt/homebrew/opt/zstd/lib
```
