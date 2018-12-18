require 'minitest/autorun'
require 'minitest/pride'
require './lib/stat_tracker'
require 'csv'

class FileConverterTest < Minitest::Test

  def test_it_exists
    file_converter = FileConverter.new(file_name)

    assert_instance_of FireConverter, file_converter
  end
end
