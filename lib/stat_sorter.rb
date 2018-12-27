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

  def preseason_home(game)
    team = teams_by_id[game.home_team_id]
    
    team.preseason[:goals] += game.home_goals
    team.preseason[:games] += 1
    team.preseason[:goals_against] += game.away_goals

    if game.home_goals > game.away_goals
      team.preseason[:wins] += 1
    end
  end

  def preseason_away(game)
    team = teams_by_id[game.away_team_id]

    team.preseason[:goals] += game.away_goals
    team.preseason[:games] += 1
    team.preseason[:goals_against] += game.home_goals

    if game.away_goals > game.home_goals
      team.preseason[:wins] += 1
    end
  end

  def regular_home(game)
    team = teams_by_id[game.home_team_id]

    team.regular[:goals] += game.home_goals
    team.regular[:games] += 1
    team.regular[:goals_against] += game.away_goals

    if game.home_goals > game.away_goals
      team.regular[:wins] += 1
    end
  end

  def regular_away(game)
    team = teams_by_id[game.away_team_id]

    team.regular[:goals] += game.away_goals
    team.regular[:games] += 1
    team.regular[:goals_against] += game.home_goals
    if game.away_goals > game.home_goals
      team.regular[:wins] += 1
    end
  end

  def home_team(game)
    team = teams_by_id[game.home_team_id]
    pre = team.preseason
    reg = team.regular

    team.home[:goals] += pre[:goals] + reg[:goals]
    team.home[:games] += pre[:games] + reg[:wins]
    team.home[:goals_against] += pre[:goals_against] + reg[:goals_against]
    team.home[:wins] += pre[:wins] + reg[:wins]
  end

  def away_team(game)
    team = teams_by_id[game.away_team_id]
    pre = team.preseason
    reg = team.regular

    team.away[:goals] += pre[:goals] + team.regular[:goals]
    team.away[:games] += pre[:games] + reg[:wins]
    team.away[:goals_against] += pre[:goals_against] + reg[:goals_against]
    team.away[:wins] += pre[:wins] + reg[:wins]
  end

end
