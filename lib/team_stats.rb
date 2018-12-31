module TeamStats
  # attr_reader :teams
  #
  # def initialize(teams)
  #   @teams = teams
  # end

  def seasonal_summary(team_id)
    team = teams_by_id[team_id]
    seasonal_summary = {}
    team.seasons.each do |season|
      seasonal_summary[season] = single_seasonal_summary(team, season)
    end
    seasonal_summary
  end

  def single_seasonal_summary(team, season)
    summary = team.seasons[season].season_summary
    summary[:preseason][:average_goals_scored] = (team.seasons[season].preseason[:goals] / team.seasons[season].preseason[:games].to_f).round(2)
    summary[:preseason][:average_goals_against] = (team.seasons[season].preseason[:goals_against] / team.seasons[season].preseason[:games].to_f).round(2)
    summary[:regular_season][:average_goals_scored] = (team.seasons[season].regular[:goals] / team.seasons[season].regular[:games].to_f).round(2)
    summary[:regular_season][:average_goals_against] = (team.seasons[season].regular[:goals_against] / team.seasons[season].regular[:games].to_f).round(2)
    return summary
  end



end
