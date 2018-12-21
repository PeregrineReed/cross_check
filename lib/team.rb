class Team

  attr_reader :team_id,
              :franchise_id,
              :short_name,
              :team_name,
              :abbreviation,
              :link

  def initialize(data)
    @team_id = data[:team_id]
    @franchise_id = data[:franchise_id]
    @short_name = data[:short_name]
    @team_name = data[:teamName]
    @abbreviation = data[:abbreviation]
    @link = data[:link]
  end
end
