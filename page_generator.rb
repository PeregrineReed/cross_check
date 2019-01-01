class PageGenerator

  attr_reader :template,
              :file_path

  def initialize(template)
    @template = File.open(template, 'rb', &:read)

    ENV['SITE'] = ENV['PWD'] + '/site'
    @file_path = File.join(ENV['SITE'], 'index.html'
    )
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
