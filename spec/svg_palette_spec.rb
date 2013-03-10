require "spec_helper"

describe SVGPalette do

  it "returns an array containing the colours contained in the SVG string" do
    hex = SVGPalette.parse(fixture("bezier.svg")).map(&:html)
    hex.should =~ ["#000000", "#ff0000", "#008000", "#0000ff"]

    hex = SVGPalette.parse(fixture("circle.svg")).map(&:html)
    hex.should =~ ["#000000", "#ff0000"]

    hex = SVGPalette.parse(fixture("dashes.svg")).map(&:html)
    hex.should =~ ["#000000"]

    hex = SVGPalette.parse(fixture("ellipses.svg")).map(&:html)
    hex.should =~ ["#00ff00", "#800080", "#ffff00"]

    hex = SVGPalette.parse(fixture("rectangle.svg")).map(&:html)
    hex.should =~ ["#000000", "#ff0000"]

    hex = SVGPalette.parse(fixture("togo.svg")).map(&:html)
    hex.should =~ ["#006a4e", "#d21034", "#ffce00", "#ffffff"]
  end

end
