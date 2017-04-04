
module Common
  def update_status_team(id_team_a, id_team_b, round, id_group)
    #change status two team. team win is active, team fail is go out
    Team.where(:id => @battle.id_team_a).update_all("status = 'activity'")
    Team.where(:id => @battle.id_team_b).update_all("status = 'go out'")      
  end
end

