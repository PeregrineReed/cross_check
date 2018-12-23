require './test/test_helper'
require './lib/team'

class TeamTest < Minitest::Test

  def setup
    team_1_info = {
      :team_id=>"1",
      :franchiseId=>"23",
      :shortName=>"New Jersey",
      :teamName=>"Devils",
      :abbreviation=>"NJD",
      :link=>"/api/v1/teams/1"
    }

    @team_1 = Team.new(team_1_info)
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
#A hash with key/value pairs
#for each of the attributes of a team.
  def test_it_has_team_info
    expected = {:team_id => "1", :franchise_id=>"23", :short_name=>"New Jersey", :team_name=>"Devils", :abbreviation=>"NJD", :link=>"/api/v1/teams/1"}

    assert_equal expected, @team_1.team_info
  end

  def test_league_stats_start_at_zero
    assert_equal 0, @team_1.home_wins
    assert_equal 0, @team_1.away_wins
    assert_equal 0, @team_1.away_goals
    assert_equal 0, @team_1.home_goals
    assert_equal 0, @team_1.total_wins
    assert_equal 0, @team_1.total_games
    assert_equal 0, @team_1.total_goals
    assert_equal 0, @team_1.total_goals_allowed
  end

end
