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

end
