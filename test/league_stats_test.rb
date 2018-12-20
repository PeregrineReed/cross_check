require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/game_stats'
require './lib/league_stats'
require 'pry'

class LeagueStatsTest < Minitest::Test

  def setup
    @game_1 = mock
    @game_2 = mock
    @game_3 = mock
    @game_4 = mock
    @game_5 = mock
    @game_6 = mock
    @games = [
              @game_1,
              @game_2,
              @game_3,
              @game_4,
              @game_5,
              @game_6
             ]

    @game_1.stubs(:season).returns("20122013")
    @game_1.stubs(:away_team_id).returns("3")
    @game_1.stubs(:home_team_id).returns("6")
    @game_1.stubs(:away_goals).returns(2)
    @game_1.stubs(:home_goals).returns(3)

    @game_2.stubs(:season).returns("20122013")
    @game_2.stubs(:away_team_id).returns("3")
    @game_2.stubs(:home_team_id).returns("6")
    @game_2.stubs(:away_goals).returns(2)
    @game_2.stubs(:home_goals).returns(5)

    @game_3.stubs(:season).returns("20122013")
    @game_3.stubs(:away_team_id).returns("6")
    @game_3.stubs(:home_team_id).returns("3")
    @game_3.stubs(:away_goals).returns(2)
    @game_3.stubs(:home_goals).returns(1)

    @game_4.stubs(:season).returns("20172018")
    @game_4.stubs(:away_team_id).returns("23")
    @game_4.stubs(:home_team_id).returns("14")
    @game_4.stubs(:away_goals).returns(2)
    @game_4.stubs(:home_goals).returns(5)

    @game_5.stubs(:season).returns("20172018")
    @game_5.stubs(:away_team_id).returns("13")
    @game_5.stubs(:home_team_id).returns("12")
    @game_5.stubs(:away_goals).returns(1)
    @game_5.stubs(:home_goals).returns(3)

    @game_6.stubs(:season).returns("20162017")
    @game_6.stubs(:away_team_id).returns("10")
    @game_6.stubs(:home_team_id).returns("52")
    @game_6.stubs(:away_goals).returns(4)
    @game_6.stubs(:home_goals).returns(5)

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


   @league_stats = LeagueStats.new(@games, @teams)
  end

  def test_it_exists
    assert_instance_of LeagueStats, @league_stats
  end

  def test_it_has_games
    assert_equal @games, @league_stats.games
  end

  def test_it_has_teams
    assert_equal @teams, @league_stats.teams
  end

  def test_it_calculates_offense
    skip
    assert_equal , @league_stats.offense
  end

  def test_it_calculates_defense
    skip
    assert_equal , @league_stats.defense
  end

  def test_it_calculates_highest_scoring_away_team
    skip
    assert_equal , @league_stats.high_scoring_away_team
  end

  def test_it_calculates_highest_scoring_home_team
    skip
    assert_equal , @league_stats.high_scoring_home_team
  end

end
