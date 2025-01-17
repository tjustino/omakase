# frozen_string_literal: true

set :application, "omakase"

# setup repo
set :repo_url, "git@github.com:tjustino/omakase.git"

# setup deploy details
set :deploy_to, "/srv/http/#{fetch(:application)}"

# files/dirs we want symlinking to shared
set :linked_files, fetch(:linked_files, []).push("config/database.yml",
                                                 "config/secrets.yml",
                                                 "db/production.sqlite3")

set :linked_dirs, fetch(:linked_dirs, []).push("log",
                                               ".bundle",
                                               "tmp/pids",
                                               "tmp/cache",
                                               "tmp/sockets",
                                               "node_modules",
                                               "vendor/bundle",
                                               "public/packs",
                                               "public/system")

# setup rbenv
set :rbenv_type,     :user
set :rbenv_ruby,     RUBY_VERSION
set :rbenv_prefix,   "RBENV_ROOT=#{fetch(:rbenv_path)} " \
                     "RBENV_VERSION=#{fetch(:rbenv_ruby)} " \
                     "#{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w[rake gem bundle ruby rails puma pumactl]

# how many old releases do we want to keep
set :keep_releases, 3
