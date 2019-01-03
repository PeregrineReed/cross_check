class Team

  attr_reader :team_info,
              :team_id,
              :franchise_id,
              :short_name,
              :team_name,
              :abbreviation,
              :link

  attr_accessor :seasons,
                :history

  def initialize(data)
    @team_id = data[:team_id]
    @franchise_id = data[:franchiseid]
    @short_name = data[:shortname]
    @team_name = data[:teamname]
    @abbreviation = data[:abbreviation]
    @link = data[:link]

    @team_info = {
                  "team_id"=> @team_id,
                  "franchise_id"=> @franchise_id,
                  "short_name"=> @short_name,
                  "team_name"=> @team_name,
                  "abbreviation"=> @abbreviation,
                  "link"=> @link
                }

    @seasons = {}
    @history = {
                home: {
                  wins: 0,
                  goals: 0,
                  games: 0,
                  goals_against: 0
                  },
                away: {
                  wins: 0,
                  goals: 0,
                  games: 0,
                  goals_against: 0
                  },
                preseason: {
                  wins: 0,
                  goals: 0,
                  games: 0,
                  goals_against: 0
                  },
                regular: {
                  wins: 0,
                  goals: 0,
                  games: 0,
                  goals_against: 0
                  },
                }
  end

  def total
    {
      wins: history[:home][:wins] + history[:away][:wins],
      goals: history[:home][:goals] + history[:away][:goals],
      games: history[:home][:games] + history[:away][:games],
      goals_against: history[:home][:goals_against] + history[:away][:goals_against]
    }
  end

  def win_percentage(type)
    (type[:wins] / type[:games].to_f).round(2)
  end

  def fans_rating
    (win_percentage(history[:home]) - win_percentage(history[:away])).round(2)
  end

  def average_goals(type)
    (type[:goals] / type[:games].to_f).round(2)
  end

  def calculate_defense
    (total[:goals_against] / total[:games].to_f).round(2)
  end

end
