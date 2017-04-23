# require './config/environments'

# class ApplicationController < Sinatra::Base
#   get '/' do
#     erb :index  
#   end
# end

module ApplicationController
  get '/' do
    erb :index  
  end
end