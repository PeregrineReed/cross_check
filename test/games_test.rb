require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require './lib/file_converter'
require './lib/games'

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
    assert_equal seasons, @games.seasons
  end

  def test_it_can_count_games_by_season
    hash = {:"20122013" => 3, :"20172018" => 2, :"20162017" => 1}

    assert_equal hash, @games.season_games_count
  end

  def test_it_can_determine_season_with_most_games
    assert_equal 20122013, @games.season_with_most_games
  end

  def test_it_can_determine_season_with_fewest_games
    assert_equal 20162017, @games.season_with_fewest_games
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

  def test_it_can_list_total_game_scores
    game_scores = [5, 7, 3, 7, 4, 9]
    assert_equal game_scores, @games.total_scores
  end

  def test_it_can_list_all_venues
    venues = ["TD Garden", "Madison Square Garden", "Amalie Arena", "PNC Arena", "MTS Centre"]
    assert_equal venues, @games.venues
  end
end
