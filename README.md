# NYU Spatial Data Repository 🗺️

[![Maintainability](https://api.codeclimate.com/v1/badges/080a26a69fcbdb0e6286/maintainability)](https://codeclimate.com/github/NYULibraries/spatial_data_repository/maintainability) [![Libraries.io dependency status for GitHub repo](https://img.shields.io/librariesio/github/NYULibraries/spatial_data_repository)](https://libraries.io/github/NYULibraries/spatial_data_repository)

This repository tracks the implementation of GeoBlacklight used to power the front-end of NYU Libraries [Spatial Data Repository](https://geo.nyu.edu)

Check out the [wiki](https://github.com/NYULibraries/spatial_data_repository/wiki) for details about local modifications, as well as a detailed overview of the service architecture. The information here is designed to allow you to deploy a test instance of GeoBlacklight via a virtual machine (VM).

## Development

### Vagrant / Virtualbox

It is required to install Vagrant and VirtualBox one time on your local machine.

* Install Vagrant: https://www.vagrantup.com/downloads.html
* Install VirtualBox: https://www.virtualbox.org/wiki/Downloads

#### Run app via these commands in order specified

```bash

cd <project-root>

# If you have never run vagrant, run "up" command to provision VM
vagrant up

# If you have previously run vagrant "up", just run "ssh"
vagrant ssh
cd /vagrant/sdr

# Bundle - Install project gem dependencies
bundle

# FIGS - Set Dev/Test ENV variables
cp config/vars.yml.example config/vars.yml

# Load database schema
bundle exec rake db:schema:load

# Run Solr and Rails App server
bundle exec rake sdr:server
```

The application should now be running.

* To view to test environment Solr admin panel, go to: http://localhost:8983/
* To view the operating GeoBlacklight Rails app, go to: http://localhost:3000
