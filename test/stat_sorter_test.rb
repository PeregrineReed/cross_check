require './test/test_helper'
require './lib/stat_sorter'

class StatSorterTest < Minitest::Test

  def setup
    game_1 = mock
    game_2 = mock
    game_3 = mock
    game_4 = mock
    game_5 = mock

    games = [
      game_1, # teams 1, 2
      game_2, # teams 3, 4
      game_3, # teams 5, 1
      game_4, # teams 2, 3
      game_5, # teams 4, 5
    ]

    team_1 = mock
    team_2 = mock
    team_3 = mock
    team_4 = mock
    team_5 = mock

    teams = [
      team_1,
      team_2,
      team_3,
      team_4,
      team_5
    ]

    team_1.stubs(:team_id => "1")
    team_2.stubs(:team_id => "2")
    team_3.stubs(:team_id => "3")
    team_4.stubs(:team_id => "4")
    team_5.stubs(:team_id => "5")

    @stat_sorter = StatSorter.new(games, teams)
  end

  def test_it_exists
    assert_instance_of StatSorter, @stat_sorter
  end

  def test_it_can_group_teams_by_id
    expected = {
      "1" => team_1,
      "2" => team_2,
      "3" => team_3,
      "4" => team_4,
      "5" => team_5
    }

    assert_equal expected, @stat_sorter.teams_by_id
  end

end
