require 'sinatra'
require 'sinatra/activerecord'
require 'pry'
require './config/environments' #database configuration
require './models/model'        #Model class
require './models/team'


get '/' do
	erb :index
	# @teams = Team.all
	# erb :home
end

get '/team' do
	@teams = Team.all
	erb :list_team
end


get '/get-list-teams' do
	@teams = Team.all
	erb :teams
end

post '/add_team' do	
	begin
		binding.pry
		@team = Team.new
		# @team = Team.new(params['name'], params['seed'])
		@team.name_team = params['name']
		@team.seed = params['seed']
		if @team.save
			binding.pry
			redirect '/get-list-teams'
		else
			"Sorry, there was an error!"
		end
	rescue Exception => e
		p e.message
	end
end

# post '/submit' do
# 	@model = Model.new(params[:model])
# 	if @model.save
# 		redirect '/models'
# 	else
# 		"Sorry, there was an error!"
# 	end
# end

# get '/models' do
# 	@models = Model.all
# 	erb :models
# end

# get '/hello/:name' do
# 	"Xin chao #{params['name']}"
# end

# get '/hello' do
# 		erb :hello
# end

# post '/hello' do
# 	@data = Array.new
# 	@data<<params[:name]
# 	binding.pry
# 	erb :hello
# end