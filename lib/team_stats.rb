module TeamStats

  def team_info(team_id)
    team = teams_by_id[team_id]
    team.team_info
  end

  def best_season(team_id)
    team = teams_by_id[team_id]
    team.seasons.max_by do |season|
      season[1].total_win_percentage
    end[0]
  end

  def worst_season(team_id)
    team = teams_by_id[team_id]
    team.seasons.min_by do |season|
      season[1].total_win_percentage
    end[0]
  end

  def average_win_percentage(team_id)
    team = teams_by_id[team_id]
    (team.total[:wins] / team.total[:games].to_f).round(2)
  end

  def goals_scored(team_id)
    games = team_games(team_id)
    goals_scored = []
    games.each do |game|
      #If wanted to limit this to regular season games, unhide these lines
      #if game.type == "R"
        if game.home_team_id == team_id
          goals_scored << game.home_goals
        elsif game.away_team_id == team_id
          goals_scored << game.away_goals
        end
      #end
    end
    goals_scored
  end

  def most_goals_scored(team_id)
    goals_scored(team_id).max
  end

  def fewest_goals_scored(team_id)
    goals_scored(team_id).min
  end

  def list_opponents(team_id)
    games = team_games(team_id)
    opponents = []
    games.each do |game|
      if game.home_team_id == team_id
        opponents << game.away_team_id
      elsif game.away_team_id == team_id
        opponents << game.home_team_id
      end
    end
    opponents.uniq
  end

  def team_games_by_opponent(team_id, type)
    team_games = team_games(team_id)
    opponent_games = team_games.group_by do |game|
      if (type == "R" && game.type == "R") || type == "all"
        opponent_id(team_id, game)
      end
    end
    opponent_games.reject do |opponent_id, games|
      opponent_id.nil?
    end
  end

  def opponent_id(team_id, game)
    if game.home_team_id == team_id
      game.away_team_id
    elsif game.away_team_id == team_id
      game.home_team_id
    end
  end

  def win_percent_against_opponent(team_id, games)
    wins = win_count_against_opponent(team_id, games)
    (wins / games.count.to_f).round(2)
  end

  def win_count_against_opponent(team_id, games)
    wins = 0
    games.each do |game|
      if team_win?(team_id, game)
        wins += 1
      end
    end
    wins
  end

  def team_win?(team_id, game)
    (game.home_team_id == team_id && game.home_goals > game.away_goals) ||
     (game.away_team_id == team_id && game.away_goals > game.home_goals)
  end

  def favorite_opponent(team_id)
    opponent_games = team_games_by_opponent(team_id, "all")
    opponent_id = opponent_games.max_by do |opponent, games|
      win_percent_against_opponent(team_id, games)
    end[0]
    teams_by_id[opponent_id].team_name
  end

  def rival(team_id)
    opponent_games = team_games_by_opponent(team_id, "all")
    opponent_id = opponent_games.min_by do |opponent, games|
      win_percent_against_opponent(team_id, games)
    end[0]
    teams_by_id[opponent_id].team_name
  end

  def blowout_games(team_id, outcome)
    games = team_games(team_id)
    blowout_games = []
    games.each do |game|
      if outcome == "win"
        if team_win?(team_id, game)
          #&& game.type == "R"
          blowout_games << game
        end
      elsif outcome == "loss"
        if !team_win?(team_id, game)
          #&& game.type == "R"
          blowout_games << game
        end
      end
    end
    blowout_games
  end

  def biggest_team_blowout(team_id)
    games = blowout_games(team_id, "win")
    games.max_by do |game|
      game.blowout
    end.blowout
  end

  def worst_loss(team_id)
    games = blowout_games(team_id, "loss")
    games.max_by do |game|
      game.blowout
    end.blowout
  end

  def head_to_head(team_id)
    opponent_games = team_games_by_opponent(team_id, "all")
    record = {}
    opponent_games.each do |opponent_id, games|
      wins = win_count_against_opponent(team_id, games)
      opponent = teams_by_id[opponent_id]
      record[opponent.team_name] = (wins / games.count.to_f).round(2)
    end
    record
  end

  def seasonal_summary(team_id)
    team = teams_by_id[team_id]
    seasonal_summary = {}
    team.seasons.each_key do |season_id|
      seasonal_summary[season_id] = single_seasonal_summary(team, season_id)
    end
    seasonal_summary
  end

  def single_seasonal_summary(team, season)
    summary = {}
    preseason_sum = {}
    regular_sum = {}
    preseason_sum[:win_percentage] = team.seasons[season].preseason_win_percentage
    preseason_sum[:total_goals_scored] = team.seasons[season].preseason[:goals]
    preseason_sum[:total_goals_against] = team.seasons[season].preseason[:goals_against]
    preseason_sum[:average_goals_scored] = team.seasons[season].preseason_average_goals(:goals)
    preseason_sum[:average_goals_against] = team.seasons[season].preseason_average_goals(:goals_against)
    regular_sum[:win_percentage] = team.seasons[season].regular_season_win_percentage
    regular_sum[:total_goals_scored] = team.seasons[season].regular[:goals]
    regular_sum[:total_goals_against] = team.seasons[season].regular[:goals_against]
    regular_sum[:average_goals_scored] = team.seasons[season].regular_season_average_goals(:goals)
    regular_sum[:average_goals_against] = team.seasons[season].regular_season_average_goals(:goals_against)

    summary[:preseason] = preseason_sum
    summary[:regular_season] = regular_sum

    return summary
  end

end
