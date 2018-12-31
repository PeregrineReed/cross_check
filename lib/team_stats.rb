module TeamStats
  # attr_reader :teams
  #
  # def initialize(teams)
  #   @teams = teams
  # end

  def seasonal_summary(team_id)
    team = teams_by_id[team_id]
    seasonal_summary = {}
    team.seasons.each_key do |season_id|
      seasonal_summary[season_id] = single_seasonal_summary(team, season_id)
    end
    seasonal_summary
  end

  def single_seasonal_summary(team, season)
    summary = {}
    preseason_sum = {}
    regular_sum = {}
    preseason_sum[:win_percentage] = team.seasons[season].preseason_win_percentage
    preseason_sum[:total_goals_scored] = team.seasons[season].preseason[:goals]
    preseason_sum[:total_goals_against] = team.seasons[season].preseason[:goals_against]
    preseason_sum[:average_goals_scored] = team.seasons[season].preseason_average_goals(:goals)
    preseason_sum[:average_goals_against] = team.seasons[season].preseason_average_goals(:goals_against)
    regular_sum[:win_percentage] = team.seasons[season].regular_season_win_percentage
    regular_sum[:total_goals_scored] = team.seasons[season].regular[:goals]
    regular_sum[:total_goals_against] = team.seasons[season].regular[:goals_against]
    regular_sum[:average_goals_scored] = team.seasons[season].regular_season_average_goals(:goals)
    regular_sum[:average_goals_against] = team.seasons[season].regular_season_average_goals(:goals_against)

    summary[:preseason] = preseason_sum
    summary[:regular_season] = regular_sum

    return summary
  end



end
