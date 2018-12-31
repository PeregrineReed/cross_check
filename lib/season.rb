class Season
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

  def preseason_win_percentage
    (@preseason[:wins] / @preseason[:games].to_f).round(2)
  end

  def regular_season_win_percentage
    (@regular[:wins] / @regular[:games].to_f).round(2)
  end

  def preseason_average_goals(type)
    (@preseason[type] / @preseason[:games].to_f).round(2)
  end

  def regular_season_average_goals(type)
    (@regular[type] / @regular[:games].to_f).round(2)
  end

  def win_differential
    (regular_season_win_percentage - preseason_win_percentage).round(2)
  end

  def season_summary
    summary = {}
    preseason_sum = {}
    regular_sum = {}
    preseason_sum[:win_percentage] = preseason_win_percentage
    preseason_sum[:goals_scored] = @preseason[:goals]
    preseason_sum[:goals_against] = @preseason[:goals_against]
    regular_sum[:win_percentage] = regular_season_win_percentage
    regular_sum[:goals_scored] = @regular[:goals]
    regular_sum[:goals_against] = @regular[:goals_against]

    summary[:preseason] = preseason_sum
    summary[:regular_season] = regular_sum

    return summary
  end

end
