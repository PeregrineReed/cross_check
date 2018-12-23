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
    @team_id = data[:team_id]
    @franchise_id = data[:franchiseid]
    @short_name = data[:shortname]
    @team_name = data[:teamname]
    @abbreviation = data[:abbreviation]
    @link = data[:link]
    @home_wins_league = 0
    @away_wins_league = 0
    
    @team_info = {
      team_id: team_id,
      franchise_id: franchise_id,
      short_name: short_name,
      team_name: team_name,
      abbreviation: abbreviation,
      link: link
    }
  end

  def total_wins_league
    home_wins_league + away_wins_league
  end
end
