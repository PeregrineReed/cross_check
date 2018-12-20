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

  def test_it_has_attributes
    assert_equal "1", @team_1.team_id
    assert_equal "23", @team_1.franchise_id
    assert_equal "New Jersey", @team_1.short_name
    assert_equal "Devils", @team_1.team_name
    assert_equal "NJD", @team_1.abbreviation
    assert_equal "/api/v1/teams/1", @team_1.link
  end
#
#   def test_it_has_a_total_score
#     assert_equal 5, @game_1.total_score
#   end
#
end
