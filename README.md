# NYU Spatial Data Repository 🗺️

![Supported Ruby Version](https://img.shields.io/badge/ruby%20version-2.5.7-green?style=flat-square) [![Maintainability](https://api.codeclimate.com/v1/badges/080a26a69fcbdb0e6286/maintainability?style=flat-square)](https://codeclimate.com/github/NYULibraries/spatial_data_repository/maintainability)  [![Dependencies](https://img.shields.io/librariesio/github/NYULibraries/spatial_data_repository?style=flat-square)](https://libraries.io/github/NYULibraries/spatial_data_repository)

This repository tracks the implementation of GeoBlacklight used to power the front-end of NYU Libraries [Spatial Data Repository](https://geo.nyu.edu)

## Links

- [Wiki](https://github.com/NYULibraries/spatial_data_repository/wiki)
- [Code of Conduct](docs/CODE_OF_CONDUCT.md)
- [Contributing Guide](docs/CONTRIBUTING.md)


## Development Quickstart

Below are barebones steps for getting started in development for the SDR. For more in depth instructions, see [CONTRIBUTING](docs/CONTRIBUTING.md#development-guide). 

- Make sure you have Git, Vagrant, and VirtualBox installed. 
- Run the commands below in order specified:
```bash

cd <project-root>

# If you have never run vagrant, run "up" command to provision VM
vagrant up

# If you have previously run vagrant "up", just run "ssh"
vagrant ssh
cd /vagrant/sdr

# FIGS - Set Dev/Test ENV variables
cp config/vars.yml.example config/vars.yml

# Load database schema
bundle exec rake db:schema:load

# Run Solr and Rails App server
bundle exec rake sdr:server
```

- View to test environment Solr admin panel: http://localhost:8983/
- View the operating GeoBlacklight Rails app: http://localhost:3000
