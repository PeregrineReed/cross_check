class TeamStatSorter
  attr_accessor :games, :teams

  def initialize(games, teams)
    @games = games
    @teams = teams
  end

  def sort_team_games
    @teams.each do |team|
      @games.each do |game|
        # binding.pry
        if game.home_team_id == team.team_id
          home_team_stat_collector(team, game)
        elsif game.away_team_id == team.team_id
          away_team_stat_collector(team, game)
        end
      end
    team_league_totals(team)
    end
  end

  def home_team_stat_collector(team, game)
    if game.type == "P"
      preason_home_game_stat_collector(team, game)
    elsif game.type == "R"
      regular_home_game_stat_collector(team, game)
    end
  end

  def away_team_stat_collector(team, game)
    if game.type == "P"
      preason_away_game_stat_collector(team, game)
    elsif game.type == "R"
      regular_away_game_stat_collector(team, game)
    end
  end

  def preason_home_game_stat_collector(team, game)
    team.preseason_goals += game.home_goals
    team.preseason_goals_allowed += game.away_goals
    team.preseason_games += 1
    if game.away_goals < game.home_goals
      team.preseason_wins += 1
    end
  end

  def preason_away_game_stat_collector(team, game)
    team.preseason_goals += game.away_goals
    team.preseason_goals_allowed += game.home_goals
    team.preseason_games += 1
    if game.away_goals > game.home_goals
      team.preseason_wins += 1
    end
  end


  def regular_home_game_stat_collector(team, game)
    team.home_goals += game.home_goals
    team.total_games += 1
    team.home_games += 1
    team.total_goals_allowed += game.away_goals
    if game.home_goals > game.away_goals
      team.home_wins += 1
    end
  end

  def regular_away_game_stat_collector(team, game)
    team.away_goals += game.away_goals
    team.total_games += 1
    team.away_games += 1
    team.total_goals_allowed += game.home_goals
    if game.away_goals > game.home_goals
      team.away_wins += 1
    end
  end

  def team_league_totals(team)
    team.total_wins = team.home_wins + team.away_wins
    team.total_games = team.home_games + team.away_games
    team.total_goals = team.home_goals + team.away_goals
  end

end
