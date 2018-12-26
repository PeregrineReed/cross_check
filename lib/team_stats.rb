class TeamStats
  attr_reader :teams

  def initialize(teams)
    @teams = teams
  end

  #League Statistic Methods

  #Review why this doesn't work
  def highest_offense
    @teams.max_by do |team|
      # Possible alternative:
      if team.total_goals == 0 || team.total_games == 0
      # if team.calculate_offense.class != Float
      #   next
      else
        team.calculate_offense
      end
    end.team_name
  end

  def lowest_offense
    @teams.min_by do |team|
      team.calculate_offense
    end.team_name
  end

  def highest_defense
    @teams.max_by do |team|
      team.calculate_defense
    end.team_name
  end

  def lowest_defense
    @teams.min_by do |team|
      team.calculate_defense
    end.team_name
  end

  def highest_scoring_when_away
    @teams.max_by do |team|
      team.away_average_goals
    end.team_name
  end

  def highest_scoring_when_home
    @teams.max_by do |team|
      team.home_average_goals
    end.team_name
  end

  def lowest_scoring_when_away
    @teams.min_by do |team|
      team.away_average_goals
    end.team_name
  end

  def lowest_scoring_when_home
    @teams.min_by do |team|
      team.home_average_goals
    end.team_name
  end

  def highest_win_percentage
    @teams.max_by do |team|
      team.win_percentage
    end.team_name
  end

  def highest_fans_rating
    @teams.max_by do |team|
      team.fans_rating
    end.team_name
  end

  def bad_fan_teams
    bad_fans = []
    @teams.each do |team|
      if team.fans_rating < 0
        bad_fans << team.team_name
      end
    end
    bad_fans
  end

end
