class PageGenerator

  attr_reader :template,
              :file_path

  def initialize(template)
    @template = template

    ENV['SITE'] = ENV['PWD'] + '/site'
    @file_path = File.join(ENV['SITE'], 'index.html'
    )
  end

  def render
    ERB.new(template).result(binding)
  end

end
