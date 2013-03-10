Gem::Specification.new do |s|
  s.name        = "svg_palette"
  s.version     = "1.0.0"
  s.summary     = "SVG Palette"
  s.description = "Parse an SVG to discover which colors it contains."
  s.author      = "Chris Patuzzo"
  s.email       = "chris@patuzzo.co.uk"
  s.homepage    = "https://github.com/cpatuzzo/svg_palette"
  s.files       = ["README.md"] + Dir["lib/**/*.*"]

  s.add_dependency "nokogiri"
  s.add_dependency "css_color"

  s.add_development_dependency "rspec"
end
