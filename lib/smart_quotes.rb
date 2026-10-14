require 'rubypants'

class SmartQuotes < RubyPants
  def self.render(html)
    new(html, [:quotes, :character_entities]).to_html
  end

  protected

  def process_escapes(text)
    # Haml escapes quotes in interpolated/front-matter text. Decode only quote
    # entities, inside RubyPants' text processing, so attributes and code stay
    # untouched and entities such as &lt; cannot become HTML tags.
    text = text.gsub(/&(?:quot|#0*34|#x0*22);/i, '"')
               .gsub(/&(?:apos|#0*39|#x0*27);/i, "'")
    super(text)
  end
end
