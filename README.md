# NYU Spatial Data Repository

This tracks the implementation of GeoBlacklight used to power the front-end of our [Spatial Data Repository](https://geo.nyu.edu)

Check out the [wiki](https://github.com/NYULibraries/spatial_data_repository/wiki) for details about local modifications, as well as a detailed overview of the service architecture.

## Development

### Vagrant / Virtualbox

* Install Vagrant: https://www.vagrantup.com/downloads.html
* Install VirtualBox: https://www.virtualbox.org/wiki/Downloads

#### Run app via these commands

```bash

cd <project-root>
vagrant up
vagrant ssh
cd /vagrant/sdr

# FIGS - Set Dev/Test ENV variables
cp config/vars.yml.example config/vars.yml

# Init database
bundle exec rake db:schema:load

# Run Solr and Rails App server
bundle exec rake sdr:server
```

Application should now be running.

* Solr admin panel at: http://localhost:8983/
* Rails app at: http://localhost:3000
