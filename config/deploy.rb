set :application, "stat_grapher"
set :repository,  "ssh://doxygen.garmin.com/opt/git/stat_grapher"
set :deploy_to, "/opt/rails_apps/#{application}"
set :use_sudo, false
set :user, "vallandingham"
set :deploy_via, :copy

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "doxygen.garmin.com"                          # Your HTTP server, Apache/etc
role :app, "doxygen.garmin.com"                          # This may be the same as your `Web` server
role :db,  "doxygen.garmin.com", :primary => true # This is where Rails migrations will run


namespace :deploy do
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp', 'restart.txt')}"
  end
end