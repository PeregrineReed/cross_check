require './test/test_helper'
require './lib/game'
require './lib/team'
require './lib/file_converter'
require 'csv'

class FileConverterTest < Minitest::Test

  def setup
    @games_data = './test/test_data/game_test.csv'
    @teams_data = './test/test_data/team_info_test.csv'
    @game_teams_data = './test/test_data/game_teams_stats_test.csv'

    @files = {
      games: @games_data,
      teams: @teams_data,
      game_teams: @game_teams_data
    }

    @file_converter = FileConverter.new(@files)
  end

  def test_it_exists
    assert_instance_of FileConverter, @file_converter
  end

  def test_it_has_games
    all_games = @file_converter.games.all? do |game|
      game.class == Game
    end

    assert_equal true, all_games
  end

  def test_it_has_teams
    all_teams = @file_converter.teams.all? do |team|
      team.class == Team
    end
    
    assert_equal true, all_teams
  end

  # def test_it_can_parse_lines_into_array
  #     require 'pry';binding.pry
  #   line_data = [
  #     [
  #       "2012030221",
  #       "20122013",
  #       "P",
  #       "2013-05-16",
  #       "3",
  #       "6",
  #       "2",
  #       "3",
  #       "home win OT",
  #       "left",
  #       "TD Garden",
  #       "/api/v1/venues/null",
  #       "America/New_York",
  #       "-4",
  #       "EDT"
  #     ],
  #     [
  #       "2012030222",
  #       "20122013",
  #       "P",
  #       "2013-05-19",
  #       "3",
  #       "6",
  #       "2",
  #       "5",
  #       "home win REG",
  #       "left",
  #       "TD Garden",
  #       "/api/v1/venues/null",
  #       "America/New_York",
  #       "-4",
  #       "EDT"
  #     ],
  #     [
  #       "2012030223",
  #       "20122013",
  #       "P",
  #       "2013-05-21",
  #       "6",
  #       "3",
  #       "2",
  #       "1",
  #       "away win REG",
  #       "right",
  #       "Madison Square Garden",
  #       "/api/v1/venues/null",
  #       "America/New_York",
  #       "-4",
  #       "EDT"
  #     ],
  #     [
  #       "2017020830",
  #       "20172018",
  #       "R",
  #       "2018-02-09",
  #       "23",
  #       "14",
  #       "2",
  #       "5",
  #       "home win REG",
  #       "left",
  #       "Amalie Arena",
  #       "/api/v1/venues/null",
  #       "America/New_York",
  #       "-4",
  #       "EDT"
  #     ],
  #     [
  #       "2017020227",
  #       "20172018",
  #       "R",
  #       "2017-11-08",
  #       "13",
  #       "12",
  #       "1",
  #       "3",
  #       "home win REG",
  #       "right",
  #       "PNC Arena",
  #       "/api/v1/venues/null",
  #       "America/New_York",
  #       "-4",
  #       "EDT"
  #     ],
  #     [
  #       "2016020050",
  #       "20162017",
  #       "R",
  #       "2016-10-20",
  #       "10",
  #       "52",
  #       "4",
  #       "5",
  #       "home win OT",
  #       "right",
  #       "MTS Centre",
  #       "/api/v1/venues/null",
  #       "America/Winnipeg",
  #       "-5",
  #       "CDT"
  #     ]
  #   ]
  #
  #   assert_equal line_data, @file_converter.parse_csv(@games_data)
  # end

  # def test_it_makes_a_hash_of_data
  #   skip
  #   file_name = './data/game_test.csv'
  #   file_converter = FileConverter.new(file_name)
  #   line_data = [["game_id","season","type","date_time","away_team_id","home_team_id","away_goals","home_goals","outcome","home_rink_side_start","venue","venue_link","venue_time_zone_id","venue_time_zone_offset","venue_time_zone_tz"],
  #   ["2012030221","20122013","P","2013-05-16","3","6","2","3","home win OT","left","TD Garden","/api/v1/venues/null","America/New_York","-4","EDT"],
  #   ["2012030222","20122013","P","2013-05-19","3","6","2","5","home win REG","left","TD Garden","/api/v1/venues/null","America/New_York","-4","EDT"]]
  #
  #   hash = file_converter.info_hash(file_name)
  #   #require 'pry';binding.pry
  #   assert_equal "20122013", hash[:"2012030221"][:season]
  #   assert_equal "2013-05-19", hash[:"2012030222"][:date_time]
  #   assert_equal "6", hash[:"2012030222"][:home_team_id]
  # end

end
