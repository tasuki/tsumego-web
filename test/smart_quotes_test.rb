require 'minitest/autorun'
require_relative '../lib/smart_quotes'

class SmartQuotesTest < Minitest::Test
  def test_plain_haml_text
    assert_equal '<p>A “small” library of Cho’s books.</p>',
                 SmartQuotes.render(%q{<p>A "small" library of Cho's books.</p>})
  end

  def test_escaped_front_matter_text
    assert_equal '<p>“Cho’s” books aren’t successive levels.</p>',
                 SmartQuotes.render('<p>&quot;Cho&#39;s&quot; books aren&#39;t successive levels.</p>')
  end

  def test_other_quote_entity_spellings
    assert_equal '<p>“Cho’s” “Cho’s”</p>',
                 SmartQuotes.render('<p>&#34;Cho&apos;s&#34; &#x22;Cho&#x27;s&#x22;</p>')
  end

  def test_attributes_and_comments_are_unchanged
    html = %q{<!-- "don't" --><a href="/books/cho-1-elementary.pdf" title="Cho&#39;s books">Cho&#39;s books</a>}
    assert_equal html.sub('>Cho&#39;s books', '>Cho’s books'), SmartQuotes.render(html)
  end

  def test_code_and_scripts_are_unchanged
    %w[pre code kbd script style math].each do |tag|
      html = %Q{<#{tag}>"don't" &quot;Cho&#39;s&quot;</#{tag}>}
      assert_equal html, SmartQuotes.render(html)
    end
  end

  def test_other_entities_and_punctuation_are_unchanged
    html = '<p>&lt;tag&gt; &amp; -- ...</p>'
    assert_equal html, SmartQuotes.render(html)
  end

  def test_existing_markdown_quotes_are_unchanged
    html = '<p>“Cho’s books” and &#8220;Cho&#8217;s books&#8221;</p>'
    assert_equal html, SmartQuotes.render(html)
  end
end
