class TeamStatSorter
  attr_accessor :games, :teams

  def initialize(games, teams)
    @games = games
    @teams = teams
  end

  def sort_team_games
    @teams.each do |team|
      @games.each do |game|
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
    team.total_goals_preseason += game.home_goals
    team.total_goals_allowed_preseason += game.away_goals
    team.total_games_preseason += 1
    if game.away_goals < game.home_goals
      team.total_wins_preseason += 1
    end
  end

  def preason_away_game_stat_collector(team, game)
    team.total_goals_preseason += game.away_goals
    team.total_goals_allowed_preseason += game.home_goals
    team.total_games_preseason += 1
    if game.away_goals > game.home_goals
      team.total_wins_preseason += 1
    end
  end


  def regular_home_game_stat_collector(team, game)
    team.home_goals_league += game.home_goals
    team.total_games_league += 1
    team.home_games_league += 1
    team.total_goals_allowed_league += game.away_goals
    if game.home_goals > game.away_goals
      team.home_wins_league += 1
    end
  end

  def regular_away_game_stat_collector(team, game)
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



end
