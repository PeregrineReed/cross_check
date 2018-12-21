class TeamStats
  attr_reader :teams

  def initialize(teams)
    @teams = teams
  end

  def league_win_percentage(team)
    team.total_wins_league / team.total_games_league
  end
  def league_home_win_percentage(team)
    team.home_wins_league / team.total_games_league
  end
  def league_away_win_percentage(team)
    team.away_wins_league / team.total_games_league
  end

  def fans_rating(team)
    team_stats.league_home_win_percentage(team) - team_stats.league_away_win_percentage(team)
  end

  def league_away_average_goals(team)
    team.away_goals_league / team.total_games_league
  end

  def league_home_average_goals(team)
    team.away_goals_league / team.total_games_league
  end

  def calculate_defense(team)
    team.total_goals_allowed_league / team.total_games_league
  end

  def calculate_offense(team)
    team.total_goals_league / team.total_games_league
  end

end
