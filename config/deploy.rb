# config valid for current version and patch releases of Capistrano
lock "~> 3.17.3"

# Replace 'your_app_name' with your actual application name
set :application, 'nyu_geoblacklight'

# Replace 'your_server_ip' with your server's IP address
set :deploy_to, "/home/ubuntu/#{fetch(:application)}"
set :user, 'ubuntu'
set :repo_url, 'git@github.com:NYULibraries/spatial_data_repository.git'
set :branch, :main

# Use rbenv for Ruby version management
set :rbenv_type, :user
set :rbenv_ruby, File.read('.ruby-version').strip
set :node_version, '16.20.2'

# Pass additional environment variables to the server
set :default_env, {
  RAILS_ENV: 'production',
  PATH: "/home/ubuntu/.nvm/versions/node/v16.20.2/bin:/home/ubuntu/.rbenv/plugins/ruby-build/bin:/home/ubuntu/.rbenv/shims:/home/ubuntu/.rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
}

# Number of versions to keep (for rollback)
set :keep_releases, 5

# Linked files and directories (e.g., for database.yml, storage folders)
# append :linked_files, 'config/database.yml', 'config/master.key'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system', 'config/settings'
append :linked_files, 'config/master.key', 'config/credentials.yml.enc'

# Passenger settings
namespace :deploy do
  desc 'Restart application'
  task :restart do
    bundle exec rake restart
  end

  after :publishing, :restart
end

# Additional tasks
namespace :custom_tasks do
  desc 'Use the proper node version'
  task :node_version do
    on roles(:app) do
      "nvm use #{fetch(:node_version)}"
    end
  end
  desc 'Restart application'
  task :restart do
    on roles(:app) do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end
end

# Add any additional tasks you need for your deployment process.
# For example, you can run migrations or seed your database using Capistrano tasks.

after 'bundler:install', 'custom_tasks:node_version'
after 'deploy:symlink:release', 'custom_tasks:restart'
Rake::Task["deploy:restart"].clear_actions
