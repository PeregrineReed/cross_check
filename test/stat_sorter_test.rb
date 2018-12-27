require './test/test_helper'
require './lib/stat_sorter'

class StatSorterTest < Minitest::Test

  def setup
    games = mock
    teams = mock
    @stat_sorter = StatSorter.new(games, teams)
  end

  def test_it_exists
    assert_instance_of StatSorter, @stat_sorter
  end

end
