class StatTracker
  attr_reader :locations

  def initialize(locations)
    @locations = locations
    #@game_info = file_converter.new(locations[:games]).game_info_converter
  end

  def self.from_csv(locations)
    StatTracker.new(locations)
  end

end
