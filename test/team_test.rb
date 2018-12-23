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

    team_4_info = {
      :team_id=>"4",
      :franchiseId=>"16",
      :shortName=>"Philadelphia",
      :teamName=>"Flyers",
      :abbreviation=>"PHI",
      :link=>"/api/v1/teams/4"
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
    hash = {:team_id => "1", :franchiseId=>"23", :shortName=>"New Jersey", :teamName=>"Devils", :abbreviation=>"NJD", :link=>"/api/v1/teams/1"}

    assert_equal hash, @team_1.team_info
  end

  #Before stat_sorter is called, these team attributes will start at 0.
  def test_team_stats_start_with_0
    assert_equal 0, @team_1.home_wins_league
    assert_equal 0, @team_1.away_wins_league
    assert_equal 0, @team_1.away_goals_league
    assert_equal 0, @team_1.home_goals_league
    assert_equal 0, @team_1.total_wins_league
    assert_equal 0, @team_1.total_games_league
    assert_equal 0, @team_1.total_goals_league
    assert_equal 0, @team_1.total_goals_allowed_league
    assert_equal 0, @team_1.total_wins_preseason
    assert_equal 0, @team_1.total_games_preseason
    assert_equal 0, @team_1.total_goals_preseason
    assert_equal 0, @team_1.total_goals_allowed_preseason
  end

  def test_it_calculates_team_league_win_percentage
    @team_1.total_wins_league = 3
    @team_1.total_games_league = 9

    assert_equal 0.33, @team_1.league_win_percentage
  end

  def test_it_calculates_team_home_league_win_percentage
    @team_1.home_wins_league = 4
    @team_1.home_games_league = 10

    assert_equal 0.4, @team_1.league_home_win_percentage
  end

  def test_it_calculates_team_away_league_win_percentage
    @team_1.away_wins_league = 2
    @team_1.away_games_league = 3

    assert_equal 0.67, @team_1.league_away_win_percentage
  end

  def test_it_calculates_fan_rating
    @team_1.home_wins_league = 4
    @team_1.home_games_league = 10
    @team_1.away_wins_league = 2
    @team_1.away_games_league = 3

    assert_equal (-0.27), @team_1.fans_rating
  end

  def test_it_calculates_team_league_away_average_goals
    @team_1.away_goals_league = 1
    @team_1.away_games_league = 4

    assert_equal 0.25, @team_1.league_away_average_goals
  end

  def test_it_calculates_team_league_home_average_goals
    @team_1.home_goals_league = 16
    @team_1.home_games_league = 18

    assert_equal 0.89, @team_1.league_home_average_goals
  end

  def test_it_calculates_offense
    @team_1.total_goals_league = 100
    @team_1.total_games_league = 205

    assert_equal 0.49, @team_1.calculate_offense
  end

  def test_it_calculates_defense
    @team_1.total_goals_allowed_league = 95
    @team_1.total_games_league = 205

    assert_equal 0.46, @team_1.calculate_defense
  end

  #Season statistic team methods
  def test_it_calculates_team_preseason_win_percentage
    @team_1.total_wins_preseason = 5
    @team_1.total_games_preseason = 9

    assert_equal 0.66, @team_1.preseason_win_percentage
  end

  def test_it_calculates_bust
    @team_1.total_wins_preseason = 5
    @team_1.total_games_preseason = 9
    @team_1.total_wins_league = 13
    @team_1.total_games_league = 205

    assert_equal 0.46, @team_1.calculate_bust
  end

  def test_it_calculates_surprise
    @team_1.total_wins_preseason = 5
    @team_1.total_games_preseason = 9
    @team_1.total_wins_league = 187
    @team_1.total_games_league = 205

    assert_equal 0.46, @team_1.calculate_surprise
  end

  def test_it_makes_season_summary
    @team_1.total_wins_preseason = 5
    @team_1.total_games_preseason = 9
    @team_1.total_goals_preseason = 18
    @team_1.total_goals_allowed_preseason = 16
    @team_1.total_wins_league = 187
    @team_1.total_games_league = 205
    @team_1.total_goals_league = 412
    @team_1.total_goals_allowed_league = 363

    summary = {
              preseason:
                {
                  win_percentage:0.6,
                  goals_scored: 18,
                  goals_against: 16
                },
              regular_season:
                {
                  win_percentage:0.93,
                  goals_scored: 412,
                  goals_against: 363
                }
              }

    assert_equal summary, @team_1.season_summary
  end

end
