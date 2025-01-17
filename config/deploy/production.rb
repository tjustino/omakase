# frozen_string_literal: true

# app - the Rails application itself
# db  - the database
# web - the nginx server that will act as a proxy and serve static assets
set :stage,     :production
set :branch,    "master"
set :rails_env, :production

server "justino.fr", user: "tomj", roles: %w[web app db], primary: true
