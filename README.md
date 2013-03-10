## SVG Palette

Parse an SVG to discover which colors it contains.

## Usage

```ruby
require "svg_palette"

SVGPalette.parse(File.read("flag_of_togo.svg"))
#=> [RGB [#006a4e], RGB [#ffce00], RGB [#d21034], RGB [#ffffff]]
```

The array contains instances of [Color](http://rubydoc.info/gems/color/1.4.1/frames).

## Properties

The following properties are considered:

```
fill stroke stop-color flood-color lighting-color style
```

When checking style rules, only the keys for those properties are considered, e.g:

```xml
<foo style="fill:red"></foo>
```
