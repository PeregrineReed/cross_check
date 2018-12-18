require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require './lib/file_converter'
require './lib/games'

class GamesTest < Minitest::Test

  def setup
    @file_name = './data/game_test.csv'
    @file_converter = FileConverter.new(@file_name)
    @games = Games.new(@file_converter.info_hash(@file_name))
  end

  def test_it_exists
    assert_instance_of Games, @games
  end

end
