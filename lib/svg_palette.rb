require "nokogiri"
require "css_color"

class SVGPalette

  PROPERTIES = %w(
    fill stroke stop-color flood-color lighting-color style
  ).freeze

  def initialize(xml_string)
    @xml = Nokogiri::XML(xml_string)
  end

  def self.parse(xml_string)
    new(xml_string).parse
  end

  def parse
    squash(values.map { |v| CSSColor.parse(v) rescue nil })
  end

  private
  def values
    squash(property_values.map { |v| css_rule?(v) ? css_values(v) : v })
  end

  def property_values
    squash(PROPERTIES.map { |p| nodes.map { |n| n.attr(p) } })
  end

  def nodes
    matcher = lambda { |attr| "//*[@#{attr}]" }
    query = PROPERTIES.map(&matcher).join("|")

    @xml.xpath(query)
  end

  def css_rule?(string)
    string =~ /:/
  end

  def css_values(string)
    rules = string.split(";")
    rules.map do |rule|
      key, value = rule.split(":")
      value if PROPERTIES.include?(key)
    end
  end

  def squash(array)
    array.flatten.compact.uniq
  end

end
