class LeagueStats < StatSorter

  attr_accessor :games,
                :teams

  def initialize(games, teams)
    super(games, teams)
  end

  def highest_offense
    @teams.max_by do |team|
      team.average_goals(team.total)
    end.team_name
  end

  def lowest_offense
    @teams.min_by do |team|
      team.average_goals(team.total)
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
    teams = @teams.reject do |team|
      team.average_goals(team.away).to_s == 'NaN'
    end

    teams.max_by do |team|
      team.average_goals(team.away)
    end.team_name
  end

  def highest_scoring_when_home
    teams = @teams.reject do |team|
      team.average_goals(team.home).to_s == 'NaN'
    end

    teams.max_by do |team|
      team.average_goals(team.home)
    end.team_name
  end

  def lowest_scoring_when_away
    teams = @teams.reject do |team|
      team.average_goals(team.away).to_s == 'NaN'
    end

    teams.min_by do |team|
      team.average_goals(team.away)
    end.team_name
  end

  def lowest_scoring_when_home
    @teams.min_by do |team|
      team.average_goals(team.home)
    end.team_name
  end

  def highest_win_percentage
    @teams.max_by do |team|
      team.win_percentage(team.total)
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
