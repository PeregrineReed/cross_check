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
          team.total_games_league += 1
          team.home_games_league += 1
          if game.home_goals > game.away_goals
            team.home_wins_league += 1
          elsif game.home_goals < game.away_goals
            team.total_goals_allowed_league += game.away_goals
          end
        elsif game.away_team_id == team.team_id
          #binding.pry
          team.total_goals_league += game.away_goals
          team.away_goals_league += game.away_goals
          team.total_games_league += 1
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

end
