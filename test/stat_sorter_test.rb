require './test/test_helper'
require './lib/stat_sorter'
require './lib/season'

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
      :season => "20122013",
      :home_team_id => "1",
      :away_team_id => "2",
      :home_goals => 2,
      :away_goals => 3
    )
    @game_2.stubs(
      :type => "P",
      :season => "20122013",
      :home_team_id => "3",
      :away_team_id => "4",
      :home_goals => 4,
      :away_goals => 2
    )
    @game_3.stubs(
      :type => "R",
      :season => "20122013",
      :home_team_id => "5",
      :away_team_id => "1",
      :home_goals => 2,
      :away_goals => 4
    )
    @game_4.stubs(
      :type => "R",
      :season => "20132014",
      :home_team_id => "2",
      :away_team_id => "3",
      :home_goals => 3,
      :away_goals => 1
    )
    @game_5.stubs(
      :type => "R",
      :season => "20132014",
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
      :seasons => {},
      :history => {
        :home => @team_1_home,
        :away => @team_1_away,
        :preseason => @team_1_preseason,
        :regular => @team_1_regular
        }
    )
    @team_2.stubs(
      :team_id => "2",
      :seasons => {},
      :history => {
        :home => @team_2_home,
        :away => @team_2_away,
        :preseason => @team_2_preseason,
        :regular => @team_2_regular
        }
    )
    @team_3.stubs(
      :team_id => "3",
      :seasons => {},
      :history => {
        :home => @team_3_home,
        :away => @team_3_away,
        :preseason => @team_3_preseason,
        :regular => @team_3_regular
        }
    )
    @team_4.stubs(
      :team_id => "4",
      :seasons => {},
      :history => {
        :home => @team_4_home,
        :away => @team_4_away,
        :preseason => @team_4_preseason,
        :regular => @team_4_regular
        }
    )
    @team_5.stubs(
      :team_id => "5",
      :seasons => {},
      :history => {
        :home => @team_5_home,
        :away => @team_5_away,
        :preseason => @team_5_preseason,
        :regular => @team_5_regular
        }
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

  def test_it_can_group_team_ids_in_select_games
    games_2 = [@game_1, @game_2]

    assert_equal ["1", "2", "3", "4"], @stat_sorter.list_team_ids_in_games(games_2)
  end

  def test_it_can_group_games_by_team
    expected = {
                "1" => [@game_1, @game_3],
                "2" => [@game_4, @game_1],
                "3" => [@game_2, @game_4],
                "4" => [@game_5, @game_2],
                "5" => [@game_3, @game_5]
                }

    assert_equal expected, @stat_sorter.games_by_team
  end

  def test_it_can_group_games_by_season
    expected = {"20122013" => [@game_1, @game_2, @game_3], "20132014" => [@game_4, @game_5]}

    assert_equal expected, @stat_sorter.games_by_season
  end

  def test_it_can_add_seasons_to_teams
    @stat_sorter.add_seasons_to_teams

    assert_instance_of Season, @team_1.seasons["20122013"]
    assert_equal "20122013", @team_1.seasons["20122013"].season_id
    assert_equal 0, @team_1.seasons["20122013"].preseason[:wins]
    assert_equal 0, @team_1.seasons["20122013"].regular[:goals]
    assert_instance_of Season, @team_2.seasons["20132014"]
    assert_equal "20132014", @team_2.seasons["20132014"].season_id
    assert_equal 2, @team_2.seasons.count
  end

  def test_it_can_update_preseason_home_game_stats
    @stat_sorter.add_seasons_to_teams

    expected = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }

    assert_equal expected, @team_1.history[:home]
    assert_equal expected, @team_1.seasons["20122013"].preseason

    @stat_sorter.preseason_home(@game_1)
    @stat_sorter.home_team(@game_1)

    expected = {
      wins: 0,
      goals: 2,
      games: 1,
      goals_against: 3
    }

    assert_equal expected, @team_1.history[:home]
    assert_equal expected, @team_1.seasons["20122013"].preseason
  end

  def test_it_can_update_preseason_away_game_stats
    @stat_sorter.add_seasons_to_teams

    expected = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }

    assert_equal expected, @team_2.history[:away]
    assert_equal expected, @team_2.seasons["20122013"].preseason

    @stat_sorter.preseason_away(@game_1)
    @stat_sorter.away_team(@game_1)
    expected = {
      wins: 1,
      goals: 3,
      games: 1,
      goals_against: 2
    }

    assert_equal expected, @team_2.history[:away]
    assert_equal expected, @team_2.seasons["20122013"].preseason
  end

  def test_it_can_update_regular_season_home_games
    @stat_sorter.add_seasons_to_teams

    expected = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }

    assert_equal expected, @team_5.seasons["20122013"].regular

    @stat_sorter.regular_home(@game_3)

    expected = {
      wins: 0,
      goals: 2,
      games: 1,
      goals_against: 4
    }

    assert_equal expected, @team_5.seasons["20122013"].regular
  end

  def test_it_can_update_regular_season_away_games
    @stat_sorter.add_seasons_to_teams

    expected = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }

    assert_equal expected, @team_1.seasons["20122013"].regular

    @stat_sorter.regular_away(@game_3)

    expected = {
      wins: 1,
      goals: 4,
      games: 1,
      goals_against: 2
    }

    assert_equal expected, @team_1.seasons["20122013"].regular
  end

  def test_it_can_update_stats_with_all_games
    @stat_sorter.add_seasons_to_teams
    @stat_sorter.update_stats

    expected = {
      wins: 0,
      goals: 2,
      games: 1,
      goals_against: 3
    }
    assert_equal expected, @team_1.seasons["20122013"].preseason

    expected = {
      wins: 1,
      goals: 4,
      games: 1,
      goals_against: 2
    }
    assert_equal expected, @team_1.seasons["20122013"].regular

    expected = {
      wins: 0,
      goals: 2,
      games: 1,
      goals_against: 3
    }
    assert_equal expected, @team_1.history[:home]

    expected = {
      wins: 1,
      goals: 4,
      games: 1,
      goals_against: 2
    }
    assert_equal expected, @team_1.history[:away]

    expected = {
      wins: 1,
      goals: 3,
      games: 1,
      goals_against: 2
    }
    assert_equal expected, @team_2.seasons["20122013"].preseason

    expected = {
      wins: 1,
      goals: 3,
      games: 1,
      goals_against: 1
    }
    assert_equal expected, @team_2.seasons["20132014"].regular

    expected = {
      wins: 1,
      goals: 3,
      games: 1,
      goals_against: 1
    }
    assert_equal expected, @team_2.history[:home]

    expected = {
      wins: 1,
      goals: 3,
      games: 1,
      goals_against: 2
    }
    assert_equal expected, @team_2.history[:away]


    expected = {
      wins: 1,
      goals: 4,
      games: 1,
      goals_against: 2
    }
    assert_equal expected, @team_3.seasons["20122013"].preseason

    expected = {
      wins: 0,
      goals: 1,
      games: 1,
      goals_against: 3
    }
    assert_equal expected, @team_3.seasons["20132014"].regular

    expected = {
      wins: 1,
      goals: 4,
      games: 1,
      goals_against: 2
    }
    assert_equal expected, @team_3.history[:home]

    expected = {
      wins: 0,
      goals: 1,
      games: 1,
      goals_against: 3
    }
    assert_equal expected, @team_3.history[:away]


    expected = {
      wins: 0,
      goals: 2,
      games: 1,
      goals_against: 4
    }
    assert_equal expected, @team_4.seasons["20122013"].preseason

    expected = {
      wins: 0,
      goals: 1,
      games: 1,
      goals_against: 2
    }
    assert_equal expected, @team_4.seasons["20132014"].regular

    expected = {
      wins: 0,
      goals: 1,
      games: 1,
      goals_against: 2
    }
    assert_equal expected, @team_4.history[:home]

    expected = {
      wins: 0,
      goals: 2,
      games: 1,
      goals_against: 4
    }
    assert_equal expected, @team_4.history[:away]

    expected = {
      wins: 0,
      goals: 0,
      games: 0,
      goals_against: 0
    }
    assert_equal expected, @team_5.seasons["20122013"].preseason

    expected = {
      wins: 0,
      goals: 2,
      games: 1,
      goals_against: 4
    }
    assert_equal expected, @team_5.seasons["20122013"].regular

    expected = {
      wins: 1,
      goals: 2,
      games: 1,
      goals_against: 1
    }
    assert_equal expected, @team_5.seasons["20132014"].regular


    expected = {
      wins: 0,
      goals: 2,
      games: 1,
      goals_against: 4
    }
    assert_equal expected, @team_5.history[:home]

    expected = {
      wins: 1,
      goals: 2,
      games: 1,
      goals_against: 1
    }
    assert_equal expected, @team_5.history[:away]
  end

end
