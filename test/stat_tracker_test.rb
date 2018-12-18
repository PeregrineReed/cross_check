require 'minitest/autorun'
require 'minitest/pride'
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
  end

  def test_it_exists
    stat_tracker = StatTracker.new(@files)

    assert_instance_of StatTracker, stat_tracker
  end

  def test_it_can_make_an_instance_with_info
    stat_tracker = StatTracker.from_csv(@files)

    assert_instance_of StatTracker, stat_tracker
    assert_equal "./data/game_test.csv", stat_tracker.locations[:games]
  end

end
