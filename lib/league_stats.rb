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
          team.total_goals_league += game.home_goals
          team.home_goals_league += game.home_goals
          #team.total_games_league += 1
          add_league_game(team)
          team.home_games_league += 1
          if game.home_goals > game.away_goals
            team.home_wins_league += 1
          elsif game.home_goals < game.away_goals
            team.total_goals_allowed_league += game.away_goals
          end
        elsif game.away_team_id == team.team_id
          team.total_goals_league += game.away_goals
          team.away_goals_league += game.away_goals
          #team.total_games_league += 1
          add_league_game(team)
          team.away_games_league += 1
          if game.away_goals > game.home_goals
            team.away_wins_league += 1
          elsif game.away_goals < game.home_goals
            team.total_goals_allowed_league += game.home_goals
          end
        end
      end
    end
  end

  def add_league_game(team)
    team.total_games_league += 1
  end

  #Team Stat method
  def calculate_offense(team)
    team.total_goals_league / team.total_games_league
  end

  def highest_offense
    @teams.max_by do |team|
      calculate_offense(team)
    end
    team.teamName
  end

  def lowest_offense
    @teams.min_by do |team|
      calculate_offense(team)
    end
    team.teamName
  end

  #Team Stat method
  def calculate_defense(team)
    team.total_goals_allowed_league / team.total_games_league
  end

  def highest_defense
    @teams.max_by do |team|
      calculate_defense(team)
    end
    team.teamName
  end

  def lowest_defense
    @teams.min_by do |team|
      calculate_defense(team)
    end
    team.teamName
  end

  #Team stat method
  def league_away_average_goals(team)
    team.away_goals_league / team.total_games_league
  end

  #Team stat method
  def league_home_average_goals(team)
    team.away_goals_league / team.total_games_league
  end

  def highest_scoring_when_away
    @teams.max_by do |team|
      team_stats.league_away_average_goals
    end.teamName
  end

  def highest_scoring_when_home
    @teams.max_by do |team|
      team_stats.league_home_average_goals
    end.teamName
  end

  def lowest_scoring_when_away
    @teams.min_by do |team|
      team_stats.league_away_average_goals
    end.teamName
  end

  def lowest_scoring_when_home
    @teams.min_by do |team|
      team_stats.league_home_average_goals
    end.teamName
  end


  #Team stat method
  def league_win_percentage(team)
    team.total_wins_league / team.total_games_league
  end
  #Team stat method
  def league_home_win_percentage(team)
    team.home_wins_league / team.total_games_league
  end
  #Team stat method
  def league_away_win_percentage(team)
    team.away_wins_league / team.total_games_league
  end

  def highest_league_win_percentage
    @teams.max_by do |team|
      team_stats.league_win_percentage(team)
    end.teamName
  end

  #Team stat method
  def fans_rating(team)
    team_stats.league_home_win_percentage(team) - team_stats.league_away_win_percentage(team)
  end

  def highest_fans_rating
    @teams.max_by do |team|
      team_stats.fans_rating(team)
    end.teamName
  end

  def bad_fan_teams
    bad_fans = []
    @teams.each do |team|
      if team_stats.fans_rating(team) < 0
        bad_fans << team.teamName
      end
    end
    bad_fans
  end





end
