require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'
require 'mina/puma'
require 'mina/unicorn'
require 'mina/webpacker'

set :application, 'radiovale'
set :domain, '206.189.239.54' # radiovale-APP
set :deploy_to, "/var/www/radiovale"
set :repository, 'git@github.com:eliaswebdev/radiovale.git'
set :branch, 'develop'
set :user, 'valedev'

set :forward_agent, true
set :keep_releases, 3


set :shared_dirs, fetch(:shared_dirs, []).push('log', 'node_modules', 'tmp', 'public/uploads', 'public/assets')
set :shared_files, fetch(:shared_files, []).push('config/database.yml', 'config/application.yml', 'config/secrets.yml')
set :shared_paths, ['tmp/sockets', 'tmp/pids']

# set :rvm_use_path, '~/.rvm/scripts/rvm'
# set :keep_releases, 10

# set :force_asset_precompile, true
task :remote_environment do
  invoke :'rvm:use', 'ruby-2.6.5'
end

task :setup do
  command %[mkdir -p "/#{fetch(:shared_path)}/config"]
  command %[chmod g+rx,u+rwx "/#{fetch(:shared_path)}/config"]

  command %[mkdir -p "/#{fetch(:shared_path)}/tmp/pids"]
  command %[chmod g+rx,u+rwx "/#{fetch(:shared_path)}/tmp/pids"]

  command %[mkdir -p "/#{fetch(:shared_path)}/tmp/sockets"]
  command %[chmod g+rx,u+rwx "/#{fetch(:shared_path)}/tmp/sockets"]

  command %[touch "/#{fetch(:shared_path)}/config/application.yml"]
  command %[touch "/#{fetch(:shared_path)}/config/database.yml"]
  command %[touch "/#{fetch(:shared_path)}/config/secrets.yml"]
end

desc "Seed data to the database"
task :seed do
  command %[cd /#{fetch(:current_path)}]
  command %[RAILS_ENV=production bundle exec rake db:migrate db:seed]
end

desc "megrate data to the database"
task :migrate do
  command %[cd /#{fetch(:current_path)}]
  command %[RAILS_ENV=production bundle exec rake db:migrate]
end

desc 'Compile assets with webpack'
task webpack: :remote_environment do
  command %{yarn install}
  command %{NODE_ENV=production RAILS_ENV=production bundle exec rails webpacker:compile}
  # command %{bundle exec rails webpacker:compile}
  # command 'RAILS_ENV=production bundle exec rails webpacker:compile'
end

desc "Deploys the current version to the server."
task :deploy do
  on :before_hook do
    # Put things to run locally before ssh
  end
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    # invoke :'sidekiq:quiet'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'webpacker:compile'
    # invoke :'deploy:cleanup'
    # invoke :webpack

    on :launch do
      # invoke :'puma:phased_restart'
      # invoke :'puma:hard_restart'
      # invoke :'unicorn:restart'
      # invoke :'sidekiq:restart'
      # invoke :'sitemap:refresh'
    end
  end
end
