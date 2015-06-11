require './test/test_helper'
require './lib/emphasis_renderer'

class EmphasisRendererTest < MiniTest::Test
  def test_renders_emphasized_text
    input = "*emphasize*"
    expected = "<em>emphasize</em>"

    actual = EmphasisRenderer.render(input)

    assert_equal expected, actual
  end

  def test_renders_prepended_emphasized_text
    input = "I want to *emphasize*"
    expected = "I want to <em>emphasize</em>"

    actual = EmphasisRenderer.render(input)

    assert_equal expected, actual
  end

  def test_renders_bookended_emphasized_text
    input = "I want to *emphasize* this."
    expected = "I want to <em>emphasize</em> this."

    actual = EmphasisRenderer.render(input)

    assert_equal expected, actual
  end
end

