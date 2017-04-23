# class GroupController < Sinatra::Base
#   get '/group' do
#   begin    
#     @group = Group.all.order("round ASC")
#     @count_teams = Team.count
#     erb :template do
#       erb :group
#     end 
#   rescue Exception => e
#     binding.pry
#      redirect '404_page'
#   end
# end
# end

module GroupController 
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
end