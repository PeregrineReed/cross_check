class SeasonStats
  attr_reader :season_id
  attr_accessor :preseason, :regular

  def initialize(season_id)
    @season_id = season_id
    @preseason = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }
    @regular = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }
  end


  # def games_by_season
  #   @games.group_by do |game|
  #     game.season
  #   end
  # end



  #
  # def team_ids_by_season
  #   season_teams = []
  #   games_by_season.each do |season, games|
  #     games.each do |game|
  #       season_teams << game.away_team_id
  #       season_teams << game.home_team_id
  #       season_teams[season] = season_teams.uniq!.sort!
  #   end
  #   season_teams
  # end
  #
  # def season_teams
  #   team_ids_by_season.each do |season, team_ids|
  #     season_teams
  #     @team_ids.each do |team_id|
  #       @team_data.each do |team|
  #         if team[:team_id] == team_id
  #           season_teams << Team.new(team)
  #
  # end
  #
  # def make_seasons
  #   games_by_season.each do |season, games|
  #     teams = season_teams[]
  #     Season.new(season.to_sym, teams, games)
  #   end
  # end
  #
  # end


end
