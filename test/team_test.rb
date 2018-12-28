require './test/test_helper'
require './lib/team'

class TeamTest < Minitest::Test

  def setup
    team_1_info = {
      team_id: "1",
      franchiseid: "23",
      shortname: "New Jersey",
      teamname: "Devils",
      abbreviation: "NJD",
      link: "/api/v1/teams/1"
    }

    team_4_info = {
      team_id: "4",
      franchiseid: "16",
      shortname: "Philadelphia",
      teamname: "Flyers",
      abbreviation: "PHI",
      link: "/api/v1/teams/4"
    }

    @team_1 = Team.new(team_1_info)
    @team_4 = Team.new(team_4_info)

    @teams = [
              @team_1,
              @team_4,
             ]
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

  #A hash with key/value pairs for each of the attributes of a team.
  def test_it_has_team_info
    expected = {
      team_id:  "1",
      franchiseid: "23",
      shortname: "New Jersey",
      teamname: "Devils",
      abbreviation: "NJD",
      link: "/api/v1/teams/1"
    }

    assert_equal expected, @team_1.team_info
  end

  #Before stat_sorter is called, these team attributes will start at 0.
  def test_team_stats_start_with_0
    assert_equal 0, @team_1.history[:home][:wins]
    assert_equal 0, @team_1.history[:away][:wins]
    assert_equal 0, @team_1.history[:away][:goals]
    assert_equal 0, @team_1.history[:home][:goals]
    assert_equal 0, @team_1.total[:wins]
    assert_equal 0, @team_1.total[:games]
    assert_equal 0, @team_1.total[:goals]
    assert_equal 0, @team_1.total[:goals_against]
    assert_equal 0, @team_1.history[:preseason][:wins]
    assert_equal 0, @team_1.history[:preseason][:games]
    assert_equal 0, @team_1.history[:preseason][:goals]
    assert_equal 0, @team_1.history[:preseason][:goals_against]
    #assert_equal {}, @team_1.seasons
  end

  def test_it_calculates_team_league_win_percentage
    @team_1.history[:away][:wins] = 3
    @team_1.history[:away][:games] = 9

    assert_equal 0.33, @team_1.win_percentage
  end

  def test_it_calculates_team_home_win_percentage
    @team_1.history[:home][:wins] = 4
    @team_1.history[:home][:games] = 10

    assert_equal 0.4, @team_1.home_win_percentage
  end

  def test_it_calculates_team_away_win_percentage
    @team_1.history[:away][:wins] = 2
    @team_1.history[:away][:games] = 3

    assert_equal 0.67, @team_1.away_win_percentage
  end

  def test_it_calculates_fan_rating
    @team_1.history[:home][:wins] = 4
    @team_1.history[:home][:games] = 10
    @team_1.history[:away][:wins] = 2
    @team_1.history[:away][:games] = 3

    assert_equal (-0.27), @team_1.fans_rating
  end

  def test_it_calculates_team_away_average_goals
    @team_1.history[:away][:goals] = 1
    @team_1.history[:away][:games] = 4

    assert_equal 0.25, @team_1.away_average_goals
  end

  def test_it_calculates_team_home_average_goals
    @team_1.history[:home][:goals] = 16
    @team_1.history[:home][:games] = 18

    assert_equal 0.89, @team_1.home_average_goals
  end

  def test_it_calculates_offense
    @team_1.history[:home][:goals] = 100
    @team_1.history[:away][:games] = 205

    assert_equal 0.49, @team_1.calculate_offense
  end

  def test_it_calculates_defense
    @team_1.history[:away][:goals_against] = 95
    @team_1.history[:home][:games] = 205

    assert_equal 0.46, @team_1.calculate_defense
  end

end
