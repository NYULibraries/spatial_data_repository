# NYU Spatial Data Repository

[![CI](https://github.com/NYULibraries/spatial_data_repository/actions/workflows/ci.yml/badge.svg)](https://github.com/NYULibraries/spatial_data_repository/actions/workflows/ci.yml)

This repository tracks the implementation of GeoBlacklight used to power the front-end of NYU Libraries' [Spatial Data Repository](https://geo.nyu.edu)

## Local Development Quickstart

### Prerequisites

You will need the following installed:

- Git
- MySQL
- Ruby 3.2.2
- NodeJS 20+
- Java 11+

On macOS you can use [Homebrew](https://brew.sh) and [asdf](https://asdf-vm.com) to install everything you need:

```bash
$ brew install git
$ brew install mysql
$ brew install asdf
$ echo '. "$HOME/.asdf/asdf.sh"' >> ~/.zshrc
$ source ~/.zshrc
$ asdf plugin add ruby
$ asdf install ruby 3.2.2
$ asdf global ruby 3.2.2
$ asdf plugin add java
$ asdf install java openjdk-17
$ asdf global java openjdk-17
$ asdf plugin add nodejs
$ asdf install nodejs 22.6.0
$ asdf global nodejs 22.6.0
```

### Running a Development Server

To checkout the project and standup a development server:

```bash
$ git clone https://github.com/NYULibraries/spatial_data_repository.git
$ cd spatial_data_repository
$ bundle install
$ npm install
$ bundle exec rake db:schema:load
$ bundle exec rake sdr:server
```

The development SDR web application will be available at <http://localhost:3000>

The development Solr instance will be available at <http://localhost:8989/solr>

#### Setup Gotchas

If the `mysql2` gem fails to install and complains about not finding `zstd` you may need to do the following:

```bash
$ gem install mysql2 -v '0.5.6' -- --with-opt-dir=$(brew --prefix openssl) --with-ldflags=-L/opt/homebrew/opt/zstd/lib
```

### Loading NYU Data in Development

First, start up the Rails app if it's not already running:

```bash
$ bundle exec rake sdr:server
```

Then in another terminal run the following Rake task:

```bash
$ bundle exec rake sdr:load_nyu_data
```

Once completed, head to <http://localhost:3000/?search_field=all_fields> and you should have a lot more data to work with.

The Solr instance does not persist its data between runs so you will need to reload the data if you ever restart the web application.

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

## Resources

- [Documentation Repo](https://github.com/NYULibraries/sdr-documentation)
- [Wiki for GBL 0.12.1](https://github.com/NYULibraries/spatial_data_repository/wiki)
    - some info obsolete but contains some supporting doc and application change tracking
