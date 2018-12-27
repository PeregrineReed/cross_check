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

  def home_team(game)
    team = teams_by_id[game.home_team_id]
    team.home[:goals] += game.home_goals
    team.home[:games] += 1
    team.home[:goals_against] += game.away_goals
    if game.home_goals > game.away_goals
      team.home[:wins] += 1
    end
  end

  def away_team(game)
    team = teams_by_id[game.away_team_id]
    team.away[:goals] += game.away_goals
    team.away[:games] += 1
    team.away[:goals_against] += game.home_goals
    if game.away_goals > game.home_goals
      team.away[:wins] += 1
    end
  end

end
