class FileConverter

  attr_reader :file

  def initialize(file)
    @file = file
  end

  def determine_file
    headers = CSV.readlines(file)[0]
  end

  def parse_csv(file)
    CSV.open(file, headers: true, header_converters: :symbol)
  end

  def info_hash
    # full_hash = {}
    csv_contents = parse_csv(file)
    # header_array = full_array.shift
    csv_contents.each do |row|

    end
    # full_array.each do |data_array|
    #   index = 0
    #   inner_hash = {}
    #   data_array.each do |data|
    #     inner_hash[header_array[index].to_sym] = data
    #     index += 1
    #   end
    #   full_hash[data_array[0].to_sym] = inner_hash
    # end
    # full_hash
  end

end
