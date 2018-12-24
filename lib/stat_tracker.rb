class StatTracker
  attr_reader :files

  def initialize(files)
    @files = files
  end

  def self.from_csv(files)
    new(files)
  end

end
