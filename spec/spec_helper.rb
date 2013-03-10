require "rspec"
require "svg_palette"

def fixture(path)
  File.read("spec/fixtures/#{path}")
end
