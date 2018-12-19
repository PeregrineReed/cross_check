require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'
require 'pry'

class GameTest < Minitest::Test

  def setup
    game_data_1 = {
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

    game_data_2 = {
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


    game_data_3 = {
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


    @game_1 = Game.new(game_data_1)
    @game_2 = Game.new(game_data_2)
    @game_3 = Game.new(game_data_3)
  end

  def test_it_exists
    assert_instance_of Game, @game_1
  end

end
