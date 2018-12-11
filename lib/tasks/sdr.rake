desc 'Run test suite'
task :ci do
  shared_solr_opts = { managed: true, verbose: true, persist: false, download_dir: 'tmp' }
  shared_solr_opts[:version] = ENV['SOLR_VERSION'] if ENV['SOLR_VERSION']

  SolrWrapper.wrap(shared_solr_opts.merge(port: 8985, instance_dir: 'tmp/sdr-core-test')) do |solr|
    solr.with_collection(name: "sdr-core-test", dir: Rails.root.join("solr", "conf").to_s) do
      system 'RAILS_ENV=test rake geoblacklight:index:seed'
      Rake::Task['spec'].invoke
    end
  end
end

namespace :sdr do
  namespace :solr do
    desc 'Updates solr config files from github'
    task :update, :solr_dir do |_t, args|
      solr_dir = args[:solr_dir] || Rails.root.join('solr', 'conf')

      ['protwords.txt', 'schema.xml', 'solrconfig.xml', 'stopwords.txt', 'stopwords_en.txt', 'synonyms.txt'].each do |file|
        response = Faraday.get url_for_file("conf/#{file}")
        File.open(File.join(solr_dir, file), 'wb') { |f| f.write(response.body) }
      end
    end
  end

  desc "Start solr server for testing."
  task :test do
    if Rails.env.test?
      shared_solr_opts = { managed: true, verbose: true, persist: false, download_dir: 'tmp' }
      shared_solr_opts[:version] = ENV['SOLR_VERSION'] if ENV['SOLR_VERSION']

      SolrWrapper.wrap(shared_solr_opts.merge(port: 8985, instance_dir: 'tmp/sdr-core-test')) do |solr|
        solr.with_collection(name: "sdr-core-test", dir: Rails.root.join("config", "solr_configs").to_s) do
          puts "Solr running at http://localhost:8985/solr/sdr-core-test/, ^C to exit"
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

  desc "Start solr server for development."
  task :development do
    SolrWrapper.wrap(managed: true, verbose: true, port: 8983, instance_dir: 'tmp/sdr-core-dev', persist: false, download_dir: 'tmp') do |solr|
      solr.with_collection(name: "sdr-core-dev", dir: Rails.root.join("config", "solr_configs").to_s) do
        puts "Setup solr"
        puts "Solr running at http://localhost:8983/solr/sdr-core-dev/, ^C to exit"
        begin
          Rake::Task['geoblacklight:solr:seed'].invoke
          sleep
        rescue Interrupt
          puts "\nShutting down..."
        end
      end
    end
  end

  private

  def url_for_file(file)
    "https://raw.githubusercontent.com/NYULibraries/spatial_data_repository/master/config/solr_configs/#{file}"
  end
end
