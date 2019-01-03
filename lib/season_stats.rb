module SeasonStats

  def biggest_bust(season)
    teams_with_season_games(season).min_by do |team|
      team.seasons[season].win_differential
    end.team_name
  end

  def biggest_surprise(season)
    teams_with_season_games(season).max_by do |team|
      team.seasons[season].win_differential
    end.team_name
  end

  #This method only needed for incomplete data sets (if team didn't play
  #preseason and regular season games during the given season.)
  def teams_with_season_games(season)
    season_teams = []
    @teams.each do |team|
      if team.seasons.keys.include?(season)
        if team.seasons[season].preseason[:games] != 0 && team.seasons[season].regular[:games] != 0
          season_teams << team
        end
      end
    end
    season_teams
  end

  def season_summary(season, team_id)
    team = teams_by_id[team_id]
    team.seasons[season].season_summary
  end

end
