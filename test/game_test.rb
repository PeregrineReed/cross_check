require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'
require 'pry'

class GameTest < Minitest::Test

  def setup
    @game_data_1 = {
                    :game_id=>"2012030221",
                    :season=>"20122013",
                    :type=>"P",
                    :date_time=>"2013-05-16",
                    :away_team_id=>"3",
                    :home_team_id=>"6",
                    :away_goals=>"2",
                    :home_goals=>"3",
                    :outcome=>"home win OT",
                    :home_rink_side_start=>"left",
                    :venue=>"TD Garden",
                    :venue_link=>"/api/v1/venues/	null",
                    :venue_time_zone_id=>"America New_York",
                    :venue_time_zone_offset=>"-4",
                    :venue_time_zone_tz=>"EDT"
                    }

    @game_data_2 = {
                    :game_id=>"2012030222",
                    :season=>"20122013",
                    :type=>"P",
                    :date_time=>"2013-05-19",
                    :away_team_id=>"3",
                    :home_team_id=>"6",
                    :away_goals=>"2",
                    :home_goals=>"5",
                    :outcome=>"home win REG",
                    :home_rink_side_start=>"left",
                    :venue=>"TD Garden",
                    :venue_link=>"/api/v1/venues/		null",
                    :venue_time_zone_id=>"America New_York",
                    :venue_time_zone_offset=>"-4",
                    :venue_time_zone_tz=>"EDT"
                    }


    @game_data_3 = {
                    :game_id=>"2012030223",
                    :season=>"20122013",
                    :type=>"P",
                    :date_time=>"2013-05-21",
                    :away_team_id=>"6",
                    :home_team_id=>"3",
                    :away_goals=>"2",
                    :home_goals=>"1",
                    :outcome=>"away win REG",
                    :home_rink_side_start=>"right",
                    :venue=>"Madison Square Garden",
                    :venue_link=>"/api/v1/	venues/null",
                    :venue_time_zone_id=>"America/New_York",
                    :venue_time_zone_offset=>"-4",
                    :venue_time_zone_tz=>"EDT"
                    }


    @game_1 = Game.new(@game_data_1)
    @game_2 = Game.new(@game_data_2)
    @game_3 = Game.new(@game_data_3)
  end

  def test_it_exists
    assert_instance_of Game, @game_1
  end

  def test_it_has_attributes
    assert_equal "2012030221", @game_1.game_id
    assert_equal "20122013", @game_1.season
    assert_equal "P", @game_1.type
    assert_equal "2013-05-16", @game_1.date_time
    assert_equal "3", @game_1.away_team_id
    assert_equal "6", @game_1.home_team_id
    assert_equal 2, @game_1.away_goals
    assert_equal 3, @game_1.home_goals
    assert_equal "home win OT", @game_1.outcome
    assert_equal "left", @game_1.home_rink_side_start
    assert_equal "TD Garden", @game_1.venue
    assert_equal "/api/v1/venues/	null", @game_1.venue_link
    assert_equal "America New_York", @game_1.venue_time_zone_id
    assert_equal "-4", @game_1.venue_time_zone_offset
    assert_equal "EDT", @game_1.venue_time_zone_tz

  end

  def test_it_has_a_total_score
    assert_equal 5, @game_1.total_score
  end

  def test_it_has_a_score_difference
    assert_equal -1, @game_1.score_difference
  end

  def test_it_has_a_blowout
    assert_equal 3, @game_2.blowout
  end

end
