class Team

  attr_reader :team_info,
              :team_id,
              :franchise_id,
              :short_name,
              :team_name,
              :abbreviation,
              :link

attr_accessor :home_wins,
              :away_wins,
              :total_wins,

              :away_goals,
              :home_goals,
              :total_goals,

              :away_games,
              :home_games,
              :total_games,

              :total_goals_allowed,

              :preseason_wins,
              :preseason_games,
              :preseason_goals,
              :preseason_goals_allowed

  def initialize(data)
    @team_id = data[:team_id]
    @franchise_id = data[:franchiseid]
    @short_name = data[:shortname]
    @team_name = data[:teamname]
    @abbreviation = data[:abbreviation]
    @link = data[:link]


    @team_info = {
      team_id: team_id,
      franchise_id: franchise_id,
      short_name: short_name,
      team_name: team_name,
      abbreviation: abbreviation,
      link: link
    }

    #Same thing as above?
    #@team_info = {data}

    @home_wins = 0
    @away_wins = 0
    @total_wins = 0

    @away_goals = 0
    @home_goals = 0
    @total_goals = 0

    @away_games = 0
    @home_games = 0
    @total_games = 0

    @total_goals_allowed = 0

    @preseason_wins = 0
    @preseason_games = 0
    @preseason_goals = 0
    @preseason_goals_allowed = 0
  end

  def win_percentage
    (total_wins / total_games.to_f).round(2)
  end

  def home_win_percentage
    (home_wins / home_games.to_f).round(2)
  end

  def away_win_percentage
    (away_wins / away_games.to_f).round(2)
  end

  def fans_rating
    (home_win_percentage - away_win_percentage.to_f).round(2)
  end

  def away_average_goals
    (away_goals / away_games.to_f).round(2)
  end

  def home_average_goals
    (home_goals / home_games.to_f).round(2)
  end

  def calculate_offense
    (total_goals / total_games.to_f).round(2)
  end

  def calculate_defense
    (total_goals_allowed / total_games.to_f).round(2)
  end

  def preseason_win_percentage
    (preseason_wins / preseason_games.to_f).round(2)
  end

end
