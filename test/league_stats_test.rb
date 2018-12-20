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
   @team_3.stubs(:total_goals_league).returns(0)
   @team_3.stubs(:total_games_league).returns(0)
   @team_3.stubs(:home_games_league).returns(0)
   @team_3.stubs(:away_games_league).returns(0)
   @team_3.stubs(:home_goals_league).returns(0)
   @team_3.stubs(:away_goals_league).returns(0)
   @team_3.stubs(:home_wins_league).returns(0)
   @team_3.stubs(:away_wins_league).returns(0)
   @team_3.stubs(:offense).returns(0)
   @team_3.stubs(:total_goals_allowed_league).returns(0)

   @team_6.stubs(:team_id).returns("6")
   @team_6.stubs(:teamName).returns("Bruins")
   @team_6.stubs(:total_goals_league).returns(0)
   @team_6.stubs(:total_games_league).returns(0)
   @team_6.stubs(:home_games_league).returns(0)
   @team_6.stubs(:away_games_league).returns(0)
   @team_6.stubs(:home_goals_league).returns(0)
   @team_6.stubs(:away_goals_league).returns(0)
   @team_6.stubs(:home_wins_league).returns(0)
   @team_6.stubs(:away_wins_league).returns(0)
   @team_6.stubs(:offense).returns(0)
   @team_6.stubs(:total_goals_allowed_league).returns(0)

   @team_10.stubs(:team_id).returns("10")
   @team_10.stubs(:teamName).returns("Maple Leafs")
   @team_10.stubs(:total_goals_league).returns(0)
   @team_10.stubs(:total_games_league).returns(0)
   @team_10.stubs(:home_games_league).returns(0)
   @team_10.stubs(:away_games_league).returns(0)
   @team_10.stubs(:home_goals_league).returns(0)
   @team_10.stubs(:away_goals_league).returns(0)
   @team_10.stubs(:home_wins_league).returns(0)
   @team_10.stubs(:away_wins_league).returns(0)
   @team_10.stubs(:offense).returns(0)
   @team_10.stubs(:total_goals_allowed_league).returns(0)

   @team_12.stubs(:team_id).returns("12")
   @team_12.stubs(:teamName).returns("Hurricanes")
   @team_12.stubs(:total_goals_league).returns(0)
   @team_12.stubs(:total_games_league).returns(0)
   @team_12.stubs(:home_games_league).returns(0)
   @team_12.stubs(:away_games_league).returns(0)
   @team_12.stubs(:home_goals_league).returns(0)
   @team_12.stubs(:away_goals_league).returns(0)
   @team_12.stubs(:home_wins_league).returns(0)
   @team_12.stubs(:away_wins_league).returns(0)
   @team_12.stubs(:offense).returns(0)
   @team_12.stubs(:total_goals_allowed_league).returns(0)

   @team_13.stubs(:team_id).returns("13")
   @team_13.stubs(:teamName).returns("Panthers")
   @team_13.stubs(:total_goals_league).returns(0)
   @team_13.stubs(:total_games_league).returns(0)
   @team_13.stubs(:home_games_league).returns(0)
   @team_13.stubs(:away_games_league).returns(0)
   @team_13.stubs(:home_goals_league).returns(0)
   @team_13.stubs(:away_goals_league).returns(0)
   @team_13.stubs(:home_wins_league).returns(0)
   @team_13.stubs(:away_wins_league).returns(0)
   @team_13.stubs(:offense).returns(0)
   @team_13.stubs(:total_goals_allowed_league).returns(0)

   @team_14.stubs(:team_id).returns("14")
   @team_14.stubs(:teamName).returns("Lightning")
   @team_14.stubs(:total_goals_league).returns(:total_goals_league)
   @team_14.stubs(:total_games_league).returns(0)
   @team_14.stubs(:home_games_league).returns(0)
   @team_14.stubs(:away_games_league).returns(0)
   @team_14.stubs(:home_goals_league).returns(0)
   @team_14.stubs(:away_goals_league).returns(0)
   @team_14.stubs(:home_wins_league).returns(0)
   @team_14.stubs(:away_wins_league).returns(0)
   @team_14.stubs(:offense).returns(0)
   @team_14.stubs(:total_goals_allowed_league).returns(0)

   @team_23.stubs(:team_id).returns("23")
   @team_23.stubs(:teamName).returns("Canucks")
   @team_23.stubs(:total_goals_league).returns(0)
   @team_23.stubs(:total_games_league).returns(0)
   @team_23.stubs(:home_games_league).returns(0)
   @team_23.stubs(:away_games_league).returns(0)
   @team_23.stubs(:home_goals_league).returns(0)
   @team_23.stubs(:away_goals_league).returns(0)
   @team_23.stubs(:home_wins_league).returns(0)
   @team_23.stubs(:away_wins_league).returns(0)
   @team_23.stubs(:offense).returns(0)
   @team_23.stubs(:total_goals_allowed_league).returns(0)

   @team_52.stubs(:team_id).returns("52")
   @team_52.stubs(:teamName).returns("Jets")
   @team_52.stubs(:total_goals_league).returns(0)
   @team_52.stubs(:total_games_league).returns(0)
   @team_52.stubs(:home_games_league).returns(0)
   @team_52.stubs(:away_games_league).returns(0)
   @team_52.stubs(:home_goals_league).returns(0)
   @team_52.stubs(:away_goals_league).returns(0)
   @team_52.stubs(:home_wins_league).returns(0)
   @team_52.stubs(:away_wins_league).returns(0)
   @team_52.stubs(:offense).returns(0)
   @team_52.stubs(:total_goals_allowed_league).returns(0)

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

  #TeamStats test
  def test_it_adds_team_total_league_game
    @team_3.total_games_league = 3
    add_league_game(@team_3)

    assert_equal 4, @team_stats.total_games_league(@team_3)
  end






  def test_it_calcs_total_league_games_per_team
    @league_stats.sort_total_league_games

    assert_equal 3, @league_stats.team_3.total_games_league
  end




  #TeamStats test
  def test_it_calculates_offense
    assert_equal 1.66, @team_stats.calculate_offense(@team_3)
  end

  def test_it_calculates_highest_offense
    assert_equal "Lightning", @league_stats.highest_offense
  end

  def test_it_calculates_highest_offense
    assert_equal "Panthers", @league_stats.lowest_offense
  end

  #TeamStats test
  def test_it_calculates_defense
    assert_equal 1.66, @team_stats.calculate_defense(@team_3)
  end

  def test_it_calculates_highest_defense
    assert_equal "Lightning", @league_stats.highest_defense
  end

  def test_it_calculates_highest_defense
    assert_equal "Panthers", @league_stats.lowest_defense
  end

  #TeamStats test
  def test_it_calculates_team_league_away_average_goals
    assert_equal 2, @team_stats.league_away_average_goals(@team_3)
  end

  #TeamStats test
  def test_it_calculates_team_league_home_average_goals
    assert_equal 4, @team_stats.league_home_average_goals(@team_6)
  end

  def test_it_calculates_highest_scoring_away_team
    assert_equal "", @league_stats.highest_scoring_when_away
  end

  def test_it_calculates_highest_scoring_home_team
    assert_equal "", @league_stats.highest_scoring_when_home
  end

  def test_it_calculates_lowest_scoring_away_team
    assert_equal "", @league_stats.lowest_scoring_when_away
  end

  def test_it_calculates_lowest_scoring_home_team
    assert_equal "", @league_stats.lowest_scoring_when_home
  end

  #TeamStats test
  def test_it_calculates_team_league_win_percentage
    assert_equal 0.0, @team_stats.league_win_percentage(@team_3)
    assert_equal 1.0, @team_stats.league_win_percentage(@team_6)
  end

  def test_it_calculates_highest_league_win_percentage
    assert_equal "Bruins", @league_stats.highest_win_percentage
  end

  # def test_it_calculates_highest_scoring_away_team
  #   skip
  #   assert_equal , @league_stats.high_scoring_away_team
  # end
  #
  # def test_it_calculates_highest_scoring_home_team
  #   skip
  #   assert_equal , @league_stats.high_scoring_home_team
  # end

end
