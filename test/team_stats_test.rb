require './test/test_helper'
require './lib/team'
require './lib/game'
require './lib/stat_sorter'
require './lib/team_stats'

class TeamRepo < StatSorter

  include TeamStats

  attr_reader :games,
              :teams

  def initialize(games, teams)
    super(games, teams)
  end

end

class TeamStatsTest < Minitest::Test

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

    team_10_info = {
      team_id: "10",
      franchiseid: "5",
      shortname: "Toronto",
      teamname: "Maple Leafs",
      abbreviation: "TOR",
      link: "/api/v1/teams/10"
    }

    team_12_info = {
      team_id: "12",
      franchiseid: "26",
      shortname: "Carolina",
      teamname: "Hurricanes",
      abbreviation: "CAR",
      link: "/api/v1/teams/12"
    }

    team_13_info = {
      team_id: "13",
      franchiseid: "33",
      shortname: "Florida",
      teamname: "Panthers",
      abbreviation: "FLA",
      link: "/api/v1/teams/13"
    }

    team_14_info = {
      team_id: "14",
      franchiseid: "31",
      shortname: "Tampa Bay",
      teamname: "Lightning",
      abbreviation: "TBL",
      link: "/api/v1/teams/14"
    }

    team_23_info = {
      team_id: "23",
      franchiseid: "20",
      shortname: "Vancouver",
      teamname: "Canucks",
      abbreviation: "VAN",
      link: "/api/v1/teams/23"
    }

    team_52_info = {
      team_id: "52",
      franchiseid: "35",
      shortname: "Winnipeg",
      teamname: "Jets",
      abbreviation: "WPG",
      link: "/api/v1/teams/52"
    }

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

   game_1_info = {
     :game_id=>"2012030221",
     :season=>"20122013",
     :type=>"R",
     :date_time=>"2013-05-16",
     :away_team_id=>"3",
     :home_team_id=>"6",
     :away_goals=>"2",
     :home_goals=>"3",
     :outcome=>"home win OT",
     :home_rink_side_start=>"left",
     :venue=>"TD Garden",
     :venue_link=>"/api/v1/venues/		null",
     :venue_time_zone_id=>"America new_York",
     :venue_time_zone_offset=>"-4",
     :venue_time_zone_tz=>"EDT"
   }

   game_2_info = {
     :game_id=>"2012030222",
     :season=>"20122013",
     :type=>"R",
     :date_time=>"2013-05-19",
     :away_team_id=>"3",
     :home_team_id=>"6",
     :away_goals=>"2",
     :home_goals=>"5",
     :outcome=>"home win REG",
     :home_rink_side_start=>"left",
     :venue=>"TD Garden",
     :venue_link=>"/api/v1/venues/		null",
     :venue_time_zone_id=>"America new_York",
     :venue_time_zone_offset=>"-4",
     :venue_time_zone_tz=>"EDT"
   }

   game_3_info = {
     :game_id=>"2012030223",
     :season=>"20122013",
     :type=>"R",
     :date_time=>"2013-05-21",
     :away_team_id=>"6",
     :home_team_id=>"3",
     :away_goals=>"2",
     :home_goals=>"1",
     :outcome=>"away win REG",
     :home_rink_side_start=>"right",
     :venue=>"Madison Square Garden",
     :venue_link=>"/api/v1/	venues/null",
     :venue_time_zone_id=>"America/new_York",
     :venue_time_zone_offset=>"-4",
     :venue_time_zone_tz=>"EDT"
   }

   game_4_info = {
     :game_id=>"2017020830",
     :season=>"20172018",
     :type=>"R",
     :date_time=>"2018-02-09",
     :away_team_id=>"23",
     :home_team_id=>"14",
     :away_goals=>"2",
     :home_goals=>"5",
     :outcome=>"home win REG",
     :home_rink_side_start=>"left",
     :venue=>"Amalie Arena",
     :venue_link=>"/api/v1/venues/	null",
     :venue_time_zone_id=>"America/new_York",
     :venue_time_zone_offset=>"-4",
     :venue_time_zone_tz=>"EDT"
   }

   game_5_info = {
     :game_id=>"2017020227",
     :season=>"20172018",
     :type=>"R",
     :date_time=>"2017-11-08",
     :away_team_id=>"13",
     :home_team_id=>"12",
     :away_goals=>"1",
     :home_goals=>"3",
     :outcome=>"home win REG",
     :home_rink_side_start=>"right",
     :venue=>"PnC Arena",
     :venue_link=>"/api/v1/venues/	null",
     :venue_time_zone_id=>"America/new_York",
     :venue_time_zone_offset=>"-4",
     :venue_time_zone_tz=>"EDT"
   }

   game_6_info = {
     :game_id=>"2016020050",
     :season=>"20162017",
     :type=>"R",
     :date_time=>"2016-10-20",
     :away_team_id=>"10",
     :home_team_id=>"52",
     :away_goals=>"4",
     :home_goals=>"6",
     :outcome=>"home win OT",
     :home_rink_side_start=>"right",
     :venue=>"MTS Centre",
     :venue_link=>"/api/v1/venues/	null",
     :venue_time_zone_id=>"America/Winnipeg",
     :venue_time_zone_offset=>"-5",
     :venue_time_zone_tz=>"CDT"
   }

   game_7_info = {
     :game_id=>"2013020674",
     :season=>"20132014",
     :type=>"R",
     :date_time=>"2014-01-11",
     :away_team_id=>"52",
     :home_team_id=>"23",
     :away_goals=>"1",
     :home_goals=>"2",
     :outcome=>"home win REG",
     :home_rink_side_start=>"right",
     :venue=>"Rogers Arena",
     :venue_link=>"/api/v1/venues/null",
     :venue_time_zone_id=>"America/Vancouver",
     :venue_time_zone_offset=>"-7",
     :venue_time_zone_tz=>"PDT"
   }

   game_8_info = {
     :game_id=>"2013020221",
     :season=>"20132014",
     :type=>"R",
     :date_time=>"2013-11-06",
     :away_team_id=>"23",
     :home_team_id=>"13",
     :away_goals=>"4",
     :home_goals=>"1",
     :outcome=>"home win OT",
     :home_rink_side_start=>"right",
     :venue=>"MTS Centre",
     :venue_link=>"/api/v1/venues/	null",
     :venue_time_zone_id=>"America/Winnipeg",
     :venue_time_zone_offset=>"-5",
     :venue_time_zone_tz=>"CDT"
   }

   game_9_info = {
     :game_id=>"2013020727",
     :season=>"20132014",
     :type=>"R",
     :date_time=>"2014-01-19",
     :away_team_id=>"12",
     :home_team_id=>"10",
     :away_goals=>"3",
     :home_goals=>"2",
     :outcome=>"home win OT",
     :home_rink_side_start=>"right",
     :venue=>"MTS Centre",
     :venue_link=>"/api/v1/venues/	null",
     :venue_time_zone_id=>"America/Winnipeg",
     :venue_time_zone_offset=>"-5",
     :venue_time_zone_tz=>"CDT"
   }

   game_10_info = {
     :game_id=>"2012020381",
     :season=>"20122013",
     :type=>"R",
     :date_time=>"2013-03-12",
     :away_team_id=>"14",
     :home_team_id=>"13",
     :away_goals=>"2",
     :home_goals=>"5",
     :outcome=>"home win OT",
     :home_rink_side_start=>"right",
     :venue=>"MTS Centre",
     :venue_link=>"/api/v1/venues/	null",
     :venue_time_zone_id=>"America/Winnipeg",
     :venue_time_zone_offset=>"-5",
     :venue_time_zone_tz=>"CDT"
   }

   game_11_info = {
     :game_id=>"2014020548",
     :season=>"20142015",
     :type=>"R",
     :date_time=>"2015-01-01",
     :away_team_id=>"12",
     :home_team_id=>"6",
     :away_goals=>"1",
     :home_goals=>"7",
     :outcome=>"home win OT",
     :home_rink_side_start=>"right",
     :venue=>"MTS Centre",
     :venue_link=>"/api/v1/venues/	null",
     :venue_time_zone_id=>"America/Winnipeg",
     :venue_time_zone_offset=>"-5",
     :venue_time_zone_tz=>"CDT"
   }

   game_12_info = {
     :game_id=>"2014020016",
     :season=>"20142015",
     :type=>"R",
     :date_time=>"2014-10-10",
     :away_team_id=>"52",
     :home_team_id=>"23",
     :away_goals=>"5",
     :home_goals=>"1",
     :outcome=>"home win OT",
     :home_rink_side_start=>"right",
     :venue=>"MTS Centre",
     :venue_link=>"/api/v1/venues/	null",
     :venue_time_zone_id=>"America/Winnipeg",
     :venue_time_zone_offset=>"-5",
     :venue_time_zone_tz=>"CDT"
   }

   game_13_info = {
     :game_id=>"test",
     :season=>"20142015",
     :type=>"R",
     :date_time=>"2014-10-10",
     :away_team_id=>"3",
     :home_team_id=>"52",
     :away_goals=>"1",
     :home_goals=>"0",
     :outcome=>"home win OT",
     :home_rink_side_start=>"right",
     :venue=>"MTS Centre",
     :venue_link=>"/api/v1/venues/	null",
     :venue_time_zone_id=>"America/Winnipeg",
     :venue_time_zone_offset=>"-5",
     :venue_time_zone_tz=>"CDT"
   }

   game_14_info = {
     :game_id=>"test2",
     :season=>"20122013",
     :type=>"P",
     :date_time=>"2013-05-16",
     :away_team_id=>"3",
     :home_team_id=>"6",
     :away_goals=>"4",
     :home_goals=>"3",
     :outcome=>"home win OT",
     :home_rink_side_start=>"left",
     :venue=>"TD Garden",
     :venue_link=>"/api/v1/venues/		null",
     :venue_time_zone_id=>"America new_York",
     :venue_time_zone_offset=>"-4",
     :venue_time_zone_tz=>"EDT"
   }

   game_15_info = {
     :game_id=>"test3",
     :season=>"20122013",
     :type=>"P",
     :date_time=>"2013-05-19",
     :away_team_id=>"3",
     :home_team_id=>"6",
     :away_goals=>"6",
     :home_goals=>"2",
     :outcome=>"home win REG",
     :home_rink_side_start=>"left",
     :venue=>"TD Garden",
     :venue_link=>"/api/v1/venues/		null",
     :venue_time_zone_id=>"America new_York",
     :venue_time_zone_offset=>"-4",
     :venue_time_zone_tz=>"EDT"
   }

   game_16_info = {
     :game_id=>"test4",
     :season=>"20122013",
     :type=>"P",
     :date_time=>"2013-05-21",
     :away_team_id=>"6",
     :home_team_id=>"3",
     :away_goals=>"1",
     :home_goals=>"2",
     :outcome=>"away win REG",
     :home_rink_side_start=>"right",
     :venue=>"Madison Square Garden",
     :venue_link=>"/api/v1/	venues/null",
     :venue_time_zone_id=>"America/new_York",
     :venue_time_zone_offset=>"-4",
     :venue_time_zone_tz=>"EDT"
   }

   game_17_info = {
     :game_id=>"test5",
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
     :venue_time_zone_id=>"America/new_York",
     :venue_time_zone_offset=>"-4",
     :venue_time_zone_tz=>"EDT"
    }

    game_18_info = {
      :game_id=>"test6",
      :season=>"20142015",
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
      :venue_time_zone_id=>"America/new_York",
      :venue_time_zone_offset=>"-4",
      :venue_time_zone_tz=>"EDT"
     }

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
    @game_18 = Game.new(game_18_info)

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
      @game_17,
      @game_18
     ]

    @team_stats = TeamRepo.new(@games, @teams)
    @team_stats.add_seasons_to_teams
    @team_stats.update_stats
  end

  def test_it_includes_league_stats_module
    expected = TeamRepo.included_modules.include?(TeamStats)
    assert_equal true, expected
  end

  def test_it_has_games
    assert_equal @games, @team_stats.games
  end

  def test_it_has_teams
    assert_equal @teams, @team_stats.teams
  end

  def test_it_makes_single_season_summary
    expected = {
      preseason:
        {
          win_percentage: 0.75,
          total_goals_scored: 13,
          total_goals_against: 8,
          average_goals_scored: 3.25,
          average_goals_against: 2.0
        },
      regular_season:
        {
          win_percentage: 0.0,
          total_goals_scored: 5,
          total_goals_against: 10,
          average_goals_scored: 1.67,
          average_goals_against: 3.33
        }
      }
    assert_equal expected, @team_stats.single_seasonal_summary(@team_3, "20122013")
  end

  def test_it_makes_seasonal_summary
    expected = {
      "20122013" =>
        {
          preseason:
            {
              :win_percentage=>0.75,
              :total_goals_scored=>13,
              :total_goals_against=>8,
              :average_goals_scored=>3.25,
              :average_goals_against=>2.0
            },
          regular_season:
            {
              :win_percentage=>0.0,
              :total_goals_scored=>5,
              :total_goals_against=>10,
              :average_goals_scored=>1.67,
              :average_goals_against=>3.33
            }
          },
      "20142015" =>
        {
          preseason:
            {
              :win_percentage=>0,
              :total_goals_scored=>1,
              :total_goals_against=>2,
              :average_goals_scored=>1.0,
              :average_goals_against=>2.0
            },
          regular_season:
            {
              :win_percentage=>1.0,
              :total_goals_scored=>1,
              :total_goals_against=>0,
              :average_goals_scored=>1.0,
              :average_goals_against=>0.0
            }
        }
      }
    assert_equal expected, @team_stats.seasonal_summary("3")
  end

end
