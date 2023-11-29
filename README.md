# NYU Spatial Data Repository

[![CI](https://github.com/NYULibraries/spatial_data_repository/actions/workflows/ci.yml/badge.svg)](https://github.com/NYULibraries/spatial_data_repository/actions/workflows/ci.yml)

This repository tracks the implementation of GeoBlacklight used to power the front-end of NYU Libraries [Spatial Data Repository](https://geo.nyu.edu)

## Links

- [Wiki](https://github.com/NYULibraries/spatial_data_repository/wiki)
- [Documentation Repo](https://github.com/NYULibraries/sdr-documentation)
- [Code of Conduct](docs/CODE_OF_CONDUCT.md)
- [Contributing Guide](docs/CONTRIBUTING.md)


## Local Development Quickstart

Below are barebones steps for getting started in development for the SDR. For more in depth instructions, see [CONTRIBUTING](docs/CONTRIBUTING.md#development-guide). 

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

### On Mac (no virtualization)

#### Prerequisites
- Git (`brew install git`)
- Ruby (via RVM or Rbenv)
- Mysql (`brew install mysql`)
- Java (`brew install openjdk@11` or [Oracle Downloads](https://www.oracle.com/java/technologies/javase/jdk11-archive-downloads.html))

#### Steps

1. Run the commands below in order specified:
  - `git clone https://github.com/NYULibraries- spatial_data_repository.git && cd- spatial_data_repository`
  - `cp config/vars.yml.example config/vars.yml`
  - `bundle install`
  - `bundle exec rake db:schema:load`
  - `bundle exec rake sdr:server`
2. View to test environment Solr admin panel: http://localhost:8983/
3. View the operating GeoBlacklight Rails app: http://localhost:3000