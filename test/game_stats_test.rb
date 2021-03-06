require './test/test_helper'
require './lib/stat_sorter'
require './lib/game_stats'

class GameRepo

  include GameStats

  attr_reader :games

  def initialize(games)
    @games = games
  end

end

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
    @game_stats = GameRepo.new(@games)
    @game_1.stubs(
      :season => "20122013",
      :total_score => 5,
      :home_goals => 3,
      :away_goals => 2,
      :blowout => 1,
      :outcome => "home win OT",
      :venue => "TD Garden"
    )
    @game_2.stubs(
      :season => "20122013",
      :total_score => 7,
      :home_goals => 5,
      :away_goals => 2,
      :blowout => 3,
      :outcome => "home win REG",
      :venue => "TD Garden"
    )
    @game_3.stubs(
      :season => "20122013",
      :total_score => 3,
      :home_goals => 1,
      :away_goals => 2,
      :blowout => 1,
      :outcome => "away win REG",
      :venue => "TD Garden"
    )
    @game_4.stubs(
      :season => "20162017",
      :total_score => 7,
      :home_goals => 5,
      :away_goals => 2,
      :blowout => 3,
      :outcome => "home win REG",
      :venue => "Amalie Arena"
    )
    @game_5.stubs(
      :season => "20172018",
      :total_score => 4,
      :home_goals => 3,
      :away_goals => 1,
      :blowout => 2,
      :outcome => "home win REG",
      :venue => "MTS Centre"
    )
    @game_6.stubs(
      :season => "20172018",
      :total_score => 9,
      :home_goals => 5,
      :away_goals => 4,
      :blowout => 1,
      :outcome => "home win OT",
      :venue => "MTS Centre"
    )
  end

  def test_it_exists
    expected = GameRepo.included_modules.include?(GameStats)
    assert_equal true, expected
  end

  def test_it_has_games
    assert_equal @games, @game_stats.games
  end

  def test_it_can_list_all_seasons
    seasons = ["20122013", "20162017", "20172018",]
    assert_equal seasons, @game_stats.list_seasons
  end

  def test_it_can_count_games_by_season
    expected = {"20122013" => 3,"20162017" => 1, "20172018" => 2}

    assert_equal expected, @game_stats.count_of_games_by_season
  end

  def test_it_can_determine_season_with_most_games
    assert_equal 20122013, @game_stats.season_with_most_games
  end

  def test_it_can_determine_season_with_fewest_games
    assert_equal 20162017, @game_stats.season_with_fewest_games
  end

  def test_it_can_list_total_game_scores
    game_scores = [5, 7, 3, 7, 4, 9]
    assert_equal game_scores, @game_stats.total_scores
  end

  def test_it_can_find_the_max_game_score
    assert_equal 9, @game_stats.highest_total_score
  end

  def test_it_can_find_the_min_game_score
    assert_equal 3, @game_stats.lowest_total_score
  end

  def test_it_can_find_the_largest_difference_in_scores
    assert_equal 3, @game_stats.biggest_blowout
  end

  def test_it_can_list_away_game_scores
    game_scores = [2, 2, 2, 2, 1, 4]
    assert_equal game_scores, @game_stats.away_game_scores
  end

  def test_it_can_list_home_game_scores
    game_scores = [3, 5, 1, 5, 3, 5]
    assert_equal game_scores, @game_stats.home_game_scores
  end

  def test_it_can_list_total_game_scores
    game_scores = [5, 7, 3, 7, 4, 9]
    assert_equal game_scores, @game_stats.total_scores
  end

  def test_it_can_list_all_venues
    venues = ["Amalie Arena", "MTS Centre", "TD Garden"]
    assert_equal venues, @game_stats.list_venues
  end

  def test_it_can_determine_venue_with_most_games
    assert_equal "TD Garden", @game_stats.most_popular_venue
  end

  def test_it_can_determine_venue_with_fewest_games
    assert_equal "Amalie Arena", @game_stats.least_popular_venue
  end

  def test_it_can_total_goals_by_season
    expected = {"20122013" => 15, "20162017" => 7, "20172018" => 13}

    assert_equal expected, @game_stats.total_season_goals
  end

  def test_it_can_average_goals_by_season
    expected = {"20122013" => 5.0, "20162017" => 7.0, "20172018" => 6.5}

    assert_equal expected, @game_stats.average_goals_by_season
  end

  def test_it_can_average_goals_per_game
    assert_equal 5.83, @game_stats.average_goals_per_game
  end

  def test_it_can_calculate_percentage_of_home_wins
    assert_equal 0.83, @game_stats.wins_percentage("home")
  end

  def test_it_can_calculate_percentage_of_away_wins
    assert_equal 0.17, @game_stats.wins_percentage("away")
  end

end
