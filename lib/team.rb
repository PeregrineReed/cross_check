class Team

  attr_reader :team_info,
              :team_id,
              :franchise_id,
              :short_name,
              :team_name,
              :abbreviation,
              :link

  attr_accessor :home,
                :away,
                :preseason,
                :regular

  def initialize(data)
    @team_info = data
    @team_id = data[:team_id]
    @franchise_id = data[:franchiseid]
    @short_name = data[:shortname]
    @team_name = data[:teamname]
    @abbreviation = data[:abbreviation]
    @link = data[:link]

    @home = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }
    @away = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }
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

  def total
    {
      wins: @home[:wins] + @away[:wins],
      goals: @home[:goals] + @away[:goals],
      games: @home[:games] + @away[:games],
      goals_against: @home[:goals_against] + @away[:goals_against]
    }
  end

  def win_percentage(type)
    (type[:wins] / type[:games].to_f).round(2)
  end

  def fans_rating
    (win_percentage(home) - win_percentage(away)).round(2)
  end

  def average_goals(type)
    (type[:goals] / type[:games].to_f).round(2)
  end

  def calculate_defense
    (total[:goals_against] / total[:games].to_f).round(2)
  end

end
