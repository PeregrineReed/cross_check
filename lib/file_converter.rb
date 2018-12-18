class FileConverter

  def initialize(file_name)
    @file_name = file_name
  end

  def info_hash(file_name)
    header_array = parse_csv(file_name)[0]
    
  end

  def parse_csv(file_name)
    CSV.readlines(file_name)
  end

end
