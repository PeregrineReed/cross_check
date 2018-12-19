require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/game_stats'
require 'pry'

class GameStatsTest < Minitest::Test

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
    @game_stats = GameStats.new(@games)
  end

  def test_it_exists
    assert_instance_of GameStats, @game_stats
  end

  def test_it_has_games
    assert_equal @games, @game_stats.games
  end

  # def test_it_has_game_stats
  #   skip
  #   keys = [:"2012030221", :"2012030222", :"2012030223", :"2017020830", :"2017020227", :"2016020050"]
  #   assert_equal keys, @game_stats.stats.keys
  # end

  def test_it_can_list_all_seasons
    skip
    seasons = ["20122013", "20162017", "20172018",]
    assert_equal seasons, @game_stats.stat_collect(:season)
  end

  def test_it_can_count_games_by_season
    skip
    hash = {:"20122013" => 3, :"20172018" => 2, :"20162017" => 1}

    assert_equal hash, @game_stats.stat_games_count(:season)
  end

  def test_it_can_determine_season_with_most_games
    skip
    assert_equal 20122013, @game_stats.stat_with_most_games(:season)
  end

  def test_it_can_determine_season_with_fewest_games
    skip
    assert_equal 20162017, @game_stats.stat_with_fewest_games(:season)
  end

  def test_it_can_list_total_game_scores
    skip
    game_scores = [5, 7, 3, 7, 4, 9]
    assert_equal game_scores, @game_stats.total_scores
  end

  def test_it_can_find_the_max_game_score
    skip
    assert_equal 9, @game_stats.max_score
  end

  def test_it_can_find_the_min_game_score
    skip
    assert_equal 3, @game_stats.min_score
  end

  def test_it_can_find_the_largest_difference_in_scores
    skip
    assert_equal 3, @game_stats.blowout
  end

  def test_it_can_list_away_game_scores
    skip
    game_scores = [2, 2, 2, 2, 1, 4]
    assert_equal game_scores, @game_stats.away_game_scores
  end

  def test_it_can_list_home_game_scores
    skip
    game_scores = [3, 5, 1, 5, 3, 5]
    assert_equal game_scores, @game_stats.home_game_scores
  end

  def test_it_can_list_total_game_scores
    skip
    game_scores = [5, 7, 3, 7, 4, 9]
    assert_equal game_scores, @game_stats.total_scores
  end

  def test_it_can_list_all_venues
    skip
    venues = ["Amalie Arena", "MTS Centre", "Madison Square Garden", "PNC Arena", "TD Garden"]
    assert_equal venues, @game_stats.stat_collect(:venue)
  end

  def test_it_can_determine_venue_with_most_games
    skip
    assert_equal "TD Garden", @game_stats.stat_with_most_games(:venue)
  end

  def test_it_can_determine_venue_with_fewest_games
    skip
    assert_equal "Amalie Arena", @game_stats.stat_with_fewest_games(:venue)
  end

  def test_it_can_total_goals_by_season
    skip
    hash = {:"20122013" => 15, :"20162017" => 9, :"20172018" => 11}

    assert_equal hash, @game_stats.total_goals_stat(:season)
  end

  def test_it_can_average_goals_by_season
    skip
    hash = {:"20122013" => 5, :"20162017" => 9, :"20172018" => 5.5}

    assert_equal hash, @game_stats.average_goals_stat(:season)
  end

  def test_it_can_average_goals_per_game
    skip
    assert_equal 5.83, @game_stats.average_goals_game
  end

  def test_it_can_count_all_games
    skip
    assert_equal 6, @game_stats.stats.count
  end

  def test_it_can_calculate_percentage_of_home_wins
    skip
    assert_equal 83.33, @game_stats.home_wins_percent
  end

  def test_it_can_calculate_percentage_of_away_wins
    skip
    assert_equal 16.67, @game_stats.away_wins_percent
  end

end
