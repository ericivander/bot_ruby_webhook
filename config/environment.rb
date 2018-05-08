# frozen_string_literal: true

require 'rubygems'
require 'bundler'
require 'mysql2'
require 'sinatra/activerecord'

# set root project
root = File.expand_path '../..', __FILE__

# require bundle
Bundler.require
# load env
Dotenv.load(root + '/.env')

configure do
  set :server, :puma
  set :database_file, root + '/config/database.yml'
end
