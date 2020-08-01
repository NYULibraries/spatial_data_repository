FROM ruby:2.5.7

MAINTAINER Marii Nyrop <marii@nyu.edu>

SHELL ["/bin/bash", "-lc"]
RUN useradd -ms /bin/bash sdr-admin

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y apache2 bzip2 curl default-jdk default-jre dkms \
                      g++ gcc git libreadline-dev libsqlite3-dev nodejs \
                      postgresql-client software-properties-common

RUN mkdir -p /app/tmp
WORKDIR /app
COPY . /app

RUN gem install bundler

RUN bundle install
RUN cp config/vars.yml.example config/vars.yml
RUN bundle exec rake db:schema:load

# Start the main process.
# CMD ["/bin/bash", "-lc", "rake sdr:server"]
CMD /bin/sh -c "rm -rf /app/tmp/pids /app/tmp/sdr-core-development && rake sdr:server"

EXPOSE 3000 8983
