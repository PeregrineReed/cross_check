class StatSorter

  attr_reader :teams

  def initialize(games, teams)
    @teams = teams
  end

  def teams_by_id
    teams = {}
    @teams.each do |team|
      teams[team.team_id] = team
    end
    teams
  end

end
