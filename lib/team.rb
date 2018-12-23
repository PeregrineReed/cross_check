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
                :total_games,
                :away_goals,
                :home_goals,
                :total_goals,
                :total_goals_allowed,
                :away_games,
                :home_games


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
    @total_wins = 0
    @total_games = 0
    @away_goals = 0
    @home_goals = 0
    @away_games = 0
    @home_games = 0
    @total_goals = 0
    @total_goals_allowed = 0
  end

  def league_win_percentage
    (total_wins / total_games.to_f).round(2)
  end

  def league_home_win_percentage
    (home_wins / home_games.to_f).round(2)
  end

  def league_away_win_percentage
    (away_wins / away_games.to_f).round(2)
  end

  def fans_rating
    (league_home_win_percentage - league_away_win_percentage.to_f).round(2)
  end

  def league_away_average_goals
    (away_goals / away_games.to_f).round(2)
  end

  def league_home_average_goals
    (home_goals / home_games.to_f).round(2)
  end

  def calculate_defense
    (total_goals_allowed / total_games.to_f).round(2)
  end

  def calculate_offense
    (total_goals / total_games.to_f).round(2)
  end
end
