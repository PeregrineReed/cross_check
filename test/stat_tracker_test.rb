require './test/test_helper'
require './lib/stat_tracker'
require 'csv'

class StatTrackerTest < Minitest::Test

  def setup
    game_path = './data/game_test.csv'
    team_path = './data/team_info_test.csv'
    game_teams_path = './data/game_teams_stats_test.csv'

    @files = {
    games: game_path,
    teams: team_path,
    game_teams: game_teams_path
    }

    @stat_tracker = StatTracker.new(@files)
  end

  def test_it_exists

    assert_instance_of StatTracker, @stat_tracker
  end

  def test_it_can_make_an_instance_with_info
    assert_equal "./data/game_test.csv", @stat_tracker.files[:games]
  end

end
