require './test/test_helper'
require './lib/team'
require 'pry'

class TeamTest < Minitest::Test

  def setup
    @team_data_1 = {
      :team_id=>"1",
      :franchiseId=>"23",
      :shortName=>"New Jersey",
      :teamName=>"Devils",
      :abbreviation=>"NJD",
      :link=>"/api/v1/teams/1"
    }

    @team_data_2 = {
      :team_id=>"4",
      :franchiseId=>"16",
      :shortName=>"Philadelphia",
      :teamName=>"Flyers",
      :abbreviation=>"PHI",
      :link=>"/api/v1/teams/4"
    }

    @team_data_3 = {
      :team_id=>"26",
      :franchiseId=>"14",
      :shortName=>"Los Angeles",
      :teamName=>"Kings",
      :abbreviation=>"LAK",
      :link=>"/api/v1/teams/26"
    }

    @team_1 = Team.new(@team_data_1)
    @team_4 = Team.new(@team_data_2)
    @team_26 = Team.new(@team_data_3)
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
    hash = {:team_id => "1", :franchiseId=>"23", :shortName=>"New Jersey", :teamName=>"Devils", :abbreviation=>"NJD", :link=>"/api/v1/teams/1"}

    assert_equal hash, @team_1.team_info
  end

  def test_league_stats_start_with_0
    assert_equal 0, @team_1.home_wins_league
    assert_equal 0, @team_1.away_wins_league
    assert_equal 0, @team_1.away_goals_league
    assert_equal 0, @team_1.home_goals_league
    assert_equal 0, @team_1.total_wins_league
    assert_equal 0, @team_1.total_games_league
    assert_equal 0, @team_1.total_goals_league
    assert_equal 0, @team_1.total_goals_allowed_league
  end

end
