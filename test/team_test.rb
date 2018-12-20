require 'minitest/autorun'
require 'minitest/pride'
require './lib/team'
require 'pry'

class TeamTest < Minitest::Test

  def setup
    @team_data_1 = {
                            :team_id=>"1",
                            :franchise_id=>"23",
                            :short_name=>"New Jersey",
                            :team_name=>"Devils",
                            :abbreviation=>"NJD",
                            :link=>"/api/v1/teams/1"
                            }

    @team_data_2 = {
                            :team_id=>"4",
                            :franchise_id=>"16",
                            :short_name=>"Philadelphia",
                            :team_name=>"Flyers",
                            :abbreviation=>"PHI",
                            :link=>"/api/v1/teams/4"
                            }

    @team_data_3 = {
                            :team_id=>"26",
                            :franchise_id=>"14",
                            :short_name=>"Los Angeles",
                            :team_name=>"Kings",
                            :abbreviation=>"LAK",
                            :link=>"/api/v1/teams/26"
                            }

    @team_1 = Team.new(@team_data_1)
    @team_2 = Team.new(@team_data_2)
    @team_3 = Team.new(@team_data_3)
  end

  def test_it_exists
    assert_instance_of Team, @team_1
  end

#   def test_it_has_attributes
#     assert_equal "2012030221", @game_1.game_id
#     assert_equal "20122013", @game_1.season
#     assert_equal "P", @game_1.type
#     assert_equal "2013-05-16", @game_1.date_time
#     assert_equal "3", @game_1.away_team_id
#     assert_equal "6", @game_1.home_team_id
#     assert_equal 2, @game_1.away_goals
#     assert_equal 3, @game_1.home_goals
#     assert_equal "home win OT", @game_1.outcome
#     assert_equal "left", @game_1.home_rink_side_start
#     assert_equal "TD Garden", @game_1.venue
#     assert_equal "/api/v1/venues/	null", @game_1.venue_link
#     assert_equal "America New_York", @game_1.venue_time_zone_id
#     assert_equal "-4", @game_1.venue_time_zone_offset
#     assert_equal "EDT", @game_1.venue_time_zone_tz
#
#   end
#
#   def test_it_has_a_total_score
#     assert_equal 5, @game_1.total_score
#   end
#
end
