require './test/test_helper'
require './lib/team'
require './lib/season'


class SeasonTest < Minitest::Test

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

    @season_1 = Season.new("20122013")
  end

  def test_it_exists
    assert_instance_of Season, @season_1
  end

  def test_it_has_id
    assert_equal "20122013", @season_1.season_id
  end

  #Before stat_sorter is called, these team attributes will start at 0.
  def test_season_stats_start_with_0
    assert_equal 0, @season_1.preseason[:wins]
    assert_equal 0, @season_1.preseason[:games]
    assert_equal 0, @season_1.preseason[:goals]
    assert_equal 0, @season_1.preseason[:goals_against]
    assert_equal 0, @season_1.regular[:wins]
    assert_equal 0, @season_1.regular[:games]
    assert_equal 0, @season_1.regular[:goals]
    assert_equal 0, @season_1.regular[:goals_against]
  end

  #Season statistic team methods
  def test_it_calculates_team_preseason_win_percentage
    @season_1.preseason[:wins] = 5
    @season_1.preseason[:games] = 9

    assert_equal 0.56, @season_1.preseason_win_percentage
  end

  def test_it_calculates_team_regular_season_win_percentage
    @season_1.regular[:wins] = 35
    @season_1.regular[:games] = 40

    assert_equal 0.88, @season_1.regular_season_win_percentage
  end

  def test_it_calculates_team_preseason_average_goals
    @season_1.preseason[:goals] = 3
    @season_1.preseason[:goals_against] = 6
    @season_1.preseason[:games] = 9

    assert_equal 0.33, @season_1.preseason_average_goals(:goals)
    assert_equal 0.67, @season_1.preseason_average_goals(:goals_against)
  end

  def test_it_calculates_team_regular_season_average_goals
    @season_1.regular[:goals] = 35
    @season_1.regular[:goals_against] = 15
    @season_1.regular[:games] = 40

    assert_equal 0.88, @season_1.regular_season_average_goals(:goals)
    assert_equal 0.38, @season_1.regular_season_average_goals(:goals_against)
  end

  def test_it_calculates_win_differential
    @season_1.preseason[:wins] = 5
    @season_1.preseason[:games] = 9
    @season_1.regular[:wins] = 193
    @season_1.regular[:games] = 205

    assert_equal 0.38, @season_1.win_differential
  end

  def test_it_makes_season_summary
    @season_1.preseason[:wins] = 5
    @season_1.preseason[:games] = 9
    @season_1.preseason[:goals] = 18
    @season_1.preseason[:goals_against] = 16
    @season_1.regular[:wins] = 187
    @season_1.regular[:games] = 205
    @season_1.regular[:goals] = 412
    @season_1.regular[:goals_against] = 363

    expected = {
      preseason:
        {
          win_percentage: 0.56,
          goals_scored: 18,
          goals_against: 16
        },
      regular_season:
        {
          win_percentage: 0.91,
          goals_scored: 412,
          goals_against: 363
        }
      }

    assert_equal expected, @season_1.season_summary
  end

end
