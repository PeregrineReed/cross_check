require './test/test_helper'
require './lib/team'
require './lib/game'
require './lib/team_stats'
require './lib/team_stat_sorter'

class TeamStatsTest < Minitest::Test

  def setup
    team_3_info = {team_id: "3", franchiseId: "23", shortName: "", teamName: "Rangers", abbreviation: "NJD", link: "/api/v1/teams/1"}
    team_6_info = {team_id: "6", franchiseId: "16", shortName: "", teamName: "Bruins", abbreviation: "PHI", link: "/api/v1/teams/4"}
    team_10_info = {team_id: "10", franchiseId: "16", shortName: "", teamName: "Maple Leafs", abbreviation: "PHI", link: "/api/v1/teams/4"}
    team_12_info = {team_id: "12", franchiseId: "16", shortName: "", teamName: "Hurricanes", abbreviation: "PHI", link: "/api/v1/teams/4"}
    team_13_info = {team_id: "13", franchiseId: "16", shortName: "", teamName: "Panthers", abbreviation: "PHI", link: "/api/v1/teams/4"}
    team_14_info = {team_id: "14", franchiseId: "16", shortName: "", teamName: "Lightning", abbreviation: "PHI", link: "/api/v1/teams/4"}
    team_23_info = {team_id: "23", franchiseId: "16", shortName: "", teamName: "Canucks", abbreviation: "PHI", link: "/api/v1/teams/4"}
    team_52_info = {team_id: "52", franchiseId: "16", shortName: "", teamName: "Jets", abbreviation: "PHI", link: "/api/v1/teams/4"}

    @team_3 = Team.new(team_3_info)
    @team_6 = Team.new(team_6_info)
    @team_10 = Team.new(team_10_info)
    @team_12 = Team.new(team_12_info)
    @team_13 = Team.new(team_13_info)
    @team_14 = Team.new(team_14_info)
    @team_23 = Team.new(team_23_info)
    @team_52 = Team.new(team_52_info)
    @teams = [
              @team_3,
              @team_6,
              @team_10,
              @team_12,
              @team_13,
              @team_14,
              @team_23,
              @team_52
             ]

    game_1_info = {:game_id=>"2012030221", :season=>"20122013", :type=>"R", :date_time=>"2013-05-16", :away_team_id=>"3", :home_team_id=>"6", :away_goals=>"2", :home_goals=>"3", :outcome=>"home win OT", :home_rink_side_start=>"left", :venue=>"TD Garden", :venue_link=>"/api/v1/venues/		null", :venue_time_zone_id=>"America New_York", :venue_time_zone_offset=>"-4", :venue_time_zone_tz=>"EDT"}
    game_2_info = {:game_id=>"2012030222", :season=>"20122013", :type=>"R", :date_time=>"2013-05-19", :away_team_id=>"3", :home_team_id=>"6", :away_goals=>"2", :home_goals=>"5", :outcome=>"home win REG", :home_rink_side_start=>"left", :venue=>"TD Garden", :venue_link=>"/api/v1/venues/		null", :venue_time_zone_id=>"America New_York", :venue_time_zone_offset=>"-4", :venue_time_zone_tz=>"EDT"}
    game_3_info = {:game_id=>"2012030223", :season=>"20122013", :type=>"R", :date_time=>"2013-05-21", :away_team_id=>"6", :home_team_id=>"3", :away_goals=>"2", :home_goals=>"1", :outcome=>"away win REG", :home_rink_side_start=>"right", :venue=>"Madison Square Garden", :venue_link=>"/api/v1/	venues/null", :venue_time_zone_id=>"America/New_York", :venue_time_zone_offset=>"-4", :venue_time_zone_tz=>"EDT"}
    game_4_info = {:game_id=>"2017020830", :season=>"20172018", :type=>"R", :date_time=>"2018-02-09", :away_team_id=>"23", :home_team_id=>"14", :away_goals=>"2", :home_goals=>"5", :outcome=>"home win REG", :home_rink_side_start=>"left", :venue=>"Amalie Arena", :venue_link=>"/api/v1/venues/	null", :venue_time_zone_id=>"America/New_York", :venue_time_zone_offset=>"-4", :venue_time_zone_tz=>"EDT"}
    game_5_info = {:game_id=>"2017020227", :season=>"20172018", :type=>"R", :date_time=>"2017-11-08", :away_team_id=>"13", :home_team_id=>"12", :away_goals=>"1", :home_goals=>"3", :outcome=>"home win REG", :home_rink_side_start=>"right", :venue=>"PNC Arena", :venue_link=>"/api/v1/venues/	null", :venue_time_zone_id=>"America/New_York", :venue_time_zone_offset=>"-4", :venue_time_zone_tz=>"EDT"}
    game_6_info = {:game_id=>"2016020050", :season=>"20162017", :type=>"R", :date_time=>"2016-10-20", :away_team_id=>"10", :home_team_id=>"52", :away_goals=>"4", :home_goals=>"6", :outcome=>"home win OT", :home_rink_side_start=>"right", :venue=>"MTS Centre", :venue_link=>"/api/v1/venues/	null", :venue_time_zone_id=>"America/Winnipeg", :venue_time_zone_offset=>"-5", :venue_time_zone_tz=>"CDT"}

    game_7_info = {:game_id=>"2013020674", :season=>"20132014", :type=>"R", :date_time=>"2014-01-11", :away_team_id=>"19", :home_team_id=>"23", :away_goals=>"1", :home_goals=>"2", :outcome=>"home win REG", :home_rink_side_start=>"right", :venue=>"Rogers Arena", :venue_link=>"/api/v1/venues/null", :venue_time_zone_id=>"America/Vancouver", :venue_time_zone_offset=>"-7", :venue_time_zone_tz=>"PDT"}
    game_8_info = {:game_id=>"2013020221", :season=>"20132014", :type=>"R", :date_time=>"2013-11-06", :away_team_id=>"22", :home_team_id=>"13", :away_goals=>"4", :home_goals=>"1", :outcome=>"home win OT", :home_rink_side_start=>"right", :venue=>"MTS Centre", :venue_link=>"/api/v1/venues/	null", :venue_time_zone_id=>"America/Winnipeg", :venue_time_zone_offset=>"-5", :venue_time_zone_tz=>"CDT"}
    game_9_info = {:game_id=>"2013020727", :season=>"20132014", :type=>"R", :date_time=>"2014-01-19", :away_team_id=>"8", :home_team_id=>"10", :away_goals=>"3", :home_goals=>"2", :outcome=>"home win OT", :home_rink_side_start=>"right", :venue=>"MTS Centre", :venue_link=>"/api/v1/venues/	null", :venue_time_zone_id=>"America/Winnipeg", :venue_time_zone_offset=>"-5", :venue_time_zone_tz=>"CDT"}
    game_10_info = {:game_id=>"2012020381", :season=>"20122013", :type=>"R", :date_time=>"2013-03-12", :away_team_id=>"14", :home_team_id=>"13", :away_goals=>"2", :home_goals=>"5", :outcome=>"home win OT", :home_rink_side_start=>"right", :venue=>"MTS Centre", :venue_link=>"/api/v1/venues/	null", :venue_time_zone_id=>"America/Winnipeg", :venue_time_zone_offset=>"-5", :venue_time_zone_tz=>"CDT"}
    game_11_info = {:game_id=>"2014020548", :season=>"20142015", :type=>"R", :date_time=>"2015-01-01", :away_team_id=>"12", :home_team_id=>"5", :away_goals=>"1", :home_goals=>"7", :outcome=>"home win OT", :home_rink_side_start=>"right", :venue=>"MTS Centre", :venue_link=>"/api/v1/venues/	null", :venue_time_zone_id=>"America/Winnipeg", :venue_time_zone_offset=>"-5", :venue_time_zone_tz=>"CDT"}
    game_12_info = {:game_id=>"2014020016", :season=>"20142015", :type=>"R", :date_time=>"2014-10-10", :away_team_id=>"52", :home_team_id=>"53", :away_goals=>"5", :home_goals=>"1", :outcome=>"home win OT", :home_rink_side_start=>"right", :venue=>"MTS Centre", :venue_link=>"/api/v1/venues/	null", :venue_time_zone_id=>"America/Winnipeg", :venue_time_zone_offset=>"-5", :venue_time_zone_tz=>"CDT"}
    game_13_info = {:game_id=>"test", :season=>"20142015", :type=>"R", :date_time=>"2014-10-10", :away_team_id=>"53", :home_team_id=>"52", :away_goals=>"1", :home_goals=>"0", :outcome=>"home win OT", :home_rink_side_start=>"right", :venue=>"MTS Centre", :venue_link=>"/api/v1/venues/	null", :venue_time_zone_id=>"America/Winnipeg", :venue_time_zone_offset=>"-5", :venue_time_zone_tz=>"CDT"}

    game_14_info = {:game_id=>"test2", :season=>"20122013", :type=>"P", :date_time=>"2013-05-16", :away_team_id=>"3", :home_team_id=>"6", :away_goals=>"4", :home_goals=>"3", :outcome=>"home win OT", :home_rink_side_start=>"left", :venue=>"TD Garden", :venue_link=>"/api/v1/venues/		null", :venue_time_zone_id=>"America New_York", :venue_time_zone_offset=>"-4", :venue_time_zone_tz=>"EDT"}
    game_15_info = {:game_id=>"test3", :season=>"20122013", :type=>"P", :date_time=>"2013-05-19", :away_team_id=>"3", :home_team_id=>"6", :away_goals=>"6", :home_goals=>"2", :outcome=>"home win REG", :home_rink_side_start=>"left", :venue=>"TD Garden", :venue_link=>"/api/v1/venues/		null", :venue_time_zone_id=>"America New_York", :venue_time_zone_offset=>"-4", :venue_time_zone_tz=>"EDT"}
    game_16_info = {:game_id=>"test4", :season=>"20122013", :type=>"P", :date_time=>"2013-05-21", :away_team_id=>"6", :home_team_id=>"3", :away_goals=>"1", :home_goals=>"2", :outcome=>"away win REG", :home_rink_side_start=>"right", :venue=>"Madison Square Garden", :venue_link=>"/api/v1/	venues/null", :venue_time_zone_id=>"America/New_York", :venue_time_zone_offset=>"-4", :venue_time_zone_tz=>"EDT"}
    game_17_info = {:game_id=>"test5", :season=>"20122013", :type=>"P", :date_time=>"2013-05-21", :away_team_id=>"6", :home_team_id=>"3", :away_goals=>"1", :home_goals=>"2", :outcome=>"away win REG", :home_rink_side_start=>"right", :venue=>"Madison Square Garden", :venue_link=>"/api/v1/	venues/null", :venue_time_zone_id=>"America/New_York", :venue_time_zone_offset=>"-4", :venue_time_zone_tz=>"EDT"}

    @game_1 = Game.new(game_1_info)
    @game_2 = Game.new(game_2_info)
    @game_3 = Game.new(game_3_info)
    @game_4 = Game.new(game_4_info)
    @game_5 = Game.new(game_5_info)
    @game_6 = Game.new(game_6_info)
    @game_7 = Game.new(game_7_info)
    @game_8 = Game.new(game_8_info)
    @game_9 = Game.new(game_9_info)
    @game_10 = Game.new(game_10_info)
    @game_11 = Game.new(game_11_info)
    @game_12 = Game.new(game_12_info)
    @game_13 = Game.new(game_13_info)
    @game_14 = Game.new(game_14_info)
    @game_15 = Game.new(game_15_info)
    @game_16 = Game.new(game_16_info)
    @game_17 = Game.new(game_17_info)

    @games = [
              @game_1,
              @game_2,
              @game_3,
              @game_4,
              @game_5,
              @game_6,
              @game_7,
              @game_8,
              @game_9,
              @game_10,
              @game_11,
              @game_12,
              @game_13,
              @game_14,
              @game_15,
              @game_16,
              @game_17
             ]

    @team_stats = TeamStats.new(@teams)
    @team_stat_sorter = TeamStatSorter.new(@games, @teams)
    @team_stat_sorter.sort_team_games
  end

  def test_it_exists
    assert_instance_of TeamStats, @team_stats
  end

  def test_it_has_teams
    assert_equal @teams, @team_stats.teams
  end

  #league stat method tests
  def test_it_calculates_highest_offense
    assert_equal "Jets", @team_stats.highest_offense
  end

  def test_it_calculates_lowest_offense
    assert_equal "Rangers", @team_stats.lowest_offense
  end

  def test_it_calculates_highest_defense
    assert_equal "Maple Leafs", @team_stats.highest_defense
  end

  def test_it_calculates_lowest_defense
    assert_equal "Bruins", @team_stats.lowest_defense
  end

  def test_it_calculates_highest_scoring_away_team
    assert_equal "Jets", @team_stats.highest_scoring_when_away
  end

  def test_it_calculates_highest_scoring_home_team

    assert_equal "Lightning", @team_stats.highest_scoring_when_home
  end

  def test_it_calculates_lowest_scoring_away_team
    assert_equal "Hurricanes", @team_stats.lowest_scoring_when_away
  end

  def test_it_calculates_lowest_scoring_home_team
    assert_equal "Rangers", @team_stats.lowest_scoring_when_home
  end

  def test_it_calculates_highest_league_win_percentage
    assert_equal "Bruins", @team_stats.highest_win_percentage
  end

  def test_it_calculates_best_fans
    assert_equal "Hurricanes", @team_stats.highest_fans_rating
  end

  def test_it_lists_bad_fan_teams
    assert_equal ["Jets"], @team_stats.bad_fan_teams
  end

  #Season stat method tests
  def test_it_calculates_highest_offense
    assert_equal "Jets", @team_stats.highest_offense
  end

end
