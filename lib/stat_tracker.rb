class StatTracker
  attr_reader :files

  def initialize(files)
    @files = files
  end

  def self.from_csv(files)
    new(files)
  end

  def convert_files
    FileConverter.new(files)
  end

end
