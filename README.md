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

(Check specific versions in [.tool-versions](./.tool-versions))
#### Installing Prerequisites with Homebrew & asdf

If you don't already have the prerequisites installed on your Mac laptop you can use [Homebrew](https://brew.sh) and [asdf](https://asdf-vm.com) to install everything you need:

```bash
$ brew install git mysql asdf
```
You'll need to [set up asdf for your chosen shell](https://asdf-vm.com/guide/getting-started.html#_3-install-asdf) and then you'll be able to install the required language plugins:

```bash
$ asdf plugin add ruby
$ asdf plugin add java
$ asdf plugin add nodejs
```

### Running a Development Server

Checkout the project repo:

```bash
$ git clone https://github.com/NYULibraries/spatial_data_repository.git
$ cd spatial_data_repository
```
Next, load the correct Ruby, Node, and Java versions using your version managers. If you're using `asdf`, you can do this with:

``` sh
$ asdf install
```
Finally, install the ruby gems and node modules, load the data, and start the server:
```
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

## Deployment

We use [Capistrano](https://capistranorb.com) to manage deployments.

To deploy to an environment, use the following command:

```bash
$ bundle exec cap staging deploy
```

### Deployment Dry Run

To do a dry-run of a deployment, add the `-n` flag:

```bash
$ bundle exec cap staging deploy -n
```

### Override Staging Branch

To deploy a specific branch to the deployment environment, set a `BRANCH` environment variable:

```bash
$ BRANCH=foobar bundle exec cap staging deploy
```

## Resources

- [Documentation Repo](https://github.com/NYULibraries/sdr-documentation)
- [Wiki for GBL 0.12.1](https://github.com/NYULibraries/spatial_data_repository/wiki)
    - some info obsolete but contains some supporting doc and application change tracking
