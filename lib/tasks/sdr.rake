# frozen_string_literal: true

desc 'Run test suite'
task :ci do
  shared_solr_opts = { managed: true, verbose: true, persist: false, download_dir: 'tmp' }
  shared_solr_opts[:version] = Settings.SOLR_VERSION if Settings.SOLR_VERSION

  SolrWrapper.wrap(shared_solr_opts.merge(port: 8983, instance_dir: 'tmp/sdr-core-test')) do |solr|
    solr.with_collection(name: 'sdr-core-test', dir: Rails.root.join('solr', 'conf').to_s) do
      ENV['SOLR_URL'] = 'http://localhost:8983/solr/sdr-core-test'
      system 'RAILS_ENV=test rake geoblacklight:index:seed'
      Rake::Task['spec'].invoke
    end
  end
end

namespace :sdr do
  desc 'Run Solr and GeoBlacklight for interactive development'
  task :server, [:rails_server_args] do |_t, _args|
    require 'solr_wrapper'

    shared_solr_opts = { managed: true, verbose: true, persist: false, download_dir: 'tmp' }
    shared_solr_opts[:version] = Settings.SOLR_VERSION if Settings.SOLR_VERSION

    SolrWrapper.wrap(shared_solr_opts.merge(port: Settings.SOLR_PORT, instance_dir: Settings.SOLR_INSTANCE_DIR)) do |solr|
      solr.with_collection(name: Settings.SOLR_INSTANCE_NAME, dir: Rails.root.join('solr', 'conf').to_s) do
        puts "Solr running at #{Settings.SOLR_URL}, ^C to exit"
        puts ' '
        begin
          ENV['SOLR_URL'] = Settings.SOLR_URL
          system 'rake geoblacklight:index:seed'
          system 'bundle exec rails s -b 0.0.0.0'
          sleep
        rescue Interrupt
          puts "\nShutting down..."
        end
      end
    end
  end

  desc 'Start solr server for testing.'
  task :test do
    if Rails.env.test?
      shared_solr_opts = { managed: true, verbose: true, persist: false, download_dir: 'tmp' }
      shared_solr_opts[:version] = Settings.SOLR_VERSION if Settings.SOLR_VERSION

      SolrWrapper.wrap(shared_solr_opts.merge(port: Settings.SOLR_PORT, instance_dir: Settings.SOLR_INSTANCE_DIR)) do |solr|
        solr.with_collection(name: Settings.SOLR_INSTANCE_NAME, dir: Rails.root.join('solr', 'conf').to_s) do
          puts "Solr running at #{Settings.SOLR_URL}, ^C to exit"
          ENV['SOLR_URL'] = Settings.SOLR_URL
          begin
            Rake::Task['geoblacklight:solr:seed'].invoke
            sleep
          rescue Interrupt
            puts "\nShutting down..."
          end
        end
      end
    else
      system('rake sdr:test RAILS_ENV=test')
    end
  end

  desc 'Start solr server for development.'
  task :development do
    shared_solr_opts = { managed: true, verbose: true, persist: false, download_dir: 'tmp' }
    shared_solr_opts[:version] = Settings.SOLR_VERSION if Settings.SOLR_VERSION

    SolrWrapper.wrap(shared_solr_opts.merge(port: Settings.SOLR_PORT, instance_dir: Settings.SOLR_INSTANCE_DIR)) do |solr|
      solr.with_collection(name: Settings.SOLR_INSTANCE_NAME, dir: Rails.root.join('solr', 'conf').to_s) do
        puts "Solr running at #{Settings.SOLR_URL}, ^C to exit"
        begin
          Rake::Task['geoblacklight:solr:seed'].invoke
          sleep
        rescue Interrupt
          puts "\nShutting down..."
        end
      end
    end
  end
end
