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
    @team_name = data[:team_name]
    @abbreviation = data[:abbreviation]
    @link = data[:link]
  end

  # def team_info(info)
  #   grouped_info = info.group_by do |key|
  #
  #     binding.pry
  # end
end
