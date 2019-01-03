require './test/test_helper'
require './lib/game'
require './lib/team'
require './lib/file_converter'
require 'csv'

class FileConverterTest < Minitest::Test

  def setup
    @games_data = './test/test_data/game_test.csv'
    @teams_data = './test/test_data/team_info_test.csv'

    @files = {
      games: @games_data,
      teams: @teams_data,
    }

    @file_converter = FileConverter.new(@files)
  end

  def test_it_exists
    assert_instance_of FileConverter, @file_converter
  end

  def test_it_has_files
    assert_equal @games_data, @file_converter.games_file
    assert_equal @teams_data, @file_converter.teams_file
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

end
