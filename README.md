# NYU Spatial Data Repository

[![Build Status](https://travis-ci.org/NYULibraries/spatial_data_repository.svg?branch=master)](https://travis-ci.org/NYULibraries/spatial_data_repository) ![Supported Ruby Version](https://img.shields.io/badge/ruby%20version-2.5.7-green?style=flat-square) [![Maintainability](https://api.codeclimate.com/v1/badges/080a26a69fcbdb0e6286/maintainability?style=flat-square)](https://codeclimate.com/github/NYULibraries/spatial_data_repository/maintainability) [![Depfu](https://badges.depfu.com/badges/87261b603e6941c0578dd5de1225650f/overview.svg)](https://depfu.com/github/NYULibraries/spatial_data_repository?project_id=10547)

This repository tracks the implementation of GeoBlacklight used to power the front-end of NYU Libraries [Spatial Data Repository](https://geo.nyu.edu)

## Links

- [Wiki](https://github.com/NYULibraries/spatial_data_repository/wiki)
- [Documentation Repo](https://github.com/NYULibraries/sdr-documentation)
- [Code of Conduct](docs/CODE_OF_CONDUCT.md)
- [Contributing Guide](docs/CONTRIBUTING.md)


## Development Quickstart

Below are barebones steps for getting started in development for the SDR. For more in depth instructions, see [CONTRIBUTING](docs/CONTRIBUTING.md#development-guide).

### Option 1: Docker

- Make sure you have Git and Docker installed.
- Run the commands below in order specified:
  ```sh
  $ git clone https://github.com/NYULibraries/spatial_data_repository.git && cd spatial_data_repository
  $ docker build -t gbl .
  $ docker run -it -v "$PWD":/app --user sdr-admin --name sdr -p 3000:3000 -p 8983:8983 gbl
  ```
  (It will take ~30seconds to receive output)

- View to test environment Solr admin panel: http://0.0.0.0:8983
- View the operating GeoBlacklight Rails app: http://0.0.0.0:3000

- You can restart (rather than rebuild) with `docker start sdr`


### Option 2: Vagrant

- Make sure you have Git, Vagrant, and VirtualBox installed.
- Run the commands below in order specified:
  ```sh
  $ git clone https://github.com/NYULibraries/spatial_data_repository.git && cd spatial_data_repository
  $ vagrant up
  $ vagrant ssh
  $ cd /vagrant/sdr
  $ cp config/vars.yml.example config/vars.yml
  $ bundle exec rake db:schema:load
  $ bundle exec rake sdr:server
  ```

- View to test environment Solr admin panel: http://localhost:8983/
- View the operating GeoBlacklight Rails app: http://localhost:3000
