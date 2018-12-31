require './lib/season'

class StatSorter

  attr_reader :games,
              :teams

  def initialize(games, teams)
    @games = games
    @teams = teams
  end

  def teams_by_id
    teams = {}
    @teams.each do |team|
      teams[team.team_id] = team
    end
    teams
  end

  def list_team_ids_in_games(games)
    team_ids = []
    games.each do |game|
      team_ids << game.home_team_id
      team_ids << game.away_team_id
    end
    team_ids.uniq.sort!
  end

  def games_by_season
    @games.group_by do |game|
      game.season
    end
  end

  def add_seasons_to_teams
    games_by_season.each do |season, games|
      list_team_ids_in_games(games).each do |team_id|
        team = teams_by_id[team_id]
        team.seasons[season] = Season.new(season)
      end
    end
  end

  def update_stats
    @games.each do |game|
      if game.type == "P"
        preseason_home(game)
        preseason_away(game)
      elsif game.type == "R"
        regular_home(game)
        regular_away(game)
      end
      home_team(game)
      away_team(game)
    end
  end

  def preseason_home(game)
    team = teams_by_id[game.home_team_id]

    team.seasons[game.season].preseason[:goals] += game.home_goals
    team.seasons[game.season].preseason[:games] += 1
    team.seasons[game.season].preseason[:goals_against] += game.away_goals

    team.history[:preseason][:goals] += game.home_goals
    team.history[:preseason][:games] += 1
    team.history[:preseason][:goals_against] += game.away_goals

    if game.home_goals > game.away_goals
      team.seasons[game.season].preseason[:wins] += 1
      team.history[:preseason][:wins] += 1
    end
  end

  def preseason_away(game)
    team = teams_by_id[game.away_team_id]

    team.seasons[game.season].preseason[:goals] += game.away_goals
    team.seasons[game.season].preseason[:games] += 1
    team.seasons[game.season].preseason[:goals_against] += game.home_goals

    team.history[:preseason][:goals] += game.away_goals
    team.history[:preseason][:games] += 1
    team.history[:preseason][:goals_against] += game.home_goals
    if game.away_goals > game.home_goals
      team.seasons[game.season].preseason[:wins] += 1
      team.history[:preseason][:wins] += 1
    end
  end

  def regular_home(game)
    team = teams_by_id[game.home_team_id]

    team.seasons[game.season].regular[:goals] += game.home_goals
    team.seasons[game.season].regular[:games] += 1
    team.seasons[game.season].regular[:goals_against] += game.away_goals

    team.history[:regular][:goals] += game.home_goals
    team.history[:regular][:games] += 1
    team.history[:regular][:goals_against] += game.away_goals

    if game.home_goals > game.away_goals
      team.seasons[game.season].regular[:wins] += 1
      team.history[:regular][:wins] += 1

    end
  end

  def regular_away(game)
    team = teams_by_id[game.away_team_id]

    team.seasons[game.season].regular[:goals] += game.away_goals
    team.seasons[game.season].regular[:games] += 1
    team.seasons[game.season].regular[:goals_against] += game.home_goals

    team.history[:regular][:goals] += game.away_goals
    team.history[:regular][:games] += 1
    team.history[:regular][:goals_against] += game.home_goals

    if game.away_goals > game.home_goals
      team.seasons[game.season].regular[:wins] += 1
      team.history[:regular][:wins] += 1
    end
  end

  def home_team(game)
    team = teams_by_id[game.home_team_id]

    team.history[:home][:goals] += game.home_goals
    team.history[:home][:games] += 1
    team.history[:home][:goals_against] += game.away_goals
    if game.home_goals > game.away_goals
      team.history[:home][:wins] += 1
    end
  end

  def away_team(game)
    team = teams_by_id[game.away_team_id]

    team.history[:away][:goals] += game.away_goals
    team.history[:away][:games] += 1
    team.history[:away][:goals_against] += game.home_goals
    if game.away_goals > game.home_goals
      team.history[:away][:wins] += 1
    end
  end

end
