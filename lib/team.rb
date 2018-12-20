class Team

  attr_reader :team_info,
              :team_id,
              :franchise_id,
              :short_name,
              :team_name,
              :abbreviation,
              :link

  def initialize(data)
    @team_info = data
    @team_id = data[:team_id]
    @franchise_id = data[:franchiseId]
    @short_name = data[:shortName]
    @team_name = data[:teamName]
    @abbreviation = data[:abbreviation]
    @link = data[:link]
  end
end
