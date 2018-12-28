require './test/test_helper'
require './lib/team'
require './lib/season_stats'


class SeasonStatsTest < Minitest::Test

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

    @season_1 = SeasonStats.new("20122013")
  end

  def test_it_exists
    assert_instance_of SeasonStats, @season_1
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
    skip
    @team_1.history[:preseason][:wins] = 5
    @team_1.history[:preseason][:games] = 9

    assert_equal 0.56, @team_1.preseason_win_percentage
  end

  def test_it_calculates_bust
    skip # No Method Error
    @team_1.history[:preseason][:wins] = 5
    @team_1.history[:preseason][:games] = 9
    @team_1.history[:total][:wins] = 13
    @team_1.history[:total][:games] = 205

    assert_equal 0.46, @team_1.calculate_bust
  end

  def test_it_calculates_surprise
    skip # No Method Error
    @team_1.history[:preseason][:wins] = 5
    @team_1.history[:preseason][:games] = 9
    @team_1.histoy[:regular][:wins] = 187
    @team_1.histoy[:regular][:games] = 205

    assert_equal 0.46, @team_1.calculate_surprise
  end

  def test_it_makes_season_summary
    skip #No Method Error
    @team_1.history[:preseason][:wins] = 5
    @team_1.history[:preseason][:games] = 9
    @team_1.history[:preseason][:goals] = 18
    @team_1.history[:preseason][:goals_against] = 16
    @team_1.history[:total][:wins] = 187
    @team_1.history[:total][:games] = 205
    @team_1.history[:total][:goals] = 412
    @team_1.history[:total][:goals_against] = 363

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
