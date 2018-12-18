class FileConverter

  def initialize(file_name)
    @file_name = file_name
  end

  def parse_csv(file_name)
    CSV.readlines(file_name)
  end


  def info_hash(file_name)
    full_hash = {}
    full_array = parse_csv(file_name)
    header_array = full_array.shift

    full_array.each do |data_array|
      index = 0
      inner_hash = {}
      data_array.each do |data|
        inner_hash[header_array[index].to_sym] = data
        index += 1
      end
      full_hash[data_array[0].to_sym] = inner_hash
    end
    full_hash
  end

end
