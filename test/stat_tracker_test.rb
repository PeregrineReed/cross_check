require './test/test_helper'
require './lib/game'
require './lib/game_stats'
require './lib/team'
require './lib/team_stats'
require './lib/league_stats'
require './lib/file_converter'
require './lib/stat_tracker'
require 'csv'

class StatTrackerTest < Minitest::Test

  def setup
    @games_path = './test/test_data/game_test.csv'
    @teams_path = './test/test_data/team_info_test.csv'
    @game_teams_path = './test/test_data/game_teams_stats_test.csv'

    @files = {
    games: @games_path,
    teams: @teams_path,
    game_teams: @game_teams_path
    }

    @stat_tracker = StatTracker.new(@files)
  end

  def test_it_exists
    assert_instance_of StatTracker, @stat_tracker
  end

  def test_it_can_create_an_instance_from_csv
    stats_from_csv = StatTracker.from_csv(@files)
    assert_instance_of StatTracker, stats_from_csv
  end

  def test_it_can_store_files
    assert_equal @games_path, @stat_tracker.files[:games]
    assert_equal @teams_path, @stat_tracker.files[:teams]
    assert_equal @game_teams_path, @stat_tracker.files[:game_teams]
  end

  def test_it_can_convert_files
    assert_instance_of FileConverter, @stat_tracker.convert_files
  end

  def test_it_can_compile_game_stats
    assert_instance_of GameStats, @stat_tracker.compile_game_stats
  end

  def test_it_can_compile_team_stats
    assert_instance_of TeamStats, @stat_tracker.compile_team_stats
  end

  def test_it_can_compile_game_team_stats
    skip
    assert_instance_of GameTeamStats, @stat_tracker.compile_game_team_stats
  end

  def test_it_can_compile_league_stats
    assert_instance_of LeagueStats, @stat_tracker.compile_league_stats
  end

  def test_it_has_stats_as_attributes
    assert_instance_of GameStats, @stat_tracker.game_stats
    assert_instance_of TeamStats, @stat_tracker.team_stats
    assert_instance_of LeagueStats, @stat_tracker.league_stats
  end

  def test_it_can_determine_highest_total_score
    assert_equal 9, @stat_tracker.highest_total_score
  end

  def test_it_can_determine_lowest_total_score
    assert_equal 3, @stat_tracker.lowest_total_score
  end

end
