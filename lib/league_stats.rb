module LeagueStats

  def best_offense
    @teams.max_by do |team|
      team.average_goals(team.total)
    end.team_name
  end

  def worst_offense
    @teams.min_by do |team|
      team.average_goals(team.total)
    end.team_name
  end

  def best_defense
    @teams.min_by do |team|
      team.calculate_defense
    end.team_name
  end

  def worst_defense
    @teams.max_by do |team|
      team.calculate_defense
    end.team_name
  end

  def highest_scoring_visitor
    teams = @teams.reject do |team|
      team.average_goals(team.history[:away]).to_s == 'NaN'
    end

    teams.max_by do |team|
      team.average_goals(team.history[:away])
    end.team_name
  end

  def highest_scoring_home_team
    teams = @teams.reject do |team|
      team.average_goals(team.history[:home]).to_s == 'NaN'
    end

    teams.max_by do |team|
      team.average_goals(team.history[:home])
    end.team_name
  end

  def lowest_scoring_visitor
    teams = @teams.reject do |team|
      team.average_goals(team.history[:away]).to_s == 'NaN'
    end

    teams.min_by do |team|
      team.average_goals(team.history[:away])
    end.team_name
  end

  def lowest_scoring_home_team
    teams = @teams.reject do |team|
      team.average_goals(team.history[:home]).to_s == 'NaN'
    end

    teams.min_by do |team|
      team.average_goals(team.history[:home])
    end.team_name
  end

  def winningest_team
    teams = @teams.reject do |team|
      team.win_percentage(team.total).to_s == 'NaN'
    end

    teams.max_by do |team|
      team.win_percentage(team.total)
    end.team_name
  end

  def best_fans
    teams = @teams.reject do |team|
      team.win_percentage(team.history[:home]).to_s == 'NaN' || team.win_percentage(team.history[:away]).to_s == 'NaN'
    end

    teams.max_by do |team|
      team.fans_rating
    end.team_name
  end

  def worst_fans
    bad_fans = []
    @teams.each do |team|
      if team.fans_rating < 0
        bad_fans << team.team_name
      end
    end
    bad_fans
  end

end
