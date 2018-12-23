require './test/test_helper'
require './lib/team'
require './lib/game'
require './lib/game_stats'
require './lib/league_stats'

class LeagueStatsTest < Minitest::Test

  def setup

    team_3_info = {
      team_id: "3",
      franchiseid: "10",
      shortname: "NY Rangers",
      teamname: "Rangers",
      abbreviation: "NYR",
      link: "/api/v1/teams/3"
    }

    team_6_info = {
      team_id: "6",
      franchiseid: "6",
      shortname: "Boston",
      teamname: "Bruins",
      abbreviation: "BOS",
      link: "/api/v1/teams/6"
    }

    @team_3 = Team.new(team_3_info)
    @team_6 = Team.new(team_6_info)

    @teams = [
      @team_3,
      @team_6,
    ]

    game_1_info = {
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
      :venue_link=>"/api/v1/venues/		null",
      :venue_time_zone_id=>"America New_York",
      :venue_time_zone_offset=>"-4",
      :venue_time_zone_tz=>"EDT"
    }

    game_2_info = {
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

    game_3_info = {
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

    @game_1 = Game.new(game_1_info)
    @game_2 = Game.new(game_2_info)
    @game_3 = Game.new(game_3_info)

    @games = [
      @game_1,
      @game_2,
      @game_3
    ]

    @league_stats = LeagueStats.new(@games, @teams)
    @league_stats.sort_total_league_games
  end

  def test_it_exists
    assert_instance_of LeagueStats, @league_stats
  end

  def test_it_has_games
    assert_equal @games, @league_stats.games
  end

  def test_it_has_teams
    assert_equal @teams, @league_stats.teams
  end

  def test_it_sorts_team_league_games
    assert_equal 1, @team_6.away_games
    assert_equal 2, @team_6.home_games
    assert_equal 3, @team_6.total_games
    assert_equal 2, @team_6.home_wins
    assert_equal 1, @team_6.away_wins
    assert_equal 3, @team_6.total_wins
    assert_equal 2, @team_6.away_goals
    assert_equal 8, @team_6.home_goals
    assert_equal 10, @team_6.total_goals
    assert_equal 5, @team_6.total_goals_allowed

    assert_equal 2, @team_3.away_games
    assert_equal 1, @team_3.home_games
    assert_equal 3, @team_3.total_games
    assert_equal 0, @team_3.home_wins
    assert_equal 0, @team_3.away_wins
    assert_equal 0, @team_3.total_wins
    assert_equal 4, @team_3.away_goals
    assert_equal 1, @team_3.home_goals
    assert_equal 5, @team_3.total_goals
    assert_equal 10, @team_3.total_goals_allowed
  end

  #league stat method tests
  def test_it_calculates_highest_offense
    assert_equal "Bruins", @league_stats.highest_offense
  end

  def test_it_calculates_lowest_offense
    skip
    assert_equal "Rangers", @league_stats.lowest_offense
  end

  def test_it_calculates_highest_defense
    assert_equal "Rangers", @league_stats.highest_defense
  end

  def test_it_calculates_lowest_defense
    assert_equal "Bruins", @league_stats.lowest_defense
  end

  def test_it_calculates_highest_scoring_away_team
    assert_equal "Rangers", @league_stats.highest_scoring_when_away
  end

  def test_it_calculates_highest_scoring_home_team
    assert_equal "Bruins", @league_stats.highest_scoring_when_home
  end

  def test_it_calculates_lowest_scoring_away_team
    assert_equal "Rangers", @league_stats.lowest_scoring_when_away
  end

  def test_it_calculates_lowest_scoring_home_team
    assert_equal "Rangers", @league_stats.lowest_scoring_when_home
  end

  def test_it_calculates_highest_league_win_percentage
    assert_equal "Bruins", @league_stats.highest_win_percentage
  end

  def test_it_calculates_best_fans
    assert_equal "Rangers", @league_stats.highest_fans_rating
  end

  def test_it_lists_bad_fan_teams
    assert_equal ["Rangers", "Bruins"], @league_stats.bad_fan_teams
  end

end
