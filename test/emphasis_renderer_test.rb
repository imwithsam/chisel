require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/emphasis_renderer'

class EmphasisRendererTest < MiniTest::Test
  def test_renders_emphasis
    input = "I want to *emphasize* this."
    expected = "I want to <em>emphasize</em> this."

    actual = EmphasisRenderer.render(input)

    assert_equal expected, actual
  end
end
