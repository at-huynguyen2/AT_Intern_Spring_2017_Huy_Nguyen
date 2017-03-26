=begin
require 'sinatra'

env = ENV["RACK_ENV"]

YAML::load(File.open('config/database.yml'))[env].symbolize_keys.each do |key, value|
  set key, value
end

ActiveRecord::Base.establish_connection(
  adapter: "mysql2", 
  host: settings.db_host,
  database: settings.db_name,
  username: settings.db_username,
  password: settings.db_password)

=end

require 'sinatra'

#env = ENV["RACK_ENV"]

#YAML::load(File.open('config/database.yml'))[env].symbolize_keys.each do |key, value|
#  set key, value
#end

ActiveRecord::Base.establish_connection(
  :adapter  => "mysql2",
  :host     => "0.0.0.0",
  :username => "root",
  :password => "huy10573987",
  :database => "sinatra_demo",
   encoding: 'utf8'
)