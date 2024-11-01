# frozen_string_literal: true

require 'fileutils'

desc 'Run test suite'
task ci: :environment do
  shared_solr_opts = { managed: true, verbose: true, persist: false, download_dir: 'tmp' }
  shared_solr_opts[:version] = Settings.SOLR_VERSION if Settings.SOLR_VERSION

  SolrWrapper.wrap(shared_solr_opts.merge(port: 8983, instance_dir: 'tmp/sdr-core-test')) do |solr|
    solr.with_collection(name: 'sdr-core-test', dir: Rails.root.join('solr/conf').to_s) do
      ENV['SOLR_URL'] = 'http://localhost:8983/solr/sdr-core-test'
      system 'RAILS_ENV=test rake geoblacklight:index:seed'
      Rake::Task['spec'].invoke
    end
  end
end

namespace :sdr do
  desc 'Run Solr and GeoBlacklight for interactive development'
  task server: %i[environment] do |_t, _args|
    shared_solr_opts = { managed: true, verbose: true, persist: false, download_dir: 'tmp' }
    shared_solr_opts[:version] = Settings.SOLR_VERSION if Settings.SOLR_VERSION

    FileUtils.rm_rf Settings.SOLR_INSTANCE_DIR

    SolrWrapper.wrap(shared_solr_opts.merge(port: Settings.SOLR_PORT, instance_dir: Settings.SOLR_INSTANCE_DIR)) do |solr|
      solr.with_collection(name: Settings.SOLR_INSTANCE_NAME, dir: Rails.root.join('solr/conf').to_s) do
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
  task test: :environment do
    if Rails.env.test?
      shared_solr_opts = { managed: true, verbose: true, persist: false, download_dir: 'tmp' }
      shared_solr_opts[:version] = Settings.SOLR_VERSION if Settings.SOLR_VERSION

      SolrWrapper.wrap(shared_solr_opts.merge(port: Settings.SOLR_PORT, instance_dir: Settings.SOLR_INSTANCE_DIR)) do |solr|
        solr.with_collection(name: Settings.SOLR_INSTANCE_NAME, dir: Rails.root.join('solr/conf').to_s) do
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
  task development: :environment do
    shared_solr_opts = { managed: true, verbose: true, persist: false, download_dir: 'tmp' }
    shared_solr_opts[:version] = Settings.SOLR_VERSION if Settings.SOLR_VERSION

    SolrWrapper.wrap(shared_solr_opts.merge(port: Settings.SOLR_PORT, instance_dir: Settings.SOLR_INSTANCE_DIR)) do |solr|
      solr.with_collection(name: Settings.SOLR_INSTANCE_NAME, dir: Rails.root.join('solr/conf').to_s) do
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

  desc 'Clone and index NYU data for local development'
  task load_nyu_data: :environment do
    exit unless Rails.env.development?

    puts 'Removing existing edu.nyu repo...'
    FileUtils.rm_rf('tmp/opengeometadata/edu.nyu')

    puts 'Cloning edu.nyu repository...'
    system 'bundle exec sdr-cli clone --repo=edu.nyu'

    puts 'Deleting Solr index...'
    Blacklight.default_index.connection.delete_by_query '*:*'
    Blacklight.default_index.connection.commit

    puts 'Indexing edu.nyu Aardvark files...'
    system "bundle exec sdr-cli index --directory=\"tmp/opengeometadata/edu.nyu/metadata-aardvark/**/*.json\" --solr_url=\"#{Settings.SOLR_URL}\""

    puts 'Done!'
  end
end
