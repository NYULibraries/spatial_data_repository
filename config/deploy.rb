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

# Pass additional environment variables to the server
set :default_env, {
  RAILS_ENV: 'production'
}

# Number of versions to keep (for rollback)
set :keep_releases, 5

# Linked files and directories (e.g., for database.yml, storage folders)
# append :linked_files, 'config/database.yml', 'config/master.key'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system', 'public/uploads'

# Passenger settings
namespace :deploy do
  desc 'Restart application'
  task :restart do
    bundle exec rake restart
  end

  after :publishing, :restart
end

# Additional tasks
# namespace :custom_tasks do
#   desc 'Your custom task'
#   task :your_task do
#     on roles(:app) do
#       within current_path do
#         # Your custom commands here
#       end
#     end
#   end
# end

# Add any additional tasks you need for your deployment process.
# For example, you can run migrations or seed your database using Capistrano tasks.

# after 'deploy:published', 'custom_tasks:your_task'
