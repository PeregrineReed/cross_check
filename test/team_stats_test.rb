require './test/test_helper'
require 'mocha/minitest'
require './lib/team_stats'
require './lib/team'
require 'pry'

class TeamStatsTest < Minitest::Test

  def setup

    team_1_info = {team_id: "1",franchiseId: "23",shortName: "New Jersey",teamName: "Devils",abbreviation: "NJD",link: "/api/v1/teams/1"}
    team_4_info = {team_id: "4",franchiseId: "16",shortName: "Philadelphia",teamName: "Flyers",abbreviation: "PHI",link: "/api/v1/teams/4"}

    @team_1 = Team.new(team_1_info)
    @team_4 = Team.new(team_4_info)
    @teams = [
      @team_1,
      @team_4,
    ]

   @team_stats = TeamStats.new(@teams)

  end

  def test_it_exists
    assert_instance_of TeamStats, @team_stats
  end

  def test_it_has_teams
    assert_equal @teams, @team_stats.teams
  end

  def test_it_adds_team_total_game
    skip
    @team_1.total_games = 3
    add_game(@team_1)

    assert_equal 4, @team_stats.total_games(@team_1)
  end

  def test_it_calculates_offense
    skip
    assert_equal 1.66, @team_stats.calculate_offense(@team_1)
  end

  def test_it_calculates_defense
    skip
    assert_equal 1.66, @team_stats.calculate_defense(@team_1)
  end

  def test_it_calculates_team_away_average_goals
    skip
    assert_equal 2, @team_stats.away_average_goals(@team_1)
  end

  def test_it_calculates_team_home_average_goals
    skip
    assert_equal 4, @team_stats.home_average_goals(@team_4)
  end

  def test_it_calculates_team_win_percentage
    skip
    assert_equal 0.0, @team_stats.win_percentage(@team_1)
    assert_equal 1.0, @team_stats.win_percentage(@team_4)
  end

  def test_it_calculates_team_home_win_percentage
    skip
    assert_equal 0.0, @team_stats.home_win_percentage(@team_1)
    assert_equal 1.0, @team_stats.home_win_percentage(@team_4)
  end

  def test_it_calculates_team_away_win_percentage
    skip
    assert_equal 0.0, @team_stats.away_win_percentage(@team_1)
    assert_equal 1.0, @team_stats.away_win_percentage(@team_4)
  end

  def test_it_calculates_fan_rating
    skip
    assert_equal 0.0, @team_stats.win_percentage(@team_1)
    assert_equal 1.0, @team_stats.win_percentage(@team_4)
  end


end
