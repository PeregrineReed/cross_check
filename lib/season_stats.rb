class SeasonStats < StatSorter

  attr_accessor :games,
                :teams

  def initialize(games, teams)
    super(games, teams)
  end

  # def biggest_bust(season)
  #   season_teams = []
  #   @teams.each do |team|
  #     if team.seasons.include?(season)
  #       season_teams << team
  #     end
  #   end
  #   season_teams.min_by do |team|
  #     team.seasons[season].win_differential
  #   end.team_name
  # end

  def biggest_bust(season)
    @teams.min_by do |team|
      if team.seasons[season].nil?
        next
      else
        team.seasons[season].win_differential
      end
    end.team_name
  end
end
