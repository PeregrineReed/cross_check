class StatTracker
  attr_reader :locations

  def initialize(locations)
    @locations = locations
  end

  def self.from_csv(locations)
    new(locations)
  end

end
