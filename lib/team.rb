class Team

  attr_reader :team_info,
              :team_id,
              :franchise_id,
              :short_name,
              :team_name,
              :abbreviation,
              :link

  attr_accessor :home_wins_league,
                :away_wins_league,
                :total_wins_league,
                :total_games_league,
                :away_goals_league,
                :home_goals_league,
                :total_goals_league,
                :total_goals_allowed_league,
                :away_games_league,
                :home_games_league,
                :total_wins_preseason,
                :total_games_preseason,
                :total_goals_preseason,
                :total_goals_allowed_preseason


  def initialize(data)
    @team_id = data[:team_id]
    @franchise_id = data[:franchiseid]
    @short_name = data[:shortname]
    @team_name = data[:teamname]
    @abbreviation = data[:abbreviation]
    @link = data[:link]

    @home_wins_league = 0
    @away_wins_league = 0
    @total_wins_league = 0
    @total_games_league = 0
    @away_goals_league = 0
    @home_goals_league = 0
    @away_games_league = 0
    @home_games_league = 0
    @total_goals_league = 0
    @total_goals_allowed_league = 0

    @total_wins_preseason = 0
    @total_games_preseason = 0
    @total_goals_preseason = 0
    @total_goals_allowed_preseason = 0

  end

  def league_win_percentage
    (total_wins_league / total_games_league.to_f).round(2)
  end

  def league_home_win_percentage
    (home_wins_league / home_games_league.to_f).round(2)
  end

  def league_away_win_percentage
    (away_wins_league / away_games_league.to_f).round(2)
  end

  def fans_rating
    (league_home_win_percentage - league_away_win_percentage).round(2)
  end

  def league_away_average_goals
    (away_goals_league / away_games_league.to_f).round(2)
  end

  def league_home_average_goals
    (home_goals_league / home_games_league.to_f).round(2)
  end

  def calculate_offense
    (total_goals_league / total_games_league.to_f).round(2)
  end

  def calculate_defense
    (total_goals_allowed_league / total_games_league.to_f).round(2)
  end

  def preseason_win_percentage
    (total_wins_league / total_games_league.to_f).round(2)
  end

end
