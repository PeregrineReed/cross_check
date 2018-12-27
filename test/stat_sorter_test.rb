require './test/test_helper'
require './lib/stat_sorter'

class StatSorterTest < Minitest::Test

  def setup
    @game_1 = mock
    @game_2 = mock
    @game_3 = mock
    @game_4 = mock
    @game_5 = mock

    @games = [
      @game_1, # teams 1, 2
      @game_2, # teams 3, 4
      @game_3, # teams 5, 1
      @game_4, # teams 2, 3
      @game_5, # teams 4, 5
    ]

    @game_1.stubs(
      :type => "P",
      :home_team_id => "1",
      :away_team_id => "2",
      :home_goals => 2,
      :away_goals => 3
    )
    @game_2.stubs(
      :type => "P",
      :home_team_id => "3",
      :away_team_id => "4",
      :home_goals => 4,
      :away_goals => 2
    )
    @game_3.stubs(
      :type => "R",
      :home_team_id => "5",
      :away_team_id => "1",
      :home_goals => 2,
      :away_goals => 4
    )
    @game_4.stubs(
      :type => "R",
      :home_team_id => "2",
      :away_team_id => "3",
      :home_goals => 3,
      :away_goals => 1
    )
    @game_5.stubs(
      :type => "R",
      :home_team_id => "4",
      :away_team_id => "5",
      :home_goals => 1,
      :away_goals => 2
    )

    @team_1 = mock
    @team_2 = mock
    @team_3 = mock
    @team_4 = mock
    @team_5 = mock

    @teams = [
      @team_1,
      @team_2,
      @team_3,
      @team_4,
      @team_5
    ]

    @team_1_home = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }
    @team_1_away = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }
    @team_1_preseason = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }
    @team_1_regular = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }
    @team_2_home = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }
    @team_2_away = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }
    @team_2_preseason = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }
    @team_2_regular = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }
    @team_3_home = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }
    @team_3_away = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }
    @team_3_preseason = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }
    @team_3_regular = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }
    @team_4_home = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }
    @team_4_away = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }
    @team_4_preseason = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }
    @team_4_regular = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }
    @team_5_home = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }
    @team_5_away = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }
    @team_5_preseason = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }
    @team_5_regular = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }

    @team_1.stubs(
      :team_id => "1",
      :home => @team_1_home,
      :away => @team_1_away,
      :preseason => @team_1_preseason,
      :regular => @team_1_regular
    )
    @team_2.stubs(
      :team_id => "2",
      :home => @team_2_home,
      :away => @team_2_away,
      :preseason => @team_2_preseason,
      :regular => @team_2_regular
    )
    @team_3.stubs(
      :team_id => "3",
      :home => @team_3_home,
      :away => @team_3_away,
      :preseason => @team_3_preseason,
      :regular => @team_3_regular
    )
    @team_4.stubs(
      :team_id => "4",
      :home => @team_4_home,
      :away => @team_4_away,
      :preseason => @team_4_preseason,
      :regular => @team_4_regular
    )
    @team_5.stubs(
      :team_id => "5",
      :home => @team_5_home,
      :away => @team_5_away,
      :preseason => @team_5_preseason,
      :regular => @team_5_regular
    )

    @stat_sorter = StatSorter.new(@games, @teams)
  end

  def test_it_exists
    assert_instance_of StatSorter, @stat_sorter
  end

  def test_it_has_attributes
    assert_equal @games, @stat_sorter.games
    assert_equal @teams, @stat_sorter.teams
  end

  def test_it_can_group_teams_by_id
    expected = {
      "1" => @team_1,
      "2" => @team_2,
      "3" => @team_3,
      "4" => @team_4,
      "5" => @team_5
    }

    assert_equal expected, @stat_sorter.teams_by_id
  end

  def test_it_can_update_home_game_stats
    expected = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }
    assert_equal expected, @team_1.home
    expected = {
      wins: 0,
      goals: 2,
      games: 1,
      goals_against: 3
    }
    @stat_sorter.preseason_home(@game_1)
    @stat_sorter.home_team(@game_1)
    assert_equal expected, @team_1.home
  end

  def test_it_can_update_away_game_stats
    expected = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }
    assert_equal expected, @team_2.away

    expected = {
      wins: 1,
      goals: 3,
      games: 1,
      goals_against: 2
    }
    @stat_sorter.preseason_away(@game_1)
    @stat_sorter.away_team(@game_1)
    assert_equal expected, @team_2.away
  end

  def test_it_can_update_preseason_home_game_stats
    expected = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }
    assert_equal expected, @team_1.preseason

    expected = {
      wins: 0,
      goals: 2,
      games: 1,
      goals_against: 3
    }
    @stat_sorter.preseason_home(@game_1)
    assert_equal expected, @team_1.preseason
  end

  def test_it_can_update_preseason_home_game_stats
    expected = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }
    assert_equal expected, @team_1.preseason

    expected = {
      wins: 1,
      goals: 3,
      games: 1,
      goals_against: 2
    }
    @stat_sorter.preseason_away(@game_1)
    assert_equal expected, @team_2.preseason
  end

  def test_it_can_update_regular_home_games
    expected = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }
    assert_equal expected, @team_5.regular

    expected = {
      wins: 0,
      goals: 2,
      games: 1,
      goals_against: 4
    }
    @stat_sorter.regular_home(@game_3)
    assert_equal expected, @team_5.regular
  end

  def test_it_can_update_regular_away_games
    expected = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }
    assert_equal expected, @team_1.regular

    expected = {
      wins: 1,
      goals: 4,
      games: 1,
      goals_against: 2
    }
    @stat_sorter.regular_away(@game_3)
    assert_equal expected, @team_1.regular
  end

end
