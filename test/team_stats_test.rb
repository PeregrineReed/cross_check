require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/team_stats'
require 'pry'

class TeamStatsTest < Minitest::Test

  def setup
    @team_3 = mock
    @team_6 = mock
    @team_10 = mock
    @team_12 = mock
    @team_13 = mock
    @team_14 = mock
    @team_23 = mock
    @team_52 = mock
    @teams = [
              @team_3,
              @team_6,
              @team_10,
              @team_12,
              @team_13,
              @team_14,
              @team_23,
              @team_52,
             ]

   @team_3.stubs(:team_id).returns("3")
   @team_3.stubs(:teamName).returns("Rangers")

   @team_6.stubs(:team_id).returns("6")
   @team_6.stubs(:teamName).returns("Bruins")

   @team_10.stubs(:team_id).returns("10")
   @team_10.stubs(:teamName).returns("Maple Leafs")

   @team_12.stubs(:team_id).returns("12")
   @team_12.stubs(:teamName).returns("Hurricanes")

   @team_13.stubs(:team_id).returns("13")
   @team_13.stubs(:teamName).returns("Panthers")

   @team_14.stubs(:team_id).returns("14")
   @team_14.stubs(:teamName).returns("Lightning")

   @team_23.stubs(:team_id).returns("23")
   @team_23.stubs(:teamName).returns("Canucks")

   @team_52.stubs(:team_id).returns("52")
   @team_52.stubs(:teamName).returns("Jets")


   @team_stats = TeamStats.new(@teams)
  end

  def test_it_exists
    assert_instance_of TeamStats, @team_stats
  end

  def test_it_has_teams
    assert_equal @teams, @team_stats.teams
  end

  def test_it_adds_team_total_league_game
    @team_3.total_games_league = 3
    add_league_game(@team_3)

    assert_equal 4, @team_stats.total_games_league(@team_3)
  end

  def test_it_calculates_offense
    assert_equal 1.66, @team_stats.calculate_offense(@team_3)
  end

  def test_it_calculates_defense
    assert_equal 1.66, @team_stats.calculate_defense(@team_3)
  end

  def test_it_calculates_team_league_away_average_goals
    assert_equal 2, @team_stats.league_away_average_goals(@team_3)
  end

  def test_it_calculates_team_league_home_average_goals
    assert_equal 4, @team_stats.league_home_average_goals(@team_6)
  end

  def test_it_calculates_team_league_win_percentage
    assert_equal 0.0, @team_stats.league_win_percentage(@team_3)
    assert_equal 1.0, @team_stats.league_win_percentage(@team_6)
  end

  def test_it_calculates_team_home_league_win_percentage
    assert_equal 0.0, @team_stats.league_home_win_percentage(@team_3)
    assert_equal 1.0, @team_stats.league_home_win_percentage(@team_6)
  end

  def test_it_calculates_team_away_league_win_percentage
    assert_equal 0.0, @team_stats.league_away_win_percentage(@team_3)
    assert_equal 1.0, @team_stats.league_away_win_percentage(@team_6)
  end

  def test_it_calculates_fan_rating
    assert_equal 0.0, @team_stats.league_win_percentage(@team_3)
    assert_equal 1.0, @team_stats.league_win_percentage(@team_6)
  end


end
