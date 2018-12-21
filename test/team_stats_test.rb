rrequire './test/test_helper'
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



  # def test_it_calculates_team_league_away_average_goals
  #   assert_equal 2, @team_stats.league_away_average_goals(@team_1)
  # end
  #
  # def test_it_calculates_team_league_home_average_goals
  #   assert_equal 4, @team_stats.league_home_average_goals(@team_4)
  # end
  #
  # def test_it_calculates_team_league_win_percentage
  #   assert_equal 0.0, @team_stats.league_win_percentage(@team_1)
  #   assert_equal 1.0, @team_stats.league_win_percentage(@team_4)
  # end
  #
  # def test_it_calculates_team_home_league_win_percentage
  #   assert_equal 0.0, @team_stats.league_home_win_percentage(@team_1)
  #   assert_equal 1.0, @team_stats.league_home_win_percentage(@team_4)
  # end
  #
  # def test_it_calculates_team_away_league_win_percentage
  #   assert_equal 0.0, @team_stats.league_away_win_percentage(@team_1)
  #   assert_equal 1.0, @team_stats.league_away_win_percentage(@team_4)
  # end
  #
  # def test_it_calculates_fan_rating
  #   assert_equal 0.0, @team_stats.league_win_percentage(@team_1)
  #   assert_equal 1.0, @team_stats.league_win_percentage(@team_4)
  # end


end
