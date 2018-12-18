require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_converter'
require 'csv'

class FileConverterTest < Minitest::Test

  def test_it_exists
    file_name = './data/game_test.csv'
    file_converter = FileConverter.new(file_name)

    assert_instance_of FileConverter, file_converter
  end


  def test_it_can_parse_lines_into_array
    file_name = './data/game_test.csv'
    file_converter = FileConverter.new(file_name)
    line_data = [["game_id","season","type","date_time","away_team_id","home_team_id","away_goals","home_goals","outcome","home_rink_side_start","venue","venue_link","venue_time_zone_id","venue_time_zone_offset","venue_time_zone_tz"],
    ["2012030221","20122013","P","2013-05-16","3","6","2","3","home win OT","left","TD Garden","/api/v1/venues/null","America/New_York","-4","EDT"],
    ["2012030222","20122013","P","2013-05-19","3","6","2","5","home win REG","left","TD Garden","/api/v1/venues/null","America/New_York","-4","EDT"]]

    assert_equal line_data, file_converter.parse_csv(file_name)
  end

  def test_it_makes_a_hash_of_data
    file_name = './data/game_test.csv'
    file_converter = FileConverter.new(file_name)
    line_data = [["game_id","season","type","date_time","away_team_id","home_team_id","away_goals","home_goals","outcome","home_rink_side_start","venue","venue_link","venue_time_zone_id","venue_time_zone_offset","venue_time_zone_tz"],
    ["2012030221","20122013","P","2013-05-16","3","6","2","3","home win OT","left","TD Garden","/api/v1/venues/null","America/New_York","-4","EDT"],
    ["2012030222","20122013","P","2013-05-19","3","6","2","5","home win REG","left","TD Garden","/api/v1/venues/null","America/New_York","-4","EDT"]]

    hash = file_converter.info_hash(line_data)
    # assert_equal {2012030221: {game_id: "2012030221"}, season: "20122013", }
    assert_equal "20122013", hash[:"2012030221"][:season]
    assert_equal "2013-05-19", hash[:"2012030222"][:date_time]
    assert_equal "6", hash[:"2012030222"][:home_team_id]
  end

end
