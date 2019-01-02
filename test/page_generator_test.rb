require './test/test_helper'
require './lib/game'
require './lib/game_stats'
require './lib/team'
require './lib/season'
require './lib/team_stats'
require './lib/stat_sorter'
require './lib/league_stats'
require './lib/file_converter'
require './lib/stat_tracker'
require './page_generator'
require 'csv'
require 'erb'

class PageGeneratorTest < Minitest::Test

  def setup
    @games_path = './test/test_data/game_test.csv'
    @teams_path = './test/test_data/team_info_test.csv'
    @game_teams_path = './test/test_data/game_teams_stats_test.csv'
    @files = {
    games: @games_path,
    teams: @teams_path,
    game_teams: @game_teams_path
    }

    @template = './site/template.erb'
    @page_generator = PageGenerator.new(@template, @files)
  end

  def test_it_exists
    assert_instance_of PageGenerator, @page_generator
  end

  def test_it_has_a_template
    expected = File.open(@template, 'rb', &:read)
    assert_equal expected, @page_generator.template
  end

  def test_it_has_a_stat_tracker
    assert_instance_of StatTracker, @page_generator.stat_tracker
  end

  def test_it_has_a_file_path
    expected = ENV['PWD'] + '/site/index.html'

    assert_equal expected, @page_generator.file_path
  end

  def test_it_can_render_its_template
    assert_instance_of String, @page_generator.render
  end

  def test_can_save_its_rendered_template
    time_of_test = Time.now.to_s
    @page_generator.save
    expected = File.mtime('./site/index.html').to_s

    check_for_file_mod = expected == time_of_test
    assert_equal true, check_for_file_mod
  end

end
