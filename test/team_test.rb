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
    assert_equal 0, @team_1.home[:wins]
    assert_equal 0, @team_1.away[:wins]
    assert_equal 0, @team_1.away[:goals]
    assert_equal 0, @team_1.home[:goals]
    assert_equal 0, @team_1.total[:wins]
    assert_equal 0, @team_1.total[:games]
    assert_equal 0, @team_1.total[:goals]
    assert_equal 0, @team_1.total[:goals_against]
    assert_equal 0, @team_1.preseason[:wins]
    assert_equal 0, @team_1.preseason[:games]
    assert_equal 0, @team_1.preseason[:goals]
    assert_equal 0, @team_1.preseason[:goals_against]
  end

  def test_it_calculates_team_league_win_percentage
    @team_1.total[:wins] = 3
    @team_1.total[:games] = 9

    assert_equal 0.33, @team_1.win_percentage
  end

  def test_it_calculates_team_home_win_percentage
    @team_1.home[:wins] = 4
    @team_1.home[:games] = 10

    assert_equal 0.4, @team_1.home_win_percentage
  end

  def test_it_calculates_team_away_win_percentage
    @team_1.away[:wins] = 2
    @team_1.away[:games] = 3

    assert_equal 0.67, @team_1.away_win_percentage
  end

  def test_it_calculates_fan_rating
    @team_1.home[:wins] = 4
    @team_1.home[:games] = 10
    @team_1.away[:wins] = 2
    @team_1.away[:games] = 3

    assert_equal (-0.27), @team_1.fans_rating
  end

  def test_it_calculates_team_away_average_goals
    @team_1.away[:goals] = 1
    @team_1.away[:games] = 4

    assert_equal 0.25, @team_1.away_average_goals
  end

  def test_it_calculates_team_home_average_goals
    @team_1.home[:goals] = 16
    @team_1.home[:games] = 18

    assert_equal 0.89, @team_1.home_average_goals
  end

  def test_it_calculates_offense
    @team_1.total[:goals] = 100
    @team_1.total[:games] = 205

    assert_equal 0.49, @team_1.calculate_offense
  end

  def test_it_calculates_defense
    @team_1.total[:goals_against] = 95
    @team_1.total[:games] = 205

    assert_equal 0.46, @team_1.calculate_defense
  end

  #Season statistic team methods
  def test_it_calculates_team_preseason_win_percentage
    @team_1.preseason[:wins] = 5
    @team_1.preseason[:games] = 9

    assert_equal 0.56, @team_1.preseason_win_percentage
  end

  def test_it_calculates_bust
    skip # No Method Error
    @team_1.preseason[:wins] = 5
    @team_1.preseason[:games] = 9
    @team_1.total[:wins] = 13
    @team_1.total[:games] = 205

    assert_equal 0.46, @team_1.calculate_bust
  end

  def test_it_calculates_surprise
    skip # No Method Error
    @team_1.preseason[:wins] = 5
    @team_1.preseason[:games] = 9
    @team_1.total[:wins] = 187
    @team_1.total[:games] = 205

    assert_equal 0.46, @team_1.calculate_surprise
  end

  def test_it_makes_season_summary
    skip #No Method Error
    @team_1.preseason[:wins] = 5
    @team_1.preseason[:games] = 9
    @team_1.preseason[:goals] = 18
    @team_1.preseason[:goals_against] = 16
    @team_1.total[:wins] = 187
    @team_1.total[:games] = 205
    @team_1.total[:goals] = 412
    @team_1.total[:goals_against] = 363

    expected = {
      preseason:
        {
          win_percentage: 0.6,
          goals_scored: 18,
          goals_against: 16
        },
      regular_season:
        {
          win_percentage: 0.93,
          goals_scored: 412,
          goals_against: 363
        }
      }

    assert_equal expected, @team_1.season_summary
  end

end
