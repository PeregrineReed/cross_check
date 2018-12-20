class LeagueStats
  attr_reader :games, :teams

  def initialize(games, teams)
    @games = games
    @teams = teams
  end

end
