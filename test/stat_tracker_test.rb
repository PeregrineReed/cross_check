require './test/test_helper'
require './lib/game'
require './lib/game_stats'
require './lib/team'
require './lib/season'
require './lib/team_stats'
require './lib/stat_sorter'
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

  def test_it_has_stats_as_attributes
    assert_equal @files, @stat_tracker.files

    all_games = @stat_tracker.games.all? do |game|
      game.class == Game
    end
    all_teams = @stat_tracker.teams.all? do |team|
      team.class == Team
    end

    assert_equal true, all_games
    assert_equal true, all_teams
  end

  def test_it_can_determine_highest_total_score
    assert_equal 9, @stat_tracker.highest_total_score
  end

  def test_it_can_determine_lowest_total_score
    assert_equal 3, @stat_tracker.lowest_total_score
  end

  def test_it_can_determine_biggest_blowout
    assert_equal 3, @stat_tracker.biggest_blowout
  end

  def test_it_can_determine_most_popular_venue
    assert_equal "TD Garden", @stat_tracker.most_popular_venue
  end

  def test_it_can_determine_least_popular_venue
    assert_equal "Amalie Arena", @stat_tracker.least_popular_venue
  end

  def test_it_can_determine_percentage_home_wins
    assert_equal 0.83, @stat_tracker.percentage_home_wins
  end

  def test_it_can_determine_percentage_visitor_wins
    assert_equal 0.17, @stat_tracker.percentage_visitor_wins
  end

  def test_it_can_determine_season_with_most_games
    assert_equal 20122013, @stat_tracker.season_with_most_games
  end

  def test_it_can_determine_season_with_fewest_games
    assert_equal 20162017, @stat_tracker.season_with_fewest_games
  end

  def test_it_can_determine_count_of_games_by_season
    expected = {"20122013" => 3, "20162017" => 1, "20172018" => 2}
    assert_equal expected, @stat_tracker.count_of_games_by_season
  end

  def test_it_can_average_goals_per_game
    assert_equal 5.83, @stat_tracker.average_goals_per_game
  end

  def test_it_can_average_goals_by_season
    expected = {"20122013" => 5.0, "20162017" => 9.0, "20172018" => 5.5}
    assert_equal expected, @stat_tracker.average_goals_by_season
  end

  def test_it_can_count_all_teams
    assert_equal 8, @stat_tracker.count_of_teams
  end

  def test_it_can_determine_the_best_offense
    assert_equal "Lightning", @stat_tracker.best_offense
  end

  def test_it_can_determine_worst_offense
    assert_equal "Panthers", @stat_tracker.worst_offense
  end

  def test_it_can_determine_best_defense
    assert_equal "Hurricanes", @stat_tracker.best_defense
  end

  def test_it_can_determine_worst_defense
    assert_equal "Maple Leafs", @stat_tracker.worst_defense
  end

  def test_it_can_determine_highest_scoring_visitor
    assert_equal "Maple Leafs", @stat_tracker.highest_scoring_visitor
  end

  def test_it_can_determine_highest_scoring_home_team
    assert_equal "Lightning", @stat_tracker.highest_scoring_home_team
  end

  def test_it_can_determine_lowest_scoring_visitor
    assert_equal "Panthers", @stat_tracker.lowest_scoring_visitor
  end

  def test_it_can_determine_lowest_scoring_home_team
    assert_equal "Rangers", @stat_tracker.lowest_scoring_home_team
  end

  def test_it_can_determine_winningest_team
    assert_equal "Bruins", @stat_tracker.winningest_team
  end

  def test_it_can_determine_best_fans
    assert_equal "Rangers", @stat_tracker.best_fans
  end

  def test_it_can_determine_worst_fans
    assert_equal [], @stat_tracker.worst_fans
  end

end
