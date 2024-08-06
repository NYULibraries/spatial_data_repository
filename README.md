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

### Running the Test Suite

To run the full test suite use the following command:

```bash
$ bundle exec rake ci
```

This command will start up Solr with a `sdr-core-test` core and then run the full test suite.

#### Running Individual Specs

Some specs (like feature specs) require a `sdr-core-test` core set up in Solr. This is automatically done when running the full test suite using the command above, but for running individual specs you'll need to start it up manually. You can do that using the following command:

```bash
$ bundle exec rake sdr:test
```

Then, in another terminal window (or your IDE), run the individual spec.

Note: You'll know this step is necessary if an individual spec fails with an error like the following:

```plaintext
Blacklight::Exceptions::ECONNREFUSED: Connection refused - Unable to connect to Solr instance using #<RSolr::Client:0x0000000117d5e1a8 @uri=#<URI::HTTP http://127.0.0.1:8983/solr/sdr-core-test/>
```

### Loading NYU Data Locally

First, start up the Rails app if it's not already running:

```bash
$ bundle exec rake sdr:server
```

This will ensure Solr is up and running.

Then in another terminal run the following Rake task:

```bash
$ bundle exec rake sdr:load_nyu_data
```

Once completed, head to <http://localhost:3000/?search_field=all_fields> and you should have a lot more data to work with.
