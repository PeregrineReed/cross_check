require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require './lib/file_converter'
require './lib/games'
require 'pry'

class GamesTest < Minitest::Test

  def setup
    @file_name = './data/game_test.csv'
    @file_converter = FileConverter.new(@file_name)
    @games = Games.new(@file_converter.info_hash(@file_name))
  end

  def test_it_exists
    assert_instance_of Games, @games
  end

  def test_it_has_game_stats
    keys = [:"2012030221", :"2012030222", :"2012030223", :"2017020830", :"2017020227", :"2016020050"]
    assert_equal keys, @games.stats.keys
  end

  def test_it_can_list_all_seasons
    seasons = ["20122013", "20162017", "20172018",]
    assert_equal seasons, @games.stat_collect(:season)
  end

  def test_it_can_count_games_by_season
    hash = {:"20122013" => 3, :"20172018" => 2, :"20162017" => 1}

    assert_equal hash, @games.stat_games_count(:season)
  end

  def test_it_can_determine_season_with_most_games
    assert_equal 20122013, @games.stat_with_most_games(:season)
  end

  def test_it_can_determine_season_with_fewest_games
    assert_equal 20162017, @games.stat_with_fewest_games(:season)
  end

  def test_it_can_list_total_game_scores
    game_scores = [5, 7, 3, 7, 4, 9]
    assert_equal game_scores, @games.total_scores
  end

  def test_it_can_find_the_max_game_score
    assert_equal 9, @games.max_score
  end

  def test_it_can_find_the_min_game_score
    assert_equal 3, @games.min_score
  end

  def test_it_can_find_the_largest_difference_in_scores
    assert_equal 3, @games.blowout
  end

  def test_it_can_list_away_game_scores
    game_scores = [2, 2, 2, 2, 1, 4]
    assert_equal game_scores, @games.away_game_scores
  end

  def test_it_can_list_home_game_scores
    game_scores = [3, 5, 1, 5, 3, 5]
    assert_equal game_scores, @games.home_game_scores
  end

  def test_it_can_list_total_game_scores
    game_scores = [5, 7, 3, 7, 4, 9]
    assert_equal game_scores, @games.total_scores
  end

  def test_it_can_list_all_venues
    venues = ["Amalie Arena", "MTS Centre", "Madison Square Garden", "PNC Arena", "TD Garden"]
    assert_equal venues, @games.stat_collect(:venue)
  end

  def test_it_can_determine_venue_with_most_games
    assert_equal "TD Garden", @games.stat_with_most_games(:venue)
  end

  def test_it_can_determine_venue_with_fewest_games
    assert_equal "Amalie Arena", @games.stat_with_fewest_games(:venue)
  end

  def test_it_can_total_goals_by_season
    hash = {:"20122013" => 15, :"20162017" => 9, :"20172018" => 11}

    assert_equal hash, @games.total_goals_stat(:season)
  end

  def test_it_can_average_goals_by_season
    hash = {:"20122013" => 5, :"20162017" => 9, :"20172018" => 5.5}

    assert_equal hash, @games.average_goals_stat(:season)
  end

  def test_it_can_average_goals_per_game
    assert_equal 5.83, @games.average_goals_game
  end

  def test_it_can_count_all_games
    assert_equal 6, @games.stats.count
  end

  def test_it_can_calculate_percentage_of_home_wins
    assert_equal 83.33, @games.home_wins_percent
  end

  def test_it_can_calculate_percentage_of_away_wins
    assert_equal 16.67, @games.away_wins_percent
  end

end
