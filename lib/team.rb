class Team

  attr_reader :team_info,
              :team_id,
              :franchise_id,
              :short_name,
              :team_name,
              :abbreviation,
              :link

  attr_accessor :home_wins_league,
                :away_wins_league

  def initialize(data)
    @team_info = data
    @team_id = data[:team_id]
    @franchise_id = data[:franchise_id]
    @short_name = data[:short_name]
    @team_name = data[:team_name]
    @abbreviation = data[:abbreviation]
    @link = data[:link]
    @home_wins_league = 0
    @away_wins_league = 0
  end

  def total_wins_league
    home_wins_league + away_wins_league
  end
end
