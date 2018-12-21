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

  # def test_it_can_count_teams
  #   assert_equal 8, @team_stats.teams.count
  # end

end
