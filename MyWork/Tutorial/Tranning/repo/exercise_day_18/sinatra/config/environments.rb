require 'sinatra'

ActiveRecord::Base.establish_connection(
  :adapter  => "mysql2",
  :host     => "0.0.0.0",
  :username => "root",
  :password => "huy10573987",
  :database => "football_sinatra",
   encoding: 'utf8'
)