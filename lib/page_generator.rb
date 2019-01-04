class PageGenerator

  attr_reader :template,
              :stat_tracker,
              :file_path

  def initialize(template, files)
    @template = File.open(template, 'rb', &:read)
    @stat_tracker = StatTracker.from_csv(files)

    ENV['SITE'] = ENV['PWD'] + '/site'
    @file_path = File.join(ENV['SITE'], 'index.html')
  end

  def render
    ERB.new(template).result(binding)
  end

  def save
    File.open(file_path, "w+") do |file|
      file.write(render)
    end
  end

end
