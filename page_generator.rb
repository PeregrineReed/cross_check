class PageGenerator

  attr_reader :template

  def initialize(template)
    @template = template
  end

  def render
    ERB.new(template).result(binding)
  end

end
