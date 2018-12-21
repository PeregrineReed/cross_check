class LeagueStats
  attr_accessor :games, :teams

  def initialize(games, teams)
    @games = games
    @teams = teams
  end

  def sort_total_league_games
    @teams.each do |team|
      @games.each do |game|
        if game.home_team_id == team.team_id
          home_team_league_stat_collector(team, game)
        elsif game.away_team_id == team.team_id
          away_team_league_stat_collector(team, game)
        end
      end
    team_league_totals(team)
    end
  end

  def home_team_league_stat_collector(team, game)
    team.home_goals_league += game.home_goals
    team.total_games_league += 1
    team.home_games_league += 1
    team.total_goals_allowed_league += game.away_goals
    if game.home_goals > game.away_goals
      team.home_wins_league += 1
    end
  end

  def away_team_league_stat_collector(team, game)
    team.away_goals_league += game.away_goals
    team.total_games_league += 1
    team.away_games_league += 1
    team.total_goals_allowed_league += game.home_goals
    if game.away_goals > game.home_goals
      team.away_wins_league += 1
    end
  end

  def team_league_totals(team)
    team.total_wins_league = team.home_wins_league + team.away_wins_league
    team.total_games_league = team.home_games_league + team.away_games_league
    team.total_goals_league = team.home_goals_league + team.away_goals_league
  end

  def highest_offense
    @teams.max_by do |team|
      if team.calculate_offense.class != Float
        next
      else
        team.calculate_offense
      end
    end.team_name
  end

  def lowest_offense
    @teams.min_by do |team|
      team.calculate_offense
    end.team_name
  end

  def highest_defense
    @teams.max_by do |team|
      team.calculate_defense
    end.team_name
  end

  def lowest_defense
    @teams.min_by do |team|
      team.calculate_defense
    end.team_name
  end


  def highest_scoring_when_away
    @teams.max_by do |team|
      team.league_away_average_goals
    end.team_name
  end


  def highest_scoring_when_home
    @teams.max_by do |team|
      team.league_home_average_goals
    end.team_name
  end

  def lowest_scoring_when_away
    @teams.min_by do |team|
      team.league_away_average_goals
    end.team_name
  end

  def lowest_scoring_when_home
    @teams.min_by do |team|
      team.league_home_average_goals
    end.team_name
  end

  def highest_win_percentage
    @teams.max_by do |team|
      team.league_win_percentage
    end.team_name
  end

  def highest_fans_rating
    @teams.max_by do |team|
      team.fans_rating
    end.team_name
  end

  def bad_fan_teams
    bad_fans = []
    @teams.each do |team|
      if team.fans_rating < 0
        bad_fans << team.team_name
      end
    end
    bad_fans
  end

end
