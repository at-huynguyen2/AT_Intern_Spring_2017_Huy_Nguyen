
require 'sinatra'
require 'sinatra/activerecord'
require 'pry'
require './config/environments' #database configuration
require './models/team'
require './models/group'
require './models/battle'

get '/' do
  erb :index  
end

get '/team' do
  @teams = Team.all
  # erb :list_team
  erb :template do
    erb :list_team
  end 
end


get '/get_list_teams' do
  @teams = Team.all
  erb :teams
end

post '/add_team' do 
  begin   
    @team = Team.new  
    @team.name_team = params['name']
    @team.seed = params['seed'] 
    @team.status = "wait"
    if @team.save
      # binding.pry
      redirect '/get_list_teams'
    else
      "Sorry, there was an error!"
    end
  rescue Exception => e
    redirect '404_page'
  end
end

get '/404_page' do
  erb :page404
end

get '/group' do
  begin    
    @group = Group.all.order("round ASC")
    @count_teams = Team.count
    erb :template do
      erb :group
    end 
  rescue Exception => e
    binding.pry
     redirect '404_page'
  end
end

get '/battle' do
  begin
    # binding.pry
    # @group = Group.where('id = '+@id_group).find(1)
    # if @group.status ==  'finish'
    #   erb :info_battle
    # else
    #   erb :battle
    # end
    @id_group = params['group']
    erb :battle
  rescue Exception => e
     redirect '404_page'
  end
end

get '/choose_team' do
  begin    
    id1 = params['id1']
    id2 = params['id2']
    @order = params['order']
    if (id1 == '') & (id2 == '')
      #load all teams which have status = 0 it mean team not yet competition
      @teams = Team.where("status = 'wait'")    
      erb :choose_team      
    else
      #load tat ca doi bong van chua tham gia. filter status = 0 va loai id da duoc chon trong tran      
      id = (id1!='')?id1:id2
      @teams = Team.where("status = 'wait'").where('id <> '+id)
      erb :choose_team      
    end 
  rescue Exception => e
    redirect '404_page'
  end
end

get '/save_battle' do
  begin 
    @battle = Battle.new
    @battle.id_team_a = params['id1']
    @battle.id_team_b = params['id2']
    @battle.score_team_a = params['score1']
    @battle.score_team_b = params['score2']
    @battle.id_group = params['idGroup']
    @total_battle_pass = params['totalBattle'].to_i 
    name_team_a = Team.where(:id => @battle.id_team_a).first.name_team
    name_team_b = Team.where(:id => @battle.id_team_b).first.name_team
    round = Group.where(:name => @battle.id_group).first.round
    if @battle.score_team_a == @battle.score_team_b
      #If 2 teams is equal that nofitication = 0 it mean end user must add other score
      @notification = 0           
    else 
      @notification = 1
      if @battle.score_team_a > @battle.score_team_b
        Team.where(:id => @battle.id_team_a).update_all("status = 'activity'")
        Team.where(:id => @battle.id_team_b).update_all("status = 'go out'")
        if @total_battle_pass == 0
          Group.where(:name => @battle.id_group).update_all("first_team = '" + name_team_a + "'")
        else
          Group.where(:name => @battle.id_group).update_all("second_team = '" + name_team_a + "'")
        end 
      else
        Team.where(:id => @battle.id_team_b).update_all("status = 'activity'")
        Team.where(:id => @battle.id_team_a).update_all("status = 'go out'")   
        if @total_battle_pass == 0
          Group.where(:name => @battle.id_group).update_all("first_team = '" + name_team_b + "'")
        else
          Group.where(:name => @battle.id_group).update_all("second_team = '" + name_team_b + "'")
        end 
      end
    end   
    if @battle.save
      if @total_battle_pass == 1 
        #Two battles did finish. Change this group's status is finished
        Group.where(:name => @battle.id_group).update_all("status = 'finish'")
        # Check if all group of this round did finish then must change status of this round and next round
        if Group.where(:round => round).where(:status => 'wait').count == 0          
          Group.where(:round => round).update_all("status = 'finish'")
          Group.where(:round => round+1).update_all("status = 'wait'")
          #update all team activity to wait to chuan bi next round
          Team.where(:status => 'activity').update_all("status = 'wait'")
        end        
      end        
      @total_battle_pass += 1
      erb :notification      
    else      
      redirect '404_page'
    end  
  rescue Exception => e
    redirect '404_page'
  end  
end












